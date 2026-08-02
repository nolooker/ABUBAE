import argparse
import json
import re
from pathlib import Path

import pdfplumber

from extract_written_exam import extract_answer_key, extract_questions, subject_for

FILENAME_PATTERN = re.compile(r"(\d{4})\s*년\s*(\d+)\s*회")

# Manual overrides for questions the regex extractor cannot recover cleanly
# (diagram/table-based questions whose choices are drawn shapes/boxes rather
# than plain text), keyed by (year, round, number). Verified against the
# source PDF's answer key and, for the recurring UNION ALL question, cross-
# checked across all three rounds that reuse it.
MANUAL_TABLE_QUESTIONS: dict[tuple[int, int, int], dict] = {
    (2022, 1, 44): {
        "number": 44,
        "content": "E-R 모델에서 다중값 속성의 표기법은?",
        "choices": ["마름모(다이아몬드) 기호", "사각형 기호", "이중 타원(원) 기호", "선(밑줄) 기호"],
    },
    (2022, 1, 57): {
        "number": 57,
        "content": (
            "테이블 R과 S에 대한 SQL문이 실행되었을 때, 실행 결과로 옳은 것은? "
            "R(A, B): (1, A), (3, B) / S(A, B): (1, A), (2, B) / "
            "SELECT A FROM R UNION ALL SELECT A FROM S;"
        ),
        "choices": ["1", "3, 2", "1, 3", "1, 3, 1, 2"],
    },
    (2022, 1, 79): {
        "number": 79,
        "content": (
            '다음 Python 프로그램이 실행되었을 때, 실행 결과는? '
            'a = ["대", "한", "민", "국"]\nfor i in a:\n    print(i)'
        ),
        "choices": ["대한민국", "대\n한\n민\n국", "대", "대대대대"],
    },
    (2023, 1, 46): {
        "number": 46,
        "content": (
            "테이블 R과 S에 대한 SQL에 대한 SQL문이 실행되었을 때, 실행결과로 옳은 것은? "
            "R(A, B): (1, A), (3, B) / S(A, B): (1, A), (2, B) / "
            "SELECT A FROM R UNION ALL SELECT A FROM S;"
        ),
        "choices": ["1", "3, 2", "1, 3", "1, 3, 1, 2"],
    },
    (2025, 2, 56): {
        "number": 56,
        "content": (
            "테이블 R과 S에 대한 SQL문이 실행되었을 때, 실행 결과로 옳은 것은? "
            "R(A, B): (1, A), (3, B) / S(A, B): (1, A), (2, B) / "
            "SELECT A FROM R UNION ALL SELECT A FROM S;"
        ),
        "choices": ["1", "3, 2", "1, 3", "1, 3, 1, 2"],
    },
}

# Manual answer-index overrides for questions whose content/choices extracted
# fine but whose answer-key entry was unrecoverable via regex (source PDF
# rendering glitches), keyed by (year, round, number). Verified by rendering
# the answer-key page to an image and reading the circled digit directly, or
# (for 2022-2 #5, where the source PDF's own answer cell is blank) by
# evaluating the question on its merits.
MANUAL_ANSWER_OVERRIDES: dict[tuple[int, int, int], list[int]] = {
    (2022, 2, 5): [1],
    (2024, 2, 8): [3],
    (2024, 2, 10): [1],
    (2024, 2, 100): [3],
}

# Rounds whose PDF puts the questions on more than the usual last-page-is-
# answers layout: instead of one compact answer-key page, the answer key is
# split into two five-column mini-tables embedded at the top of the
# "정답 및 해설" (prose explanation) pages that follow the question pages.
# Value is the number of leading pages that hold questions; the remaining
# pages are treated as one combined answer-key + explanation text block.
SPLIT_ANSWER_KEY_ROUNDS: dict[tuple[int, int], int] = {
    (2024, 1): 7,
}


# Page header/footer boilerplate (title banner, "N회" round label, "- N -"
# page number). These can end up glued onto the last question's last choice
# when that question has no following question to bound its text block, so
# they're stripped per column before the columns are joined and matched.
BOILERPLATE_LINE = re.compile(r"^(?:-\s*\d+\s*-?|\d+\s*-|\d+\s*회|정보처리기사\s*필기\s*기출문제)$")


def crop_columns(pages) -> str:
    ordered_columns: list[str] = []
    for page in pages:
        midpoint = page.width / 2
        for crop_box in ((0, 0, midpoint, page.height), (midpoint, 0, page.width, page.height)):
            raw = page.crop(crop_box).extract_text() or ""
            cleaned = "\n".join(
                line for line in raw.split("\n") if not BOILERPLATE_LINE.match(line.strip())
            )
            ordered_columns.append(cleaned)
    return "\n".join(ordered_columns)


def extract_pdf(path: Path, year: int, round_number: int) -> dict:
    candidates: dict[int, dict] = {}
    question_page_count = SPLIT_ANSWER_KEY_ROUNDS.get((year, round_number))
    with pdfplumber.open(path) as pdf:
        question_pages = pdf.pages[:question_page_count] if question_page_count else pdf.pages[:-1]

        for question in extract_questions(crop_columns(question_pages)):
            number = question["number"]
            if number not in candidates:
                candidates[number] = question
        for (manual_year, manual_round, number), question in MANUAL_TABLE_QUESTIONS.items():
            if manual_year == year and manual_round == round_number:
                candidates[number] = question

        if question_page_count:
            # Answer key is split across two mini-tables embedded at the top
            # of the multi-page prose explanation section; column-cropping
            # each of those pages (like the question pages) recovers both.
            answer_text = crop_columns(pdf.pages[question_page_count:])
        else:
            # Standard layout: one compact answer-key table on the full-width
            # last page. Deliberately NOT column-cropped here, since the
            # table's 10-per-row entries aren't laid out in the same
            # left/right column split as the question pages, and cropping
            # would risk splitting "N.①" entries across the midpoint.
            answer_text = pdf.pages[-1].extract_text() or ""
        answers, multiple_answers = extract_answer_key(answer_text)
        page_count = len(pdf.pages)

    for (manual_year, manual_round, number), accepted in MANUAL_ANSWER_OVERRIDES.items():
        if manual_year == year and manual_round == round_number:
            answers[number] = accepted

    questions = []
    for number in sorted(candidates):
        candidate = candidates[number]
        questions.append({
            "id": f"jeongchogi-written-{year}-{round_number}-{number:03d}",
            "subject": subject_for(number),
            **candidate,
            "acceptedAnswerIndexes": answers.get(number, []),
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
        "missingAnswerNumbers": [number for number in candidates if number not in answers],
        "multipleAnswerNumbers": multiple_answers,
        "questions": questions,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--skip", nargs="*", default=[], help="year-round pairs to skip, e.g. 2024-1")
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    skip = set(args.skip)

    matches = []
    for pdf_path in sorted(args.input.glob("*.pdf")):
        match = FILENAME_PATTERN.search(pdf_path.stem)
        if not match:
            print(f"skipping (no year/round in filename): {pdf_path.name}")
            continue
        year, round_number = int(match.group(1)), int(match.group(2))
        matches.append((year, round_number, pdf_path))

    for year, round_number, pdf_path in sorted(matches):
        label = f"{year}-{round_number}"
        if label in skip:
            print(f"skipping {label} (explicitly skipped): {pdf_path.name}")
            continue
        result = extract_pdf(pdf_path, year, round_number)
        output_path = args.output / f"{year}-{round_number}.candidates.json"
        output_path.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
        print(
            f"{output_path.name}: {result['extractedQuestionCount']} candidates, "
            f"missing questions={result['missingNumbers']}, "
            f"missing answers={result['missingAnswerNumbers']}, "
            f"multi-answer={result['multipleAnswerNumbers']}",
        )


if __name__ == "__main__":
    main()
