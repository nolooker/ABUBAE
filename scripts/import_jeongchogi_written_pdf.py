from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path

from pypdf import PdfReader


SUBJECT_RANGES = [
    (1, 20, "소프트웨어 설계"),
    (21, 40, "소프트웨어 개발"),
    (41, 60, "데이터베이스 구축"),
    (61, 80, "프로그래밍 언어 활용"),
    (81, 100, "정보시스템 구축관리"),
]


@dataclass
class Question:
    number: int
    subject: str
    content: str
    choices: list[str]
    answer: int


def subject_for_number(number: int) -> str:
    for start, end, subject in SUBJECT_RANGES:
        if start <= number <= end:
            return subject
    return "정보처리기사 필기"


def clean_text(text: str) -> str:
    text = text.replace("\r", "\n")
    text = re.sub(r"회\d+(?:,\s*\d+)?\s*\n-\s*\d+\s*-\s*", "\n", text)
    text = re.sub(r"저작권 안내[\s\S]*$", "", text)
    text = text.replace("※", "")
    text = re.sub(r"다음 문제를 읽고 알맞은 것을 골라 답안카드의\s*답란 에 표기하시오\([^)]*\)\s*\.", "", text)
    text = re.sub(r"제\s*과목\s*[^\n]+", "", text)
    text = re.sub(r"\n+", "\n", text)
    text = re.sub(r"[ \t]+", " ", text)
    return text.strip()


def parse_answer_map(answer_page_text: str) -> dict[int, int]:
    normalized = answer_page_text
    normalized = normalized.replace("①", "1").replace("②", "2").replace("③", "3").replace("④", "4")
    pairs = re.findall(r"(\d{1,3})\.\s*([1-4])", normalized)
    answer_map = {int(number): int(answer) for number, answer in pairs}
    if len(answer_map) < 100:
        raise ValueError(f"정답표 파싱 실패: {len(answer_map)}개만 인식했습니다.")
    return answer_map


def split_question_blocks(body_text: str) -> list[tuple[int, str]]:
    matches = list(re.finditer(r"(?<!\d)(\d{1,3})\.\s", body_text))
    blocks: list[tuple[int, str]] = []
    for idx, match in enumerate(matches):
      number = int(match.group(1))
      start = match.end()
      end = matches[idx + 1].start() if idx + 1 < len(matches) else len(body_text)
      block = body_text[start:end].strip()
      if 1 <= number <= 100:
          blocks.append((number, block))
    return blocks


def parse_question_block(number: int, block: str, answer_map: dict[int, int]) -> Question:
    if "①" not in block or "②" not in block or "③" not in block or "④" not in block:
        raise ValueError(f"{number}번 문제에서 보기 구분자를 찾지 못했습니다.")

    parts = re.split(r"①|②|③|④", block)
    content = re.sub(r"\s+", " ", parts[0]).strip(" ?")
    choices_raw = parts[1:5]
    choices = [re.sub(r"\s+", " ", item).strip(" ?") for item in choices_raw]

    return Question(
        number=number,
        subject=subject_for_number(number),
        content=content,
        choices=choices,
        answer=answer_map[number],
    )


def build_sql(questions: list[Question], *, year: int, round_value: int, source_label: str) -> str:
    question_rows: list[str] = []
    choice_rows: list[str] = []

    for question in questions:
        content_sql = question.content.replace("'", "''")
        subject_sql = question.subject.replace("'", "''")
        explanation = f"{source_label} {question.number}번 정답 해설 준비 중입니다.".replace("'", "''")

        question_rows.append(
            f"""insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, {year}, {round_value}, '{subject_sql}', {question.number}, '{content_sql}', '{explanation}', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = {year}
      and q.round = {round_value}
      and q.subject = '{subject_sql}'
      and q.number = {question.number}
  );"""
        )

        for idx, choice in enumerate(question.choices, start=1):
            choice_sql = choice.replace("'", "''")
            is_correct = "true" if idx == question.answer else "false"
            choice_rows.append(
                f"""insert into choices (question_id, number, content, is_correct)
select q.id, {idx}, '{choice_sql}', {is_correct}
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = {year}
  and q.round = {round_value}
  and q.subject = '{subject_sql}'
  and q.number = {question.number}
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = {idx}
  );"""
            )

    header = f"""-- Auto-generated from {source_label}
-- year={year}, round={round_value}
-- exam_slug=jeongchogi
"""
    return header + "\n\n".join(question_rows + choice_rows) + "\n"


def extract_questions(pdf_path: Path) -> list[Question]:
    reader = PdfReader(str(pdf_path))
    if len(reader.pages) < 2:
        raise ValueError("PDF 페이지 수가 너무 적습니다.")

    answer_map = parse_answer_map(reader.pages[-1].extract_text() or "")
    body_text = "\n".join(clean_text(reader.pages[i].extract_text() or "") for i in range(len(reader.pages) - 1))
    blocks = split_question_blocks(body_text)

    questions = [parse_question_block(number, block, answer_map) for number, block in blocks if number in answer_map]
    if len(questions) < 100:
        raise ValueError(f"문제 파싱 결과가 부족합니다: {len(questions)}개")
    return sorted(questions, key=lambda item: item.number)


def main() -> None:
    parser = argparse.ArgumentParser(description="정보처리기사 필기 PDF를 SQL로 변환합니다.")
    parser.add_argument("--pdf", required=True, help="입력 PDF 경로")
    parser.add_argument("--year", type=int, required=True, help="시험 연도")
    parser.add_argument("--round", dest="round_value", type=int, required=True, help="시험 회차 정수값")
    parser.add_argument("--label", required=True, help="SQL 헤더에 남길 소스 라벨")
    parser.add_argument("--output", required=True, help="출력 SQL 파일 경로")
    args = parser.parse_args()

    pdf_path = Path(args.pdf)
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    questions = extract_questions(pdf_path)
    sql = build_sql(questions, year=args.year, round_value=args.round_value, source_label=args.label)
    output_path.write_text(sql, encoding="utf-8")
    print(f"generated: {output_path} ({len(questions)} questions)")


if __name__ == "__main__":
    main()
