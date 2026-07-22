import unittest

from extract_written_exam import extract_answer_key, extract_questions


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

    def test_ignores_large_decimal_numbers_inside_question_stems(self):
        page_text = (
            "70. IEEE 802.3 LAN 방식은? ① A ② B ③ C ④ D "
            "\n71. 다음 설명은? ① E ② F ③ G ④ H"
        )

        questions = extract_questions(page_text)

        self.assertEqual([question["number"] for question in questions], [70, 71])

    def test_extracts_single_answers_and_flags_multiple_answers(self):
        answer_text = "1.① 2.④ 3.②,③ 4.전항정답"

        answers, uncertain = extract_answer_key(answer_text)

        self.assertEqual(answers, {1: 0, 2: 3})
        self.assertEqual(uncertain, [3, 4])


if __name__ == "__main__":
    unittest.main()
