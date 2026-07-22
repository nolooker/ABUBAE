import argparse
import json
import re
from pathlib import Path
from typing import TypedDict

from pypdf import PdfReader


class ExtractedQuestion(TypedDict):
    number: int
    content: str
    choices: list[str]


QUESTION_START = re.compile(r"(?<!\d)(\d{1,3})\.\s*")
CHOICE_MARKER = re.compile(r"[①②③④]")


def normalize_text(value: str) -> str:
    return " ".join(value.replace("\xa0", " ").split())


def extract_questions(page_text: str) -> list[ExtractedQuestion]:
    matches = list(QUESTION_START.finditer(page_text))
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
    reader = PdfReader(str(path))
    candidates: dict[int, ExtractedQuestion] = {}
    for page in reader.pages:
        text = page.extract_text() or ""
        for question in extract_questions(text):
            number = question["number"]
            if 1 <= number <= 100 and number not in candidates:
                candidates[number] = question

    questions = []
    for number in sorted(candidates):
        candidate = candidates[number]
        questions.append({
            "id": f"jeongchogi-written-{year}-{round_number}-{number:03d}",
            "subject": subject_for(number),
            **candidate,
            "answerIndex": None,
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
        "pageCount": len(reader.pages),
        "extractedQuestionCount": len(questions),
        "missingNumbers": [number for number in range(1, 101) if number not in candidates],
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
