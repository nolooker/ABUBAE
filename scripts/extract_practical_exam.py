import re
from pathlib import Path
from typing import TypedDict

import pdfplumber


class ExtractedBlank(TypedDict):
    blank: int
    accepted: list[str]


class ExtractedQuestion(TypedDict):
    number: int
    points: int | None
    content: str


QUESTION_START = re.compile(r"^문제\s*(\d{1,3})\s", re.MULTILINE)
ANSWER_SECTION_MARKER = "기출문제 정답 및 해설"
ANSWER_START = re.compile(r"^\[문제\s*(\d{1,3})\]\s*$", re.MULTILINE)
EXPLANATION_MARKER = "[해설]"
ANSWER_LINE_CUT = re.compile(r"(?:^|\n)답\s*:?\s*(?:\n|$)")
POINTS = re.compile(r"\((\d+)\s*점\)")
CIRCLED_NUMBER = re.compile(r"[①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳]")

# Recurring per-page boilerplate that pdfplumber captures alongside the real
# content: page numbers, the "연습란" (scratch space) prompt on question
# pages, and the publisher footer line stamped on every question page.
BOILERPLATE_LINE = re.compile(
    r"^(?:-\s*\d+\s*-\s*|연\s*습\s*란|※\s*다음\s*여백은\s*연습란으로\s*사용하시기\s*바랍니다\.|"
    r"이\s*문제는\s*\(주\).*기출문제입니다\.)$"
)


def strip_boilerplate(text: str) -> str:
    lines = [line for line in text.split("\n") if not BOILERPLATE_LINE.match(line.strip())]
    return "\n".join(lines)


def clean_block(text: str) -> str:
    lines = [line.rstrip() for line in strip_boilerplate(text).split("\n")]
    while lines and not lines[0].strip():
        lines.pop(0)
    while lines and not lines[-1].strip():
        lines.pop()
    return "\n".join(lines)


def extract_questions(question_section: str) -> dict[int, ExtractedQuestion]:
    matches = [
        match for match in QUESTION_START.finditer(question_section)
        if 1 <= int(match.group(1)) <= 100
    ]
    questions: dict[int, ExtractedQuestion] = {}

    for index, match in enumerate(matches):
        number = int(match.group(1))
        block_end = matches[index + 1].start() if index + 1 < len(matches) else len(question_section)
        block = question_section[match.end():block_end]

        cut = ANSWER_LINE_CUT.search(block)
        body = block[:cut.start()] if cut else block

        points_match = POINTS.search(block)
        points = int(points_match.group(1)) if points_match else None

        content = clean_block(body)
        if content:
            questions[number] = {"number": number, "points": points, "content": content}

    return questions


def split_blanks(answer_text: str, allow_alternatives: bool) -> list[ExtractedBlank]:
    markers = list(CIRCLED_NUMBER.finditer(answer_text))
    segments = []
    if markers:
        for index, marker in enumerate(markers):
            end = markers[index + 1].start() if index + 1 < len(markers) else len(answer_text)
            segments.append(answer_text[marker.end():end])
    else:
        segments.append(answer_text)

    blanks: list[ExtractedBlank] = []
    for blank_number, segment in enumerate(segments, start=1):
        segment = " ".join(segment.split())
        if allow_alternatives:
            accepted = [part.strip() for part in segment.split(",") if part.strip()]
        else:
            accepted = [segment] if segment else []
        blanks.append({"blank": blank_number, "accepted": accepted})
    return blanks


def extract_answers(answer_section: str) -> dict[int, dict]:
    matches = list(ANSWER_START.finditer(answer_section))
    answers: dict[int, dict] = {}

    for index, match in enumerate(matches):
        number = int(match.group(1))
        block_end = matches[index + 1].start() if index + 1 < len(matches) else len(answer_section)
        block = clean_block(answer_section[match.end():block_end])

        explanation = None
        if EXPLANATION_MARKER in block:
            answer_part, _, explanation_part = block.partition(EXPLANATION_MARKER)
            explanation = clean_block(explanation_part) or None
        else:
            answer_part = block

        lines = [line for line in answer_part.split("\n")]
        note_lines = []
        while lines and lines[0].strip().startswith("※"):
            note_lines.append(re.sub(r"^※\s*", "", lines.pop(0).strip()))
        note = " ".join(note_lines) or None

        raw_answer_text = clean_block("\n".join(lines))
        allow_alternatives = bool(note and "하나" in note)
        blanks = split_blanks(raw_answer_text, allow_alternatives)

        answers[number] = {
            "rawAnswerText": raw_answer_text,
            "answerNote": note,
            "answers": blanks,
            "explanation": explanation,
        }

    return answers


def extract_pdf(path: Path, year: int, round_number: int) -> dict:
    with pdfplumber.open(path) as pdf:
        page_count = len(pdf.pages)
        full_text = "\n".join(page.extract_text() or "" for page in pdf.pages[1:])

    marker_index = full_text.find(ANSWER_SECTION_MARKER)
    if marker_index == -1:
        raise ValueError(f"{path.name}: could not find '{ANSWER_SECTION_MARKER}' marker")

    question_section = full_text[:marker_index]
    answer_section = full_text[marker_index + len(ANSWER_SECTION_MARKER):]

    candidates = extract_questions(question_section)
    answers = extract_answers(answer_section)

    questions = []
    for number in sorted(candidates):
        candidate = candidates[number]
        answer = answers.get(number, {
            "rawAnswerText": "",
            "answerNote": None,
            "answers": [],
            "explanation": None,
        })
        questions.append({
            "id": f"jeongchogi-practical-{year}-{round_number}-{number:03d}",
            "subject": "실기",
            "number": candidate["number"],
            "points": candidate["points"],
            "content": candidate["content"],
            "rawAnswerText": answer["rawAnswerText"],
            "answerNote": answer["answerNote"],
            "answers": answer["answers"],
            "explanation": answer["explanation"],
            "reviewed": False,
            "published": False,
        })

    return {
        "examSlug": "jeongchogi",
        "examType": "practical",
        "year": year,
        "round": round_number,
        "title": f"{year}년 {round_number}회 정보처리기사 실기",
        "sourceLabel": f"licensed-pdf-{year}-{round_number}",
        "pageCount": page_count,
        "extractedQuestionCount": len(questions),
        "missingNumbers": [number for number in range(1, 21) if number not in candidates],
        "missingAnswerNumbers": [number for number in candidates if number not in answers],
        "questions": questions,
    }
