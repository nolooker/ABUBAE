import argparse
import json
import re
from pathlib import Path
from typing import TypedDict

import pdfplumber


class ExtractedQuestion(TypedDict):
    number: int
    content: str
    choices: list[str]


QUESTION_START = re.compile(r"^(\d{1,3})\.\s*", re.MULTILINE)
CHOICE_MARKER = re.compile(r"[①②③④]")
ANSWER_ENTRY = re.compile(r"(?<!\d)(\d{1,3})\.\s*([^\s]+)")
ANSWER_INDEX = {"①": 0, "②": 1, "③": 2, "④": 3}

MANUAL_TABLE_QUESTIONS: dict[tuple[int, int], ExtractedQuestion] = {
    (1, 48): {
        "number": 48,
        "content": (
            "R1(학번, 이름, 학년, 학과, 주소)과 R2(학번, 과목번호, 성적, 점수) "
            "테이블에 다음 SQL을 실행한 결과는? "
            "SELECT 이름 FROM R1 WHERE 학번 IN "
            "(SELECT 학번 FROM R2 WHERE 과목번호 = 'C100');"
        ),
        "choices": [
            "이름: 홍길동, 강남길, 장미화",
            "이름: 홍길동, 강남길, 오말자",
            "이름: 홍길동, 김철수, 강남길, 오말자, 장미화",
            "이름: 홍길동, 김철수",
        ],
    },
    (3, 43): {
        "number": 43,
        "content": (
            "릴레이션 R1의 학년 값이 1, 2, 3이고 R2의 학과 값이 컴퓨터, 국문, "
            "수학일 때 두 릴레이션의 카티션 프로덕트 수행 결과는?"
        ),
        "choices": [
            "(1, 컴퓨터), (2, 국문), (3, 수학)",
            "(2, 컴퓨터), (2, 국문), (2, 수학)",
            "(3, 컴퓨터), (3, 국문), (3, 수학)",
            (
                "(1, 컴퓨터), (1, 국문), (1, 수학), (2, 컴퓨터), (2, 국문), "
                "(2, 수학), (3, 컴퓨터), (3, 국문), (3, 수학)"
            ),
        ],
    },
}


def normalize_text(value: str) -> str:
    return " ".join(value.replace("\xa0", " ").split())


def extract_questions(page_text: str) -> list[ExtractedQuestion]:
    matches = [
        match for match in QUESTION_START.finditer(page_text)
        if 1 <= int(match.group(1)) <= 100
    ]
    questions: list[ExtractedQuestion] = []

    for index, match in enumerate(matches):
        block_end = matches[index + 1].start() if index + 1 < len(matches) else len(page_text)
        block = page_text[match.end():block_end]
        markers = list(CHOICE_MARKER.finditer(block))
        if len(markers) < 4:
            continue

        content = normalize_text(block[:markers[0].start()])
        choices = []
        for choice_index, marker in enumerate(markers[:4]):
            end = markers[choice_index + 1].start() if choice_index < 3 else len(block)
            choices.append(normalize_text(block[marker.end():end]))

        if content and all(choices):
            questions.append({
                "number": int(match.group(1)),
                "content": content,
                "choices": choices,
            })

    return questions


def extract_answer_key(page_text: str) -> tuple[dict[int, int], list[int]]:
    answers: dict[int, int] = {}
    uncertain: list[int] = []
    for match in ANSWER_ENTRY.finditer(page_text):
        number = int(match.group(1))
        value = match.group(2)
        markers = CHOICE_MARKER.findall(value)
        if len(markers) == 1 and value == markers[0]:
            answers[number] = ANSWER_INDEX[markers[0]]
        elif 1 <= number <= 100:
            uncertain.append(number)
    return answers, uncertain


def subject_for(number: int) -> str:
    subjects = [
        "소프트웨어 설계",
        "소프트웨어 개발",
        "데이터베이스 구축",
        "프로그래밍 언어 활용",
        "정보시스템 구축관리",
    ]
    return subjects[min((number - 1) // 20, 4)]


def extract_pdf(path: Path, year: int, round_number: int) -> dict:
    candidates: dict[int, ExtractedQuestion] = {}
    answers: dict[int, int] = {}
    uncertain_answers: list[int] = []
    with pdfplumber.open(path) as pdf:
        ordered_columns: list[str] = []
        for page in pdf.pages[:-1]:
            midpoint = page.width / 2
            ordered_columns.extend((
                page.crop((0, 0, midpoint, page.height)).extract_text() or "",
                page.crop((midpoint, 0, page.width, page.height)).extract_text() or "",
            ))
        for question in extract_questions("\n".join(ordered_columns)):
            number = question["number"]
            if number not in candidates:
                candidates[number] = question
        for (manual_round, number), question in MANUAL_TABLE_QUESTIONS.items():
            if manual_round == round_number:
                candidates[number] = question
        answers, uncertain_answers = extract_answer_key(pdf.pages[-1].extract_text() or "")
        page_count = len(pdf.pages)

    questions = []
    for number in sorted(candidates):
        candidate = candidates[number]
        questions.append({
            "id": f"jeongchogi-written-{year}-{round_number}-{number:03d}",
            "subject": subject_for(number),
            **candidate,
            "answerIndex": answers.get(number),
            "explanation": None,
            "reviewed": False,
            "published": False,
        })

    return {
        "examSlug": "jeongchogi",
        "examType": "written",
        "year": year,
        "round": round_number,
        "title": f"{year}년 {round_number}회 정보처리기사 필기",
        "sourceLabel": f"licensed-pdf-{year}-{round_number}",
        "pageCount": page_count,
        "extractedQuestionCount": len(questions),
        "missingNumbers": [number for number in range(1, 101) if number not in candidates],
        "uncertainAnswerNumbers": uncertain_answers,
        "questions": questions,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)

    for round_number in (1, 2, 3):
        matches = sorted(args.input.glob(f"2021년 {round_number}회_*.pdf"))
        if len(matches) != 1:
            raise SystemExit(f"expected one PDF for 2021 round {round_number}, found {len(matches)}")
        result = extract_pdf(matches[0], 2021, round_number)
        output_path = args.output / f"2021-{round_number}.candidates.json"
        output_path.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
        print(f"{output_path}: {result['extractedQuestionCount']} candidates, {len(result['missingNumbers'])} missing")


if __name__ == "__main__":
    main()
