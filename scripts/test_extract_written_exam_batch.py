import unittest

from extract_written_exam_batch import BOILERPLATE_LINE, FILENAME_PATTERN


class FilenamePatternTest(unittest.TestCase):
    def test_matches_year_and_round_with_or_without_space(self):
        self.assertEqual(FILENAME_PATTERN.search("2021년 1회_기사필기 기출문제").groups(), ("2021", "1"))
        self.assertEqual(FILENAME_PATTERN.search("2024년1회_정보처리기사필기기출문제").groups(), ("2024", "1"))
        self.assertEqual(FILENAME_PATTERN.search("3. 2024년3회_정보처리기사필기기출문제").groups(), ("2024", "3"))


class BoilerplateLineTest(unittest.TestCase):
    def test_matches_page_footer_and_header_variants(self):
        for line in ["- 7 -", "- 8", "7 -", "1회", "2회", "정보처리기사 필기 기출문제"]:
            self.assertRegex(line, BOILERPLATE_LINE)

    def test_does_not_match_real_choice_content(self):
        for line in ["① 5개월 ② 10개월", "SPICE", "20문제", "100. LOC 기법에 의하여..."]:
            self.assertNotRegex(line, BOILERPLATE_LINE)


if __name__ == "__main__":
    unittest.main()
