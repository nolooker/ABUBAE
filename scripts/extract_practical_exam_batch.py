import argparse
import json
import re
from pathlib import Path

from extract_practical_exam import extract_pdf

FILENAME_PATTERN = re.compile(r"(\d{4})\s*년\s*(\d+)\s*회")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--skip", nargs="*", default=[], help="year-round pairs to skip, e.g. 2025-2")
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
            f"missing answers={result['missingAnswerNumbers']}",
        )


if __name__ == "__main__":
    main()
