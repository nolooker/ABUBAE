-- 2020년 3회 정보처리기사 필기 샘플 import SQL
-- 범위: 1번 ~ 5번
-- 사용 전제:
-- 1) exams 테이블에 slug = 'jeongchogi' 행이 있어야 함
-- 2) questions 테이블에 exam_part 컬럼이 이미 추가되어 있으면 written 값을 사용
-- 3) choices 테이블은 question_id / number / content / is_correct 구조를 사용

with exam_cte as (
  select id
  from exams
  where slug = 'jeongchogi'
),
insert_q1 as (
  insert into questions (
    exam_id,
    year,
    round,
    subject,
    number,
    content,
    explanation,
    difficulty,
    exam_part
  )
  select
    exam_cte.id,
    2020,
    3,
    '소프트웨어 설계',
    1,
    '요구사항 분석 시에 필요한 기술로 가장 거리가 먼 것은?',
    '정답 해설 준비 중입니다.',
    2,
    'written'
  from exam_cte
  where not exists (
    select 1
    from questions q
    where q.exam_id = exam_cte.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '소프트웨어 설계'
      and q.number = 1
  )
  returning id
),
insert_q2 as (
  insert into questions (
    exam_id,
    year,
    round,
    subject,
    number,
    content,
    explanation,
    difficulty,
    exam_part
  )
  select
    exam_cte.id,
    2020,
    3,
    '소프트웨어 설계',
    2,
    '다음 내용이 설명하는 디자인 패턴은? 객체를 생성하기 위한 인터페이스를 정의하여 어떤 클래스가 인스턴스화 될 것인지는 서브클래스가 결정하도록 하는 것. Virtual-Constructor 패턴이라고도 함.',
    '정답 해설 준비 중입니다.',
    3,
    'written'
  from exam_cte
  where not exists (
    select 1
    from questions q
    where q.exam_id = exam_cte.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '소프트웨어 설계'
      and q.number = 2
  )
  returning id
),
insert_q3 as (
  insert into questions (
    exam_id,
    year,
    round,
    subject,
    number,
    content,
    explanation,
    difficulty,
    exam_part
  )
  select
    exam_cte.id,
    2020,
    3,
    '소프트웨어 설계',
    3,
    '럼바우 객체 지향 분석과 거리가 먼 것은?',
    '정답 해설 준비 중입니다.',
    2,
    'written'
  from exam_cte
  where not exists (
    select 1
    from questions q
    where q.exam_id = exam_cte.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '소프트웨어 설계'
      and q.number = 3
  )
  returning id
),
insert_q4 as (
  insert into questions (
    exam_id,
    year,
    round,
    subject,
    number,
    content,
    explanation,
    difficulty,
    exam_part
  )
  select
    exam_cte.id,
    2020,
    3,
    '소프트웨어 설계',
    4,
    '애자일 기법에 대한 설명으로 맞지 않은 것은?',
    '정답 해설 준비 중입니다.',
    2,
    'written'
  from exam_cte
  where not exists (
    select 1
    from questions q
    where q.exam_id = exam_cte.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '소프트웨어 설계'
      and q.number = 4
  )
  returning id
),
insert_q5 as (
  insert into questions (
    exam_id,
    year,
    round,
    subject,
    number,
    content,
    explanation,
    difficulty,
    exam_part
  )
  select
    exam_cte.id,
    2020,
    3,
    '소프트웨어 설계',
    5,
    '미들웨어 솔루션의 유형에 포함되지 않는 것은?',
    '정답 해설 준비 중입니다.',
    2,
    'written'
  from exam_cte
  where not exists (
    select 1
    from questions q
    where q.exam_id = exam_cte.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '소프트웨어 설계'
      and q.number = 5
  )
  returning id
)
select 1;

insert into choices (question_id, number, content, is_correct)
select q.id, c.number, c.content, c.is_correct
from questions q
join exams e on e.id = q.exam_id
join (
  values
    (1, 1, '청취와 인터뷰 질문 기술', false),
    (1, 2, '분석과 중재기술', false),
    (1, 3, '설계 및 코딩 기술', true),
    (1, 4, '관찰 및 모델 작성 기술', false),

    (2, 1, 'Visitor 패턴', false),
    (2, 2, 'Observer 패턴', false),
    (2, 3, 'Factory Method 패턴', true),
    (2, 4, 'Bridge 패턴', false),

    (3, 1, '기능 모델링', false),
    (3, 2, '동적 모델링', false),
    (3, 3, '객체 모델링', false),
    (3, 4, '정적 모델링', true),

    (4, 1, '절차와 도구보다 개인과 소통을 중요하게 생각한다.', false),
    (4, 2, '계획에 중점을 두어 변경 대응이 난해하다.', true),
    (4, 3, '소프트웨어가 잘 실행되는데 가치를 둔다.', false),
    (4, 4, '고객과의 피드백을 중요하게 생각한다.', false),

    (5, 1, 'WAS', false),
    (5, 2, 'Web Server', true),
    (5, 3, 'RPC', false),
    (5, 4, 'ORB', false)
) as c(question_number, number, content, is_correct)
  on q.number = c.question_number
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '소프트웨어 설계'
  and q.number between 1 and 5
  and not exists (
    select 1
    from choices existing
    where existing.question_id = q.id
      and existing.number = c.number
  );
