import unittest

from extract_written_exam import extract_questions


class ExtractQuestionsTest(unittest.TestCase):
    def test_extracts_number_stem_and_four_choices(self):
        page_text = "1. 미들웨어에 대한 설명은? ① 보기A ② 보기B ③ 보기C ④ 보기D"

        questions = extract_questions(page_text)

        self.assertEqual(questions[0]["number"], 1)
        self.assertEqual(questions[0]["content"], "미들웨어에 대한 설명은?")
        self.assertEqual(questions[0]["choices"], ["보기A", "보기B", "보기C", "보기D"])

    def test_preserves_multiline_question_content(self):
        page_text = "12. 다음 구조를 보고 답하시오.\n모듈 A와 B의 관계는? ① 결합 ② 응집 ③ 상속 ④ 연관"

        questions = extract_questions(page_text)

        self.assertEqual(
            questions[0]["content"],
            "다음 구조를 보고 답하시오. 모듈 A와 B의 관계는?",
        )


if __name__ == "__main__":
    unittest.main()
