-- Delete 2020 written questions for jeongchogi
-- Use this when resetting the temporary 2020 import data.

-- 1) Check target rows first
select id, year, round, subject, number, exam_part
from questions
where exam_id = (
  select id from exams where slug = 'jeongchogi'
)
  and year = 2020
  and exam_part = 'written'
order by round asc, number asc;

-- 2) Delete linked choices
delete from choices
where question_id in (
  select id
  from questions
  where exam_id = (
    select id from exams where slug = 'jeongchogi'
  )
    and year = 2020
    and exam_part = 'written'
);

-- 3) Delete questions
delete from questions
where exam_id = (
  select id from exams where slug = 'jeongchogi'
)
  and year = 2020
  and exam_part = 'written';

-- 4) Verify deletion
select id, year, round, subject, number, exam_part
from questions
where exam_id = (
  select id from exams where slug = 'jeongchogi'
)
  and year = 2020
  and exam_part = 'written';
