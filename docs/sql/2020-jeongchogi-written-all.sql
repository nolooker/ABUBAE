-- 2020³â Á¤º¸Ã³¸®±â»ç ÇÊ±â ÀüÃ¼ import
-- ÁÖÀÇ: 2020³â 1,2È¸ ÅëÇÕ PDF´Â ÇöÀç round = 12 ÀÓ½Ã°ªÀ¸·Î »ı¼ºµÇ¾î ÀÖ½À´Ï´Ù.

-- Auto-generated from 2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸°
-- year=2020, round=12
-- exam_slug=jeongchogi
insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 1, 'GoF(Gang of Four) ?Builder', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 1ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 1
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 2, 'ë©”ì†Œ??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 2ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 2
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 3, '??- (Part-Whole)??ê³??ëŠ” ë¶€ë¶???ê´€ê³„ë¡œ ?¤ëª…?˜ëŠ” ?°ê??±ì„ ?˜í??´â€?(is-a-part-of)?™ëŠ” ?©ì–´???¼ë°˜??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 3ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 3
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 4, 'E-R ?‰ìœ„ë¥?ëª¨ë¸ë§í•˜ë©?ê°ì²´ ?ë³„ êµ¬ì¡°?ë³„ ì£¼ì²´ ?•ì˜ ?ì„± ë°?, , , , ê´€ê³??•ì˜ ?œë¹„???•ì˜ ?±ì˜ ê³¼ì •?¼ë¡œ êµ¬ì„±?˜ëŠ” ê²ƒì?, ??€ ë°©ë²•Coad Yourdon', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 4ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 4
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 5, '?°ìƒ ì½”ë“œ', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 5ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 5
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 6, 'ì¸¡ì • ??ª©???„ë‹Œ ê²ƒì???‘ë‹µ?œê°„(Response Time)', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 6ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 6
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 7, '{ }', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 7ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 7
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 8, '??ì§§ì? ê²€???Œì˜ë¥??µí•´ ?¤ë¥˜ë¥?ì¡°ê¸°??ê²€ì¶œí•˜?”ë° ëª©ì ???ëŠ” ?”êµ¬?¬í•­ ê²€??ë°©ë²•?€?ë¹Œë“œ ê²€ì¦?, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 8ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 8
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 9, 'CASE ?ê·¸ë˜??ì§€??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 9ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 9
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 10, 'XP(eXtreme Programing) 5 ??©ê¸°', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 10ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 10
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 11, 'DBMS ?ê°€?©ì„±', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 11ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 11
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 12, 'HIPO(Hierarchy Input Process Output)ë¨?ê²ƒì???í–¥???Œí”„?¸ì›¨??ê°œë°œ???„í•œ ë¬¸ì„œ???„êµ¬?´ë‹¤.', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 12ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 12
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 13, 'UI ê²ƒì??? íš¨??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 13ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 13
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 14, '(Rumbaugh)ê²ƒì??ê°ì²´ ëª¨í˜• ?™ì  ëª¨í˜• ê¸°ëŠ¥ ëª¨í˜•', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 14ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 14
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 15, '(DFD) ?Process', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 15ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 15
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 16, 'UML ê¸°í˜¸ë¡?ë§ëŠ” ê²ƒì??<< >>', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 16ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 16
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 17, '??ë¯¸ë“¤?¨ì–´??RPC', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 17ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 17
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 18, '(Requirements Analysis)ê±°ë¦¬ê°€ ë¨?ê²ƒì??ë¹„ìš©ê³??¼ì •???€???œì•½?¤ì •', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 18ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 18
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 19, '??ê°€ì§€ë¡??´ì„?????ˆë„ë¡??‘ì„±?˜ëŠ” ?ì¹™?€??í˜¸?‘ìš©??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 19ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 19
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨???¤ê³„', 20, 'UML Structural Diagram ?Class Diagram', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 20ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 20
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 21, '. ?´ë? ê²½ê³„ ê°?ë¶„ì„ ê¸°ë²•?¼ë¡œ ?ŒìŠ¤???˜ê³ ???????¤ìŒ ì¤??ŒìŠ¤??ì¼€?´ìŠ¤???…ë ¥ ê°’ìœ¼ë¡??³ì? ?Šì? ê²ƒì?? ?‰ê??ìˆ˜ ?±ì  80~100 A 60~79 B 0~59 C 59', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 21ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 21
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 22, '(degree) (terminal node) ? ì°¨ìˆ˜ ?¨ë§ ?¸ë“œ : 4, : 4', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 22ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 22
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 23, '?‰í•˜??ê¸°ë²•?´ë©° ?¼ë°˜?ìœ¼ë¡??µì œ???˜ê²½?ì„œ ?¬ìš©?ì? ê°œë°œ?ê? , ?¨ê»˜ ?•ì¸?˜ë©´???˜í–‰?˜ëŠ” ê²€?¬ëŠ”??™ì¹˜ ë¶„í•  ê²€??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 23ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 23
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 24, '?„ìš”??ì¡°ê±´ë§Œì„ ê°€ì§€ê³??„ì‹œë¡??œê³µ?˜ëŠ” ?œí—˜??ëª¨ë“ˆ??ë¬´ì—‡?´ë¼ê³??˜ëŠ”ê°€?Stub', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 24ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 24
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 25, 'ë¡?ê±°ë¦¬ê°€ ë¨?ê²ƒì???•í™•??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 25ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 25
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 26, '80% 20% ë°œê²¬?œë‹¤??ë²•ì¹™?€???ë²•ì¹™Brooks', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 26ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 26
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 27, '(DRM) ??¬ë™ ë°©ì? ê¸°ìˆ ', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 27ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 27
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 28, 'ê±°ë¦¬ê°€ ë¨?ê²ƒì??IPSec', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 28ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 28
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 29, '?ì„œë¹„ìŠ¤ ?¸ì¶œ ì»´í¬?ŒíŠ¸ ?¬ì‚¬?????¤ì–‘???˜ê²½??ì§€?? ?˜ëŠ” ?ŒìŠ¤???„ë ˆ?„ì›Œ???ê° ?ŒìŠ¤???€??ë¶„ì‚° ?˜ê²½???°ëª¬???¬ìš©?˜ì—¬ ?ŒìŠ¤???€???„ë¡œê·¸ë¨???µí•´ ?ŒìŠ¤?¸ë? ?˜í–‰?˜ê³  ?µí•©?˜ì—¬ ?? ?™í™”?˜ëŠ” ê²€ì¦??„êµ¬ xUnit', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 29ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 29
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 30, 'SW ??¨í‚¤ì§????¬ìš©?ì—ê²?ë°°í¬?˜ëŠ” ?´ë?ë¡?ë³´ì•ˆ??ê³ ë ¤?œë‹¤SW .', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 30ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 30
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 31, 'ë¹„ìš©??ê´€???¬í•­???¨ìœ¨?ìœ¼ë¡?ê´€ë¦¬í•˜??ê²?, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 31ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 31
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 32, 'White Box Testing ?ê°€ ?€?œì ??Base Path Testing, Boundary Value Analysis', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 32ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 32
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 33, '(Alien Code) ??„ë¡œê·¸ë¨??ë¡œì§??ë³µì¡?˜ì—¬ ?´í•´?˜ê¸° ?´ë ¤???„ë¡œê·¸ë¨????, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 33ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 33
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 34, '(Preorder Traversal) ? * A B / * C D E', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 34ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 34
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 35, 'O(1) ?ì»´í“¨??ì²˜ë¦¬ê°€ ë¶ˆê?', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 35ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 35
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 36, 'N O(Nlog N)?‚ì •???Œê³ ë¦¬ì¦˜?€?? íƒ ?•ë ¬', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 36ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 36
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 37, 'ISO/IEC 9126 (Functionality)?˜ìœ„ ?¹ì„±?¼ë¡œ ?³ì? ?Šì? ê²ƒì???™ìŠµ??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 37ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 37
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 38, 'EAI(Enterprise Application Integration)ê²ƒì??Point-to-Point', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 38ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 38
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 39, 'pmd', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 39ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 39
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?Œí”„?¸ì›¨??ê°œë°œ', 40, '(Denormalization) ???´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì??ë¹Œë“œ ?Œì´ë¸”ì˜ ì¶”ê?', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 40ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 40
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 41, 'SQL DDL ?UPDATE', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 41ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 41
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 42, 'STUDENT 50 , 30 , ?ì–´?ë¬¸?™ê³¼ ?™ìƒ ëª…ì˜ ?•ë³´ê°€ ?€?¥ë˜???ˆì„ ???¤ìŒ ??50 , ë¬¸ì˜ ?¤í–‰ ê²°ê³¼ ?œí”Œ ?˜ëŠ” ??ì»¬ëŸ¼?€ ?™ê³¼ëª…SQL ? ( , DEPT ) SELECT DEPT FROM STUDENT;??SELECT DISTINCT DEPT FROM STUDENT;??3, 3', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 42ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 42
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 43, '( , ê¸°ë³¸?¤ì´??) ê³¼ëª©(ê³¼ëª©ë²ˆí˜¸ê³¼ëª©ëª? ) ?˜ê°•(?˜ê°•ë²ˆí˜¸?™ë²ˆ ê³¼ëª©ë²ˆí˜¸ ?™ê¸°, , , ) ?˜ê°•ë²ˆí˜¸', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 43ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 43
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 44, '1NF 2NF ?ë¥?ë§Œì¡±?˜ê³  ëª¨ë“  ?„ë©”?¸ì´ ?ìê°’ì´?´ì•¼ ?œë‹¤1NF .', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 44ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 44
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 45, '????ë¡?ë§ëŠ” ê²ƒì??ë¦´ë ˆ?´ì…˜ ?´ì˜ ?œí”Œ?¤ì´ ê°??ì„±???„ë©”?¸ì— ì§€?•ëœ ê°’ë§Œ??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 45ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 45
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 46, '?´ê³  ????ë¥?ë§Œì¡±?˜ëŠ” ê´€ê³„A B B C , A C', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 46ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 46
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 47, 'DML SQL ?DELETE, UPDATE, CREATE, ALTER', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 47ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 47
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 48, ', , ?Œë§ˆ??ê´€???‘ì—…???ë™?¼ë¡œ ?˜í–‰?˜ëŠ” ?ˆì°¨???€SQL ??¸ë¦¬ê±?Trigger)', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 48ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 48
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 49, '(Logical Design) ?‘ì—…???„ë‹Œ ê²ƒì???ˆì½”??ì§‘ì¤‘??ë¶„ì„ ë°??¤ê³„', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 49ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 49
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 50, 'E-R ?ê°œì²´?€???¬ê°??', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 50ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 50
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 51, '(Locking) ??°ì´?°ë² ?´ìŠ¤ ?Œì¼ ?ˆì½”???±ì? ë¡œí‚¹ ?¨ìœ„ê°€ ?????ˆë‹¤, , .', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 51ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 51
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 52, '(View) ?ë·°ëŠ” ë¬¸ì„ ?¬ìš©?˜ì—¬ ?•ì˜?œë‹¤CREATE .', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 52ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 52
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 53, 'ê²ƒì???„ë©”??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 53ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 53
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 54, '?´ìš©?˜ì—¬ ??ê°œì˜ ë¦´ë ˆ?´ì…˜???˜ë‚˜ë¡??©ì³???ˆë¡œ??ë¦´ë ˆ?´ì…˜??ë§Œë“œ???°ì‚°?€', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 54ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 54
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 55, '?œì„œ ?¹ì • ì§€??˜ ì»´í“¨???œìŠ¤?œì´???¤íŠ¸?Œí¬???¥ì• ê°€ ë°œìƒ?´ë„ ?°ì´??ë¬´ê²°?±ì´ ë³´ì¥?œë‹¤ ??ê²ƒê³¼ ê´€ê³„ìˆ??ê²ƒì?.????¥ì•  ?¬ëª…??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 55ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 55
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 56, '( ) ? ?„ë³´?¤ëŠ” ë¦´ë ˆ?´ì…˜???ˆëŠ” ëª¨ë“  ?œí”Œ???€??? ì¼?±ê³¼ ??ëª¨ë‘ ë§Œì¡±?œì¼œ???œë‹¤( ) . ì¤‘ë³µ??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 56ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 56
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 57, 'SQL ? ê°€ê²??„ì„œê°€ê²©SELECT FROM ì±…ë²ˆ??ì±…ë²ˆ???„ì„œ WHERE (SELECT FROM WHERE ï¼?ì±…ëª… ?ë£Œêµ¬ì¡°=????; ?„ì„œ[ ] ?„ì„œê°€ê²?[ ] ì±…ë²ˆ??ì±…ëª… ì±…ë²ˆ??ê°€ê²?111 ?´ì˜ì²´ì œ 111 20,000 222 ?ë£Œêµ¬ì¡° 222 25,000 333 ì»´í“¨?°êµ¬ì¡?333 10,000 444 15,000 10,000', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 57ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 57
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 58, '(DCL) ??°ì´??ë³´ì•ˆ', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 58ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 58
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 59, 'DROPê°’ì„ ?? œ??ê²½ìš° ?ë™?ìœ¼ë¡??ì‹ ?Œì´ë¸”ì˜ ?´ë‹¹ ?ˆì½”?œë? ?? œ?˜ê¸° ?„í•œ ?µì…˜?€?CLUSTER', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 59ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 59
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 60, '?¸ëœ??…˜???°ì‚°?€ ?°ì´?°ë² ?´ìŠ¤??ëª¨ë‘ ë°˜ì˜?˜ë“ ì§€ ?„ë‹ˆ ë©??„í? ë°˜ì˜?˜ì? ?Šì•„???œë‹¤. Durability', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 60ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 60
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 61, 'UNIX (Shell) ?ëª…ë ¹???´ì„ê¸°ì´??', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 61ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 61
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 62, 'TCP/IP ?HTTP', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 62ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 62
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 63, 'C ?^', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 63ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 63
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 64, '(Coupling)ê²ƒì????ëª¨ë“ˆ ?´ì— ?ˆëŠ” ì²˜ë¦¬?”ì†Œ???¬ì´??ê¸°ëŠ¥?ì¸ ?°ê? ?•ë„ë¥?, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 64ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 64
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 65, '(Thread) ???ê°œì˜ ?„ë¡œ?¸ìŠ¤???¬ëŸ¬ ê°œì˜ ?¤ë ˆ?œë? ê°€ì§????†ë‹¤.', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 65ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 65
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 66, 'C b[5] ? static int b[9]={1, 2, 3}; 0', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 66ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 66
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 67, '(Banker?™s Algorithm)ì¤??´ë–¤ ê¸°ë²•???´ë‹¹?˜ëŠ”ê°€?Avoidance', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 67ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 67
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 68, 'IEEE 802.11 LAN QoS ?„í•´ ì§€??ê¸°ëŠ¥??ì±„íƒ??ê²ƒì?MAC ?802.11a', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 68ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 68
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 69, 'TCP/IP IP MAC ?UDP', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 69ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 69
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 70, 'HRN(Highest Response-ratio Next)ë¡??³ì? ?Šì? ê²ƒì???€ê¸??œê°„??ê¸??„ë¡œ?¸ìŠ¤??ê²½ìš° ?°ì„ ?œìœ„ê°€ ?’ì•„ì§„ë‹¤.', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 70ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 70
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 71, '?í˜¸ ë°°ì œ(mutual exclusion)', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 71ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 71
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 72, '(Page reference)ë¡?? ì…? ì¶œ ?Œê³ ë¦¬ì¦˜???¬ìš©??ê²½ìš° ?˜ì´ì§€ ë¶€??Page Fault) ?Ÿìˆ˜????? ë‹¹???˜ì´ì§€ ?„ë ˆ???˜ëŠ” ?´ê³  ì²˜ìŒ?ëŠ” ëª¨ë“  ? ( , 3 , ?„ë ˆ?„ì´ ë¹„ì–´ ?ˆë‹¤.) ?˜ì´ì§€ ì°¸ì¡°?? > 7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0 13', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 72ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 72
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 73, 'C ?student2019', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 73ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 73
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 74, 'IPv6 ?ë¹„íŠ¸??ì£¼ì†Œ ê³µê°„???œê³µ?œë‹¤128 .', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 74ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 74
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 75, 'Ready', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 75ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 75
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 76, 'IPv6 ?Unicast', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 76ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 76
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 77, 'ê¸°ëŠ¥???‘ì§‘??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 77ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 77
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 78, 'JAVA ?public', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 78ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 78
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 79, 'PHP', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 79ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 79
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 80, 'OSI-7?„í•´ ?¤ë¥˜ ê²€ì¶œê³¼ ë³µêµ¬ ?ë¦„ ?œì–´ë¥??˜í–‰?˜ëŠ” ê³„ì¸µ?€, ??„ì†¡ ê³„ì¸µ', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 80ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 80
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 81, '?°ì´??ê°ì²´ë¥??ì„±ê°’ì˜ ???•íƒœë¡??œí˜„?˜ëŠ” ?•ì‹?¼ë¡œ ?ë°”?¤í¬ë¦½Â·íŠ¸ ë¥?? ë?ë¡?ê°œë°œ?˜ì–´ì§??•ì‹?€(JavaScript) ?Python', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 81ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 81
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 82, '15 ?RIP', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 82ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 82
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 83, 'IP ICMPë¥?ë³´ë‚´ ?¤íŠ¸?Œí¬ ?ëŠ” ?œìŠ¤?œì˜ ?íƒœë¥?ë¶ˆëŠ¥?¼ë¡œ ë§Œë“œ??ê³µê²© ë°©ë²•?€?TearDrop', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 83ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 83
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 84, 'CMM(Capability Maturity Model) ?ìµœì ?¨ê³„', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 84ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 84
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 85, 'UWB(Ultra Wide Band)ë¸”ë£¨?¬ìŠ¤ ê¸°ìˆ ???¬ìš©?˜ì—¬ ?µì‹ ë§ì„ ?•ì„±?˜ëŠ” ë¬´ì„  ?¤íŠ¸?Œí¬ ê¸°ìˆ ?€?PICONET', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 85ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 85
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 86, 'COCOMO model ë¡??¼ê´„ ?ë£Œ ì²˜ë¦¬??ê³¼í•™ê¸°ìˆ  ê³„ì‚°??ë¹„ì¦ˆ?ˆìŠ¤ ?ë£Œ ì²˜ë¦¬?©ìœ¼ë¡?, ë§??¼ì¸ ?´í•˜???Œí”„?¸ì›¨?´ë? ê°œë°œ?˜ëŠ” ? í˜•?€5 ?embeded', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 86ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 86
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 87, 'ID, ì¤‘ìš”???•ë³´ë¥?ëª°ë˜ ë¹¼ê????´í‚¹ ê³µê²©?€?Key Logger Attack', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 87ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 87
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 88, 'LOC 50000 , ???‰ê·  ?ì‚°?±ì´ ?¼ì¸ ê°œë°œ??ì°¸ì—¬???„ë¡œê·¸ë˜ë¨¸ê? ??200 , 10????ê°œë°œ ?Œìš” ê¸°ê°„?€, ?ê°œì›”25', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 88ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 88
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 89, 'Rayleigh-Norden ?°ì •ê¸°ë²•?€?ëª¨í˜•Putnam', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 89ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 89
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 90, '?”í˜¸ ?Œê³ ë¦¬ì¦˜ ê¸°ë²•?€?RSA', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 90ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 90
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 91, '?´ë¥´??ê°œë°œë°©ë²•?¼ë¡œ ?„í—˜ê´€ë¦¬ê? ì¤‘ì‹¬???Œí”„?¸ì›¨???ëª…ì£¼ê¸° ëª¨í˜•?€??˜ì„ ??ëª¨í˜•', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 91ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 91
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 92, '?¸í„°???¬ìš©?ì˜ ì»´í“¨?°ì— ì¹¨ì…???´ë? ë¬¸ì„œ ?Œì¼ ?±ì„ ?”í˜¸?”í•´ ?¬ìš©?ê? ?´ì? ëª»í•˜ê²??˜ëŠ” ê³µê²©?¼ë¡œ ?”í˜¸ ?? ?…ìš© ?„ë¡œê·¸ë¨???„ë‹¬??ì¡°ê±´?¼ë¡œ ?¬ìš©?ì—ê²??ˆì„ ?”êµ¬ ?˜ê¸°???œë‹¤. Smishing', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 92ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 92
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 93, 'ë¬´ê²°??ê²€??, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 93ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 93
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 94, '???ì—ˆ?¤ê? ê·?ê°’ì´ ë³€ê²½ë˜?ˆì„ ê²½ìš° ?¤ë²„?Œë¡œ???íƒœë¡?ê°€?•í•˜???„ë¡œê·¸ë¨ ?¤í–‰??ì¤‘ë‹¨?˜ëŠ” ê¸°ìˆ ?€?ëª¨ë“œì²´í¬', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 94ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 94
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 95, 'ë¨?ê²ƒì???ˆì§ˆ ë³´ì¦', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 95ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 95
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 96, '?”ì†Œ??ê¸°ë???, '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 96ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 96
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 97, '?ì˜¤???ŒìŠ¤ë¥?ê¸°ë°˜?¼ë¡œ ??ë¶„ì‚° ì»´í“¨???Œë«?¼ì´?? ?ì¼ë°?ê¸?ì»´í“¨?°ë“¤ë¡?ê°€?í™”???€???¤í† ë¦¬ì?ë¥??•ì„±PC ?œë‹¤. ?ë‹¤?‘í•œ ?ŒìŠ¤ë¥??µí•´ ?ì„±??ë¹…ë°?´í„°ë¥??¨ìœ¨?ìœ¼ë¡??€???˜ê³  ì²˜ë¦¬?œë‹¤. ?˜ë‘¡(Hadoop)', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 97ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 97
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 98, ', ??ë¶„ì„?˜ëŠ” ?„êµ¬??trace', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 98ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 98
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 99, 'ê°œë°œ ì¤?ë°œìƒ???”êµ¬?¬í•­???½ê²Œ ë°˜ì˜?????ˆë‹¤.', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 99ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 99
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 12, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 100, '(Tailoring) ê²ƒì???©ê¸° ë¹„ìš©/', '2020??1,2???µí•© ?•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 100ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 12
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 100
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Visitor', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Prototype', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Bridge', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€???„ë¡œê·¸ë¨?ì„œ ?°ì´?°ë? ì¶”ìƒ?”í•˜???¨ìœ„??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´ë˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ì†??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë©”ì‹œì§€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€??ê¸°ë²•?ì„œ ?´ë˜?¤ë“¤ ?¬ì´??ë¶€ë¶??„ì²´ ê´€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì¶”ìƒ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ìº¡ìŠ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì§‘ë‹¨??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€??ë¶„ì„ ë°©ë²•ë¡?ì¤??¤ì´?´ê·¸?¨ì„ ?¬ìš©?˜ì—¬ ê°ì²´??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë°©ë²•Booch', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë°©ë²•Jacobson', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë°©ë²•Wirfs-Brocks', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì½”ë“œ ?¤ê³„?ì„œ ?¼ì •???¼ë ¨ë²ˆí˜¸ë¥?ë¶€?¬í•˜??ë°©ì‹??ì½”ë“œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¸”ë¡ ì½”ë“œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œì°¨ ì½”ë“œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œì˜ ?«ì ì½”ë“œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???¤ê³„ ??êµ¬ì¶•???Œë«?¼ì˜ ?±ëŠ¥?¹ì„± ë¶„ì„???¬ìš©?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°€?©ì„±(Availability)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìš©ë¥?Utilization)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œë²„ ?œë‹(Server Tuning)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë£Œ ?¬ì „?ì„œ ?ë£Œ???ëµ???˜ë??˜ëŠ” ê¸°í˜¸??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '**', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '=', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '( )', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê²€? íšŒ???„ì— ?”êµ¬?¬í•­ ëª…ì„¸?œë? ë¯¸ë¦¬ ë°°í¬?˜ì—¬ ?¬ì „ ê²€? í•œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?™ë£Œ ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?Œí¬ ?¤ë£¨', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œë°œ??ê²€??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°€ ê°–ê³  ?ˆëŠ” ì£¼ìš” ê¸°ëŠ¥???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?Œí”„?¸ì›¨???ëª…ì£¼ê¸° ???¨ê³„???°ê²°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¸ì–´ ë²ˆì—­', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤ì–‘???Œí”„?¸ì›¨??ê°œë°œ ëª¨í˜• ì§€??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ê°€ì§€ ê°€ì¹˜ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?˜ì‚¬?Œí†µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?•í˜• ë¶„ì„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¼ë“œë°?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¶„ì„ ??ê³ ë ¤?¬í•­?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?±ëŠ¥', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤íŠ¸?Œí¬ êµ¬ì„±??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?í˜¸ ?¸í™˜??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì°¨íŠ¸ ì¢…ë¥˜?ëŠ” ê°€?œì  ?„í‘œ ì´ì²´???„í‘œ ?¸ë????„í‘œê°€ HIPO , ,', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ˆë‹¤.ê¸°ëŠ¥ê³??ë£Œ???˜ì¡´ ê´€ê³„ë? ?™ì‹œ???œí˜„?????ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³´ê¸° ?½ê³  ?´í•´?˜ê¸° ?½ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ê³„ ?ì¹™?ì„œ ?„êµ¬???½ê²Œ ?´í•´?˜ê³  ?¬ìš©?????ˆì–´???œë‹¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì§ê???, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¬´ê²°??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '? ì—°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¼ë°”????ê°ì²´ì§€??ë¶„ì„ ?ˆì°¨ë¥?ê°€??ë°”ë¥´ê²??˜ì—´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '????ê°ì²´ ëª¨í˜• ê¸°ëŠ¥ ëª¨í˜• ?™ì  ëª¨í˜•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '????ê¸°ëŠ¥ ëª¨í˜• ?™ì  ëª¨í˜• ê°ì²´ ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '????ê¸°ëŠ¥ ëª¨í˜• ê°ì²´ ëª¨í˜• ?™ì  ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?????°ì´???ë¦„????êµ¬ì„±?”ì†Œ???¬í•¨?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Data Flow', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Data Store', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Data Dictionary', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ì¥ ëª¨ë¸?ì„œ ?¤í…Œ?ˆì˜¤ ?€??ê°ì²´ë¥??œí˜„?????¬ìš©?˜ëŠ”', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '(( ))', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '{{ }}', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '[[ ]]', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ëœ??…˜???¬ë°”ë¥´ê²Œ ì²˜ë¦¬?˜ê³  ?ˆëŠ”ì§€ ?°ì´?°ë? ê°ì‹œ?˜ê³  ?œì–´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ORB', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'TP monitor', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'HUB', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ë°©ë²• ì¤??”êµ¬?¬í•­ ë¶„ì„ ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?€?¹ì„± ì¡°ì‚¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?”êµ¬?¬í•­ ?•ì˜ ë¬¸ì„œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤ê³„ ëª…ì„¸???‘ì„±', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³µí†µ ëª¨ë“ˆ ???€ ??ëª???ê¸°ë²• ì¤??´ë‹¹ ê¸°ëŠ¥???€ ???¼ê??˜ê²Œ ?´í•´ ?˜ê³ ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ëª…í™•??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?…ë¦½??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ìš©??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨ë¸?ì„œ ?¬ìš©?˜ëŠ” ???í•˜ì§€ ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Object Diagram', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Component Diagram', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Activity Diagram', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?‰ê? ?ìˆ˜???°ë¥¸ ?±ì ë¶€?????¤ìŒ ?œì? ê°????´ë? êµ¬í˜„ ???Œí”„????, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '80', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '90', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '101', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¸ë¦¬??ì°¨ìˆ˜ ?€ ?¨ë§ ?¸ë“œ ???˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì°¨ìˆ˜ ?¨ë§ ?¸ë“œ : 2, : 4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì°¨ìˆ˜ ?¨ë§ ?¸ë“œ : 4, : 8', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì°¨ìˆ˜ ?¨ë§ ?¸ë“œ : 2, : 8', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê²€ì¦?ê²€??ê¸°ë²• ì¤?ê°œë°œ?ì˜ ?¥ì†Œ?ì„œ ?¬ìš©?ê? ê°œë°œ?ê? ?ì—??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?•ìƒ ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ŒíŒŒ ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë² í? ê²€??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?˜í–¥???µí•©???ˆì–´??ëª¨ë“ˆ ê°„ì˜ ?µí•© ?œí—˜???„í•´ ?¼ì‹œ?ìœ¼ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Driver', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Procedure', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Function', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???ˆì§ˆ ì¸¡ì •???„í•´ ê°œë°œ??ê´€?ì—??ê³ ë ¤?´ì•¼ ????ª©??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¬´ê²°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìš©??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°„ê²°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???ŒìŠ¤?¸ì—???¤ë¥˜?????„ì²´ ëª¨ë“ˆ???´ì—??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??ë²•ì¹™Boehm', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??ë²•ì¹™Pareto', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ë²•ì¹™Jackson', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì????€?‘ê¶Œ ê´€ë¦???ê¸°ìˆ  ?”ì†Œê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?•ì±… ê´€ë¦?ê¸°ìˆ ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?”í˜¸??ê¸°ìˆ ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë°©í™”ë²?ê¸°ìˆ ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸í„°?˜ì´??ë³´ì•ˆ???„í•´ ?¤íŠ¸?Œí¬ ?ì—­???ìš©?????ˆëŠ” ?”ë£¨?˜ê³¼', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SMTP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SSL', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'S-HTTPS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸í„°?˜ì´??êµ¬í˜„ ê²€ì¦ë„êµ?ì¤??„ë˜?ì„œ ?¤ëª…?˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'STAF', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'FitNesse', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'RubyNode', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¨í‚¤ì§??„êµ¬ ?œìš© ??ê³ ë ¤ ?¬í•­ê³?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¬ìš©???¸ì˜?±ì„ ?„í•œ ë³µì¡??ë°?ë¹„íš¨?¨ì„± ë¬¸ì œë¥?ê³ ë ¤?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë³´ì•ˆ???¨ì¼ ê¸°ì¢…?ì„œë§??¬ìš©?????ˆë„ë¡??´ì•¼ ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œí’ˆ ì¢…ë¥˜???í•©???”í˜¸???Œê³ ë¦¬ì¦˜???ìš©?œë‹¤SW .', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???•ìƒ ê´€ë¦¬ì˜ ?˜ë?ë¡??ì ˆ??ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°œë°œ ê³¼ì •??ë³€ê²??¬í•­??ê´€ë¦¬í•˜??ê²?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ŒìŠ¤??ê³¼ì •?ì„œ ?Œí”„?¸ì›¨?´ë? ?µí•©?˜ëŠ” ê²?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œë°œ ?¸ë ¥??ê´€ë¦¬í•˜??ê²?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ë²•?´ë‹¤.??ëª¨ë“  ë¬¸ì¥????ë²??´ìƒ ?˜í–‰?¨ìœ¼ë¡œì¨ ì§„í–‰ Source Code', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œë‹¤.ëª¨ë“ˆ ?ˆì˜ ?‘ë™??ì§ì ‘ ê´€ì°°í•  ???ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ì¶œë¬¼ì˜ ê°?ê¸°ëŠ¥ë³„ë¡œ ?ì ˆ???„ë¡œê·¸ë¨???œì–´êµ¬ì¡°???°ë¼', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '? íƒ ë°˜ë³µ ?±ì˜ ë¶€ë¶„ë“¤???˜í–‰?¨ìœ¼ë¡œì¨ ?¼ë¦¬??ê²½ë¡œë¥??ê? , ?œë‹¤.?¸ê³„??ì½”ë“œ ???€???¤ëª…?¼ë¡œ ?³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¯¸í•œ???„ì£¼ ?¤ë˜?˜ê±°??ì°¸ê³ ë¬¸ì„œ ?ëŠ” ê°œë°œ?ê? ?†ì–´ ? ì?ë³´ìˆ˜ ?‘ì—…', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???´ë ¤???„ë¡œê·¸ë¨???˜ë??œë‹¤.?¤ë¥˜ê°€ ?†ì–´ ?”ë²„ê¹?ê³¼ì •???„ìš” ?†ëŠ” ?„ë¡œê·¸ë¨???˜ë??œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¬ìš©?ê? ì§ì ‘ ?‘ì„±???„ë¡œê·¸ë¨???˜ë??œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¸ë¦¬ë¥??„ìœ„ ?œíšŒ ??ê²°ê³¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ï¼?A B / C * D * E', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ï¼‹A / B * C * D E', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ï¼?* * / A B C D E', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ï¼??Œê³ ë¦¬ì¦˜ ?œê°„ ë³µì¡?????˜ë??˜ëŠ” ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?Œê³ ë¦¬ì¦˜ ?…ë ¥ ?°ì´???˜ê? ??ê°?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?Œê³ ë¦¬ì¦˜ ?˜í–‰?œê°„???…ë ¥ ?°ì´???˜ì? ê´€ê³„ì—†???¼ì •', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?Œê³ ë¦¬ì¦˜ ê¸¸ì´ê°€ ?…ë ¥ ?°ì´?°ë³´???‘ìŒ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ë ¬??ê°œì˜ ?°ì´?°ë? ì²˜ë¦¬?˜ëŠ”?????œê°„???Œìš”?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?½ì… ?•ë ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë²„ë¸” ?•ë ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?©ë³‘ ?•ë ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???Œí”„?¸ì›¨???ˆì§ˆ ?¹ì„± ì¤?ê¸°ëŠ¥????, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?í•©??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?•í™•??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³´ì•ˆ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??êµ¬ì¶• ? í˜•?¼ë¡œ ?³ì? ?Šì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Hub & Spoke', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Message Bus', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Tree', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ŒìŠ¤ì½”ë“œ ?ˆì§ˆ ë¶„ì„ ?„êµ¬ ì¤??•ì  ë¶„ì„ ?„êµ¬ê°€ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'cppcheck', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'valMeter', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'checkstyle', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë°˜ì •ê·œí™” ? í˜• ì¤?ì¤‘ë³µ ?Œì´ë¸”ì„ ì¶”ê??˜ëŠ” ë°©ë²•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì§‘ê³„ ?Œì´ë¸”ì˜ ì¶”ê?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì§„í–‰ ?Œì´ë¸”ì˜ ì¶”ê?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¹ì • ë¶€ë¶„ë§Œ???¬í•¨?˜ëŠ” ?Œì´ë¸?ì¶”ê?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ë¶„ë¥˜ ì¤????´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ALTER', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'DROP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'CREATE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œì´ë¸”ì— ?…ì¼?´ê³¼ ?™ìƒ ëª?ì¤‘êµ­?´ê³¼ ?™ìƒ ëª?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '????50, 3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '????130, 3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '????130, 130', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?????¤ìŒ ??ë¦´ë ˆ?´ì…˜?ì„œ ?¸ë˜?¤ë¡œ ?¬ìš©??ê²ƒì? ??ë°‘ì¤„ ì¹œì†?±ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê³¼ëª©ë²ˆí˜¸', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?™ë²ˆ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê³¼ëª©ëª?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ê·œ??ê³¼ì • ì¤??ì„œ ê°€ ?˜ê¸° ?„í•œ ì¡°ê±´?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¥?ë§Œì¡±?˜ê³  ?¤ê? ?„ë‹Œ ëª¨ë“  ? íŠ¸ë¦¬ë·°?¸ë“¤??ê¸°ë³¸?¤ì— 1NF ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?´í–‰?ìœ¼ë¡??¨ìˆ˜ ì¢…ì†?˜ì? ?Šì•„???œë‹¤.ë¥?ë§Œì¡±?˜ê³  ?¤ì¹˜ ì¢…ì†???œê±°?˜ì–´???œë‹¤1NF .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¥?ë§Œì¡±?˜ê³  ?¤ê? ?„ë‹Œ ëª¨ë“  ?ì„±??ê¸°ë³¸?¤ì— ?€?˜ì—¬ ?„ì „ 1NF', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¨ìˆ˜??ì¢…ì† ê´€ê³„ë? ë§Œì¡±?´ì•¼ ?œë‹¤.?°ì´??ë¬´ê²°???œì•½ì¡°ê±´ ì¤?ê°œì²´ ë¬´ê²°???œì•½ ì¡°ê±´???€???¤ëª…??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°€?¸ì•¼ ?œë‹¤.ê¸°ë³¸?¤ì— ?í•´ ?ˆëŠ” ? íŠ¸ë¦¬ë·°?¸ëŠ” ??ê°’ì´??ì¤‘ë³µ ê°’ì„ ê°€ì§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???†ë‹¤.ë¦´ë ˆ?´ì…˜?€ ì°¸ì¡°?????†ëŠ” ?¸ë˜??ê°’ì„ ê°€ì§????†ë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¸ë˜??ê°’ì? ì°¸ì¡° ë¦´ë ˆ?´ì…˜??ê¸°ë³¸??ê°’ê³¼ ?™ì¼?´ì•¼ ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´í–‰???¨ìˆ˜ ì¢…ì† ê´€ê³„ë? ?˜ë??˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???????´ê³  ????ë¥?ë§Œì¡±?˜ëŠ” ê´€ê³„A B B C , C A', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???????´ê³  ????ë¥?ë§Œì¡±?˜ëŠ” ê´€ê³„A B B C , B A', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???????´ê³  ????ë¥?ë§Œì¡±?˜ëŠ” ê´€ê³„A B B C , C B', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?????????´ë‹¹?˜ëŠ” ëª…ë ¹?¼ë¡œë§??˜ì—´??ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'INSERT, DELETE, UPDATE, DROP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SELECT, INSERT, DELETE, UPDATE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SELECT, INSERT, DELETE, ALTER', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´?°ë² ?´ìŠ¤ ?œìŠ¤?œì—???½ì… ê°±ì‹  ?? œ ?±ì˜ ?´ë²¤?¸ê? ë°œìƒ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¬´ê²°??Integrity)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '? ê¸ˆ(Lock)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³µê?(Rollback)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´?°ë² ?´ìŠ¤???¼ë¦¬???¤ê³„ ?¨ê³„?ì„œ ?˜í–‰ ?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ë¦¬???°ì´?°ë² ?´ìŠ¤ êµ¬ì¡°ë¡?ë§¤í•‘(mapping)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¸ëœ??…˜ ?¸í„°?˜ì´???¤ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤í‚¤ë§ˆì˜ ?‰ê? ë°??•ì œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨ë¸???œí˜„ ë°©ë²•?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê´€ê³„í???ë§ˆë¦„ëª?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ì„± ?¤ê°??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ê²° ??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë³‘í–‰?œì–´??ë¡œí‚¹ ?¨ìœ„???€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¡œí‚¹ ?¨ìœ„ê°€ ?‘ì•„ì§€ë©?ë¡œí‚¹ ?¤ë²„?¤ë“œê°€ ê°ì†Œ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¡œí‚¹ ?¨ìœ„ê°€ ?‘ì•„ì§€ë©??°ì´?°ë² ?´ìŠ¤ ê³µìœ ?„ê? ì¦ê??œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œêº¼ë²ˆì— ë¡œí‚¹ ?????ˆëŠ” ê°ì²´???¬ê¸°ë¥?ë¡œí‚¹ ?¨ìœ„?¼ê³  ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë·????€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë·°ëŠ” ?°ì´?°ì˜ ?¼ë¦¬???…ë¦½?±ì„ ?œê³µ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë·°ë? ?œê±°???Œì—??ë¬¸ì„ ?¬ìš©?œë‹¤DROP .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë·°ëŠ” ?€?¥ì¥ì¹??´ì— ë¬¼ë¦¬?ìœ¼ë¡?ì¡´ì¬?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?˜ë‚˜??? íŠ¸ë¦¬ë·°?¸ê? ê°€ì§????ˆëŠ” ?ìê°’ë“¤??ì§‘í•©???˜ë? ?˜ëŠ”', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œí”Œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?”í‹°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤í˜•??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê´€ê³„ë????°ì‚°?ì„œ ??ë¦´ë ˆ?´ì…˜??ê³µí†µ?¼ë¡œ ê°€ì§€ê³??ˆëŠ” ?ì„±??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë¶„ì‚° ?°ì´?°ë² ?´ìŠ¤ ëª©í‘œ ì¤??°ì´?°ë² ?´ìŠ¤??ë¶„ì‚°??ë¬¼ë¦¬???˜ê²½??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë³‘í–‰ ?¬ëª…??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?„ì¹˜ ?¬ëª…??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¤‘ë³µ ?¬ëª…??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¤ëª…???ˆì— ?¤ì–´ê°??´ìš©?¼ë¡œ ?í•©??ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ìµœì†Œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì°¸ì¡°??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?™ì¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ë¬¸ì˜ ?¤í–‰ ê²°ê³¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '15,000', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '20,000', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '25,000', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´???œì–´?¸ì–´ ??ê¸°ëŠ¥?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ë¦¬??ë¬¼ë¦¬???°ì´??êµ¬ì¡° ?•ì˜,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¬´ê²°??? ì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³‘í–‰?˜í–‰ ?œì–´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì°¸ì¡° ë¬´ê²°?±ì„ ? ì??˜ê¸° ?„í•˜??ë¬¸ì—??ë¶€ëª??Œì´ë¸”ì˜ ??ª©', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'CASCADE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SET-NULL', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'RESTRICTED', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ëœ??…˜???¹ì„± ì¤??¤ìŒ ?¤ëª…???´ë‹¹?˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Share', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Consistency', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Atomicity', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??????ê´€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œìŠ¤?œê³¼ ?¬ìš©??ê°„ì˜ ?¸í„°?˜ì´?¤ë? ?´ë‹¹?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ëŸ¬ ì¢…ë¥˜???˜ì´ ?ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?„ë¡œ?¸ìŠ¤ ê¸°ì–µ?¥ì¹˜ ?…ì¶œ??ê´€ë¦¬ë? ?˜í–‰?œë‹¤, , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„ë¡œ? ì½œ ì¤??„ì†¡ê³„ì¸µ ?„ë¡œ? ì½œ?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SMTP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'FTP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'TCP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ì–´?ì„œ ë¹„íŠ¸ ?¼ë¦¬?°ì‚°?ì— ?´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '&', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '~', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œìŠ¤?œì—??ëª¨ë“ˆ ?¬ì´??ê²°í•©?????€???¤ëª…?¼ë¡œ ?³ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?˜í??¸ë‹¤.ê²°í•©?„ê? ?’ìœ¼ë©??œìŠ¤??êµ¬í˜„ ë°?? ì?ë³´ìˆ˜ ?‘ì—…???½ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ëª¨ë“ˆ ê°„ì˜ ê²°í•©?„ë? ?½í•˜ê²??˜ë©´ ëª¨ë“ˆ ?…ë¦½?±ì´ ?¥ìƒ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ë£Œê²°í•©?„ëŠ” ?´ìš©ê²°í•©?„ë³´??ê²°í•©?„ê? ?’ë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ë ˆ?????€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì»¤ë„ ?¤ë ˆ?œì˜ ê²½ìš° ?´ì˜ì²´ì œ???˜í•´ ?¤ë ˆ?œë? ?´ìš©?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìš©???¤ë ˆ?œì˜ ê²½ìš° ?¬ìš©?ê? ë§Œë“  ?¼ì´ë¸ŒëŸ¬ë¦¬ë? ?¬ìš©?˜ì—¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤ë ˆ?œë? ?´ìš©?œë‹¤.?¤ë ˆ?œë? ?¬ìš©?¨ìœ¼ë¡œì¨ ?˜ë“œ?¨ì–´ ?´ì˜ì²´ì œ???±ëŠ¥ê³??‘ìš© ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¡œê·¸?¨ì˜ ì²˜ë¦¬?¨ì„ ?¥ìƒ?œí‚¬ ???ˆë‹¤.?¸ì–´?ì„œ ë°°ì—´ ??ê°’ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '1', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?€?‰ê? ?Œê³ ë¦¬ì¦˜ ?€ êµì°©?íƒœ???´ê²° ë°©ë²•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Detection', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Prevention', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Recovery', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí‚¹ ê·¸ë£¹??ë¬´ì„  ?œì????„í™© ì¤?ê°•í™”ë¥?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '802.11b', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '802.11g', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '802.11e', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤íŠ¸?Œí¬?ì„œ ì£¼ì†Œë¥?ì£¼ì†Œë¡?ë³€?˜í•˜???„ë¡œ? ì½œ?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ARP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'TCP', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ICMP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ì?ì¤„ë§ ë°©ì‹???€???¤ëª…??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ë²•??ë³´ì™„?˜ê¸° ?„í•œ ë°©ì‹?´ë‹¤SJF .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê¸??‘ì—…ê³?ì§§ì? ?‘ì—… ê°„ì˜ ì§€?˜ì¹œ ë¶ˆí‰?±ì„ ?´ì†Œ?????ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ì„ ?œìœ„ë¥?ê³„ì‚°?˜ì—¬ ê·??˜ì¹˜ê°€ ê°€????? ê²ƒë????’ì? ?œìœ¼ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì„ ?œìœ„ê°€ ë¶€?¬ëœ??êµì°© ?íƒœ ë°œìƒ???„ìš”ì¶©ë¶„ì¡°ê±´???„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ìœ ?€ ?€ê¸?hold and wait)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?˜í˜• ?€ê¸?circular wait)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '? ì (preemption)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???˜ì´ì§€ ì°¸ì¡° ?????€???˜ì´ì§€ êµì²´ ê¸°ë²•??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '14', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '15', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '20', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ì–´?ì„œ ?¬ìš©?????†ëŠ” ë³€?˜ëª…?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'text-color', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '_korea', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'amount', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¸ì¦ ë°?ë³´ì•ˆ ê¸°ëŠ¥???¬í•¨?˜ê³  ?ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¨í‚· ?¬ê¸°ê°€ ë¡?ê³ ì •?˜ì–´ ?ˆë‹¤64Kbyte .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?•ì¥ ?¤ë”ë¥??µí•´ ?¤íŠ¸?Œí¬ ê¸°ëŠ¥ ?•ì¥???©ì´?˜ë‹¤IPv6 .', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„ë¡œ?¸ìŠ¤ ?íƒœ??ì¢…ë¥˜ê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Running', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Request', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Exit', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ì£¼ì†Œì²´ê³„ë¡?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Anycast', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Broadcast', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Multicast', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?‘ì§‘?„ê? ê°€????? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œê°„???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ˆì°¨???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ì—°???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ì–´?ì„œ ?‘ê·¼?œí•œ?ê? ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'protected', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'package', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'private', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤í¬ë¦½íŠ¸ ?¸ì–´ê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Cobol', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Basic', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Python', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³„ì¸µ?ì„œ ì¢…ë‹¨ ê°?? ë¢°???ˆê³  ?¨ìœ¨?ì¸ ?°ì´?°ë? ?„ì†¡?˜ê¸°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¸ì…˜ ê³„ì¸µ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œí˜„ ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?‘ìš© ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¹ê³¼ ì»´í“¨???„ë¡œê·¸ë¨?ì„œ ?©ëŸ‰???ì? ?°ì´?°ë? êµí™˜?˜ê¸° ?„í•´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'XML', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'JSON', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'WEB SEVER', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ìµœë? ?‰ìˆ˜ë¥?ë¡??œí•œ???¼ìš°???„ë¡œ? ì½œ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'OSPF', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Static', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'EIGRP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ëŠ” ???¹ì„±???…ìš©?˜ì—¬ ?¹ì • ?¬ì´?¸ì— ì§‘ì¤‘?ìœ¼ë¡??°ì´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Smishing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Qshing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Smurfing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨ë¸???ˆë²¨ë¡??³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê´€ë¦¬ë‹¨ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?•ì˜?¨ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê³„íš?¨ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¬ëŸ¬ ê°œì˜ ?…ë¦½???µì‹ ?¥ì¹˜ê°€ ê¸°ìˆ  ?ëŠ”', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SCRUM', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'NFC', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'WI-SUN', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì¤?ê¸°ê? ?´ë??ì„œ ê°œë°œ??ì¤‘ì†Œ ê·œëª¨???Œí”„?¸ì›¨??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'organic', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'semi-detached', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'semi-embeded', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì»´í“¨???¬ìš©?ì˜ ?¤ë³´???€ì§ì„???ì????¨ìŠ¤?Œë“œ ??ê°œì¸??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Worm', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Rollback', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Zombie Worm', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê¸°ë²•???˜í•˜???ˆì¸¡??ì´??¼ì¸?˜ê? ?¼ì¸ ?„ë¡œê·¸ë˜ë¨¸ì˜', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°œì›”50', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°œì›”200', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œì›”2000', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³¡ì„ ???¸ë ¥ ë¶„í¬?„ë? ?´ìš©???„ë¡œ?íŠ¸ ë¹„ìš©', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¸íŒŒ??ëª¨í˜•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ëª¨í˜•COCOMO', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê¸°ëŠ¥?ìˆ˜ ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œì¸??ë¶„í•´ ë¬¸ì œë¥??´ìš©??ê³µê°œ???”í˜¸??ê¸°ë²•???ë¦¬ ?¬ìš©?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ECC', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'PKI', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'PRM', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„ë¡œ? í??…ì„ ì§€?ì ?¼ë¡œ ë°œì „?œì¼œ ìµœì¢… ?Œí”„?¸ì›¨??ê°œë°œê¹Œì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¸íŒŒ??ëª¨í˜•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??¬??ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê¸°ëŠ¥?ìˆ˜ ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¤ëª…???•ë³´ë³´ì•ˆ ì¹¨í•´ ê³µê²© ê´€???©ì–´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'C-brain', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Trojan Horse', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Ransomware', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë°±ë„???ì? ë°©ë²•?¼ë¡œ ?€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?«íŒ ?¬íŠ¸ ?•ì¸', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¡œê·¸ ë¶„ì„', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?Œì¼ ê²€?¬SetUID', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë©”ëª¨ë¦¬ìƒ?ì„œ ?„ë¡œê·¸ë¨??ë³µê? ì£¼ì†Œ?€ ë³€?˜ì‚¬?´ì— ?¹ì • ê°’ì„ ?€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¦¬ì»¤ë²„ë¦¬ ?µì œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œìŠ¤ë¡œê·¸', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤íƒê°€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ?„ë ˆ?„ì›Œ?¬ë? ?ìš©??ê²½ìš° ê¸°ë??¨ê³¼ë¡?ê±°ë¦¬ê°€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œìŠ¤??ë³µì¡??ì¦ê?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°œë°œ ?©ì´??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³€ê²??©ì´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œìŠ¤???´ì˜ ?•ë³´???¤ì§ ?¸ê????¬ìš©?ë§Œ ?˜ì •?????ˆëŠ” ë³´ì•ˆ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¶€?¸ë°©ì§€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°€?©ì„±', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¬´ê²°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???¤ëª…?˜ëŠ” ?©ì–´ë¡??³ì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¹„ì»¨(Beacon)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìŠ¤?˜ì–´(Foursquare)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë§´ë¦¬?¤í„°(Memristor)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¬ë˜ì»¤ê? ì¹¨ì…?˜ì—¬ ë°±ë„?´ë? ë§Œë“¤???“ê±°???¤ì • ?Œì¼??ë³€ê²½í–ˆ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'tripwire', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'udpdump', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'cron', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??¬??ëª¨í˜•???¹ì§•?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œì°¨?ì¸ ?‘ê·¼ë°©ë²•???´ìš©?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¨ê³„???•ì˜?€ ?°ì¶œë¬¼ì´ ëª…í™•?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª¨í˜•???ìš© ê²½í—˜ê³??±ê³µ?¬ë?ê°€ ë§ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œì¼?¬ë§ ê°œë°œ ë°©ë²•ë¡ ì˜ ?´ë? ê¸°ì????´ë‹¹?˜ì? ?ŠëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ìˆ ?˜ê²½', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'êµ¬ì„±???¥ë ¥', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'êµ? œ?œì? ?ˆì§ˆê¸°ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 12
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );


-- Auto-generated from 2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸°
-- year=2020, round=3
-- exam_slug=jeongchogi
insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 1, 'ì²?·¨?€ ?¸í„°ë·?ì§ˆë¬¸ ê¸°ìˆ ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 1ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 1
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 2, '?ê°ì²´ë? ?ì„±?˜ê¸° ?„í•œ ?¸í„°?˜ì´?¤ë? ?•ì˜?˜ì—¬ ?´ë–¤ ???˜ìŠ¤ê°€ ?¸ìŠ¤?´ìŠ¤????ê²ƒì¸ì§€???œë¸Œ?´ë˜?¤ê? ê²°ì •?˜ë„ ë¡??˜ëŠ” ê²????¨í„´?´ë¼ê³ ë„ ?¨Virtual-Constructor ?¨í„´Visitor', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 2ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 2
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 3, 'ê¸°ëŠ¥ ëª¨ë¸ë§?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 3ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 3
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 4, '?ˆì°¨?€ ?„êµ¬ë³´ë‹¤ ê°œì¸ê³??Œí†µ??ì¤‘ìš”?˜ê²Œ ?ê°?œë‹¤.', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 4ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 4
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 5, 'WAS', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 5ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 5
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 6, 'UML ??ëª…??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 6ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 6
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 7, 'Encapsulation', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 7ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 7
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 8, 'ì»¤ë§¨???¨í„´(Command)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 8ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 8
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 9, 'UI ?ì¹™?€??¬ì†Œ??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 9ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 9
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 10, 'ë³µì¡??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 10ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 10
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 11, '( ) ? ì»´í¬?ŒíŠ¸ ?¤ê³„ ?????˜í•œ ?¤ê³„ ë¥??°ë? ê²½ìš° ?´â€? ) ??, ??ëª…ì„¸?ì„œ??ì»´í¬?ŒíŠ¸???¤í¼?ˆì´???¬ìš© ?„ì— ì°¸ì´ ?˜ì–´??????1) ?‰ì¡°ê±??¬ìš© ??ë§Œì¡±?˜ì–´????ê²°ê³¼ì¡°ê±´(2) ?¤í¼?ˆì´?˜ì´ ?¤í–‰?˜ëŠ” ?™ì•ˆ ??ƒ ë§Œì¡±?˜ì–´????ë¶?3) ë³€ì¡°ê±´ ?±ì´ ?¬í•¨?˜ì–´???œë‹¤. ?‘ì•½(Contract)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 11ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 11
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 12, 'UML , ?‰ìœ„ ?¤ì´?´ê·¸?¨ì— ?´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?(Behavioral) ?? ìŠ¤ì¼€?´ìŠ¤ ?¤ì´?´ê·¸??Use Case Diagram)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 12ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 12
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 13, 'ë¬¶ì–´???˜ë‚˜??ê³µí†µ???¹ì„±???œí˜„??ê²ƒì???¸ëœ??…˜', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 13ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 13
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 14, 'UML ????ê²ƒì?? ì¶”ìƒ??ê´€ê³?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 14ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 14
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 15, 'ê°€??ê±°ë¦¬ê°€ ë¨?ê²ƒì??ê°œë°œ?ì´ë¦?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 15ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 15
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 16, '=', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 16ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 16
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 17, '( )???ì‹ ??ê¸°ë°˜?€???ìœ„?´ë˜???¼ë¡œ êµì²´?????ˆì–´???¨ì„ ?˜ë?( )?˜ëŠ” ?ì¹™?€?ISP(Interface Segregation Principle)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 17ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 17
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 18, '(Data Flow Diagram) ?process, data flow, data store, comment', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 18ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 18
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 19, 'CASE(Computer-Aided Software Engineering) ?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì???Œí”„?¸ì›¨??ê°œë°œ ê³¼ì •???¼ë? ?ëŠ” ?„ì²´ë¥??ë™?”í•˜ê¸??„í•œ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 19ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 19
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨???¤ê³„', 20, 'ë¦¬íŒ©? ë§ ?‘ì„±???´ì™¸???„ë¬¸ ê²€??ê·¸ë£¹???”êµ¬?¬í•­ ëª…ì„¸??', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 20ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 20
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 21, 'ê±°ë¦¬ê°€ ë¨?ê²ƒì??IPSec', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 21ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 21
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 22, '?ˆì§ˆ ?’ì? ?Œí”„?¸ì›¨???í’ˆ ê°œë°œ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 22ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 22
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 23, '?„í•œ êµ? œ ?œì??€?ISO/IEC 2196', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 23ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 23
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 24, '?„êµ¬? ì? ?½ê²Œ ?´í•´?˜ëŠ” ì½”ë“œ ?‘ì„±', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 24ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 24
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 25, 'ê²½ê³„ê°?ë¶„ì„', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 25ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 25
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 26, 'McCabe cyclomatic ?¼ë§ˆ?¸ê?? 3', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 26ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 26
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 27, '(Selection) ?•ë ¬?˜ê³ ???œë‹¤ ?Œì „ ?„ì˜ ê²°ê³¼ë¡??³ì? ê²ƒì?. 3 ? 37, 14, 17, 40, 35 14, 17, 37, 40, 35', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 27ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 27
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 28, '?•ê·œ??Normalization)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 28ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 28
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 29, 'Preorder ê²ƒì?? A', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 29ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 29
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 30, '?˜í–‰?˜ëŠ” ?•ë„ë¥??˜í??´ëŠ” ê²ƒì??ì§ê???, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 30ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 30
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 31, 'Divide and Conquer', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 31ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 31
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 32, '?•ìƒ ê´€ë¦¬ë? ?µí•´ ?´ì „ ë¦¬ë²„?„ì´??ë²„ì „???€???•ë³´???‘ê·¼', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 32ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 32
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 33, '?œí’ˆ ?Œí”„?¸ì›¨?´ì˜ ì¢…ë¥˜???í•©???”í˜¸???Œê³ ë¦¬ì¦˜??ê³ ë ¤??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 33ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 33
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 34, '(DRM) ?ì½˜í…ì¸??”í˜¸??ë°???ê´€ë¦?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 34ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 34
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 35, 'ê²ƒì??ë²”ìœ„ë¶„í• (Range Partitioning)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 35ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 35
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 36, '?ê¹Š???°ì„  ë°©ì‹ ?ëŠ” ?ˆë¹„ ?°ì„  ë°©ì‹???‡ë‹¤. ?ìƒ??ì»´í¬?ŒíŠ¸ë¥??ŒìŠ¤???˜ê³  ?ì¦?ìœ¼ë¡??˜ìœ„ ì»´í¬???¸ë? ?ŒìŠ¤???œë‹¤. ?í•˜??ì»´í¬?ŒíŠ¸ ê°œë°œ???„ë£Œ?˜ì? ?Šì? ê²½ìš° ?¤í…(Stub) ???¬ìš©?˜ê¸°???œë‹¤. ?˜í–¥???µí•© ?ŒìŠ¤??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 36ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 36
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 37, 'ë¥??¬ìš©??ë¹„ë™ê¸??µì‹ ê¸°ìˆ ë¡??´ë¼?´ì–¸?¸ì? JavaScript , ?œë²„ ê°„ì— ?°ì´?°ë? ì£¼ê³ ë°›ëŠ” ê¸°ìˆ XML Procedure', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 37ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 37
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 38, 'ê±°ë¦¬ê°€ ë¨?ê²ƒì???„í—˜ë¶€??ê°ì†Œ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 38ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 38
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 39, ', ??¨ìœ„ ?ŒìŠ¤??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 39ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 39
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?Œí”„?¸ì›¨??ê°œë°œ', 40, '(degree) ? 2', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 40ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 40
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 41, 'R (Determinant)?€ ?´ë–¤ ?•ê·œ?•ì— ?í•˜?”ê?R ????•ê·œ??', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 41ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 41
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 42, 'ê³ ê°ID ê³ ê°?´ë¦„ ê±°ì£¼?„ì‹œ S1 ?ê¸¸???œìš¸ S2 ?´ì •???¸ì²œ S3 ? ë³´???¸ì²œ S4 ê¹€?¥êµ­ ?œìš¸ S5 ?„ìš”???©ì¸ ê°?ê°?ê°œRelation 3 , Attribute 3 , Tuple 5', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 42ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 42
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 43, 'Commit Rollback ?ë³‘í–‰??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 43ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 43
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 44, 'R1 SQL ?³ì? ê²ƒì??[R1] ?™ë²ˆ ?´ë¦„ ?™ë…„ ?™ê³¼ ì£¼ì†Œ 1000 ?ê¸¸??1 ì»´í“¨?°ê³µ???œìš¸ 2000 ê¹€ì² ìˆ˜ 1 ?„ê¸°ê³µí•™ ê²½ê¸° 3000 ê°•ë‚¨ê¸?2 ?„ê¸°ê³µí•™ ê²½ê¸° 4000 ?¤ë§??2 ì»´í“¨?°ê³µ??ê²½ê¸° 5000 ?¥ë???3 ?„ê¸°ê³µí•™ ?œìš¸ ë¬?SQL ] ?™ë…„ SELECT DISTINCT FROM R1;', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 44ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 44
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 45, 'DCL(Data Control Language) ?COMMIT', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 45ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 45
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 46, 'ë¡œí‚¹???€?ì´ ?˜ëŠ” ê°ì²´???¬ê¸°ë¥?ë¡œí‚¹ ?¨ìœ„?¼ê³  ?œë‹¤.', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 46ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 46
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 47, '(Null) ê°’ì´ ?„ë‹Œ ?ì ê°’ì„ ê°–ëŠ” ?±ì§ˆ?€?ê°œì²´ ë¬´ê²°??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 47ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 47
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 48, '(View) ?ë·??ì²´ë¡??¸ë±?¤ë? ê°€ì§?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 48ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 48
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 49, '(Transparency)ê²ƒì??Location Transparency', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 49ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 49
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 50, '?´ë– ??ë¦´ë ˆ?´ì…˜?´ë¼???°ì´?°ë² ?´ìŠ¤ ?´ì—???œí˜„ ê°€?¥í•˜ê²?, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 50ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 50
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 51, '?´ê³  ?´ë©´ ?´ë‹¤X Y Y Z X Z .??????ë¶„í•´ ê·œì¹™', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 51ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 51
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 52, 'R S Division ? D1 D2 D3 a 1 A b 1 A c 2 A d 2 B R D2 D3 1 A S', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 52ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 52
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 53, 'player player_name, team_id, height . ?„ë˜ ë¬¸ì—??ë¬¸ë²•???¤ë¥˜ê°€ ?ˆëŠ” ë¶€ë¶„ì?SQL ? (1) SELECT player_name, height (2) FROM player (3) WHERE team_id = ''korea'' (4) AND height BETWEEN 170 OR 180; (1)', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 53ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 53
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 54, '(log) ?ì¦‰ê° ê°±ì‹  ê¸°ë²•', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 54ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 54
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 55, 'DML(Data Manipulation Language) ?INSERT', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 55ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 55
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 56, '?????´ë–¤ ?•ê·œ???‘ì—…????ê²ƒì¸ê°€? êµ?? ?„ì‹œ ?€?œë?êµ??œìš¸ ë¶€?? ë¯¸êµ­ ?Œì‹±???´ìš•, ì¤‘êµ­ ë² ì´ì§???êµ?? ?„ì‹œ ?€?œë?êµ??œìš¸ ?€?œë?êµ?ë¶€??ë¯¸êµ­ ?Œì‹±??ë¯¸êµ­ ?´ìš• ì¤‘êµ­ ë² ì´ì§????•ê·œ??', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 56ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 56
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 57, 'Select', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 57ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 57
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 58, 'SQL (aggregation function) ?AVG', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 58ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 58
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 59, 'ë°œìƒ?˜ëŠ” ê³¤ë????„ìƒ???˜ë??˜ëŠ” ê²ƒì??normalization', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 59ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 59
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 60, '?œí”Œ?¤ì˜ ?½ì… ?? œ ?±ì˜ ?‘ì—…?¼ë¡œ ?¸í•´ ë¦´ë ˆ?´ì…˜?€ ?œê°„??,', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 60ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 60
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 61, '?³ê²Œ ?˜í???ê²ƒì?? int i = 7, j = 9; int k; if (i > j) k = i - j; else k = i + j; int i = 7, j = 9;', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 61ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 61
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 62, 'ë©”ëª¨ë¦¬ë? ?¤ë£¨?????¤ë¥˜ê°€ ë°œìƒ?˜ì—¬ ?˜ëª»???™ì‘???˜ëŠ” ?„ë¡œê·¸ë¨ ì·¨ì•½??ë°”ìš´??ê³µê²©FTP', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 62ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 62
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 63, 'bash ê²ƒì??if', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 63ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 63
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 64, 'IPv6 ?ë¹„íŠ¸??ì£¼ì†Œì²´ê³„ë¥??¬ìš©?œë‹¤32 .', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 64ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 64
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 65, 'ëª¨ë“ˆê°„ì˜ ê²°í•©?„ë? ?½í•˜ê²??˜ë©´ ëª¨ë“ˆ ?…ë¦½?±ì´ ?¥ìƒ?œë‹¤.', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 65ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 65
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 66, 'HRN , ??ì²˜ë¦¬?˜ëŠ” ?‘ì—… ?œì„œë¡??³ì? ê²ƒì?? ?‘ì—… ?€ê¸??œê°„ ?œë¹„???¤í–‰ ?œê°„( ) A 5 20 B 40 20 C 15 45 D 20 2 A B C D', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 66ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 66
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 67, '?¤ì¤‘ ?¬ìš©?ì? ?¤ì¤‘ ?‘ìš©?„ë¡œê·¸ë¨ ?˜ê²½ ?˜ì—???ì›???„ì¬', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 67ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 67
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 68, '?ë™?”ëŠ” ?¬ê°???¤ë¥˜ ?í™© ?¸ì—???¬ìš©?ì˜ ê°œì… ?†ì´ ?™ì‘??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 68ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 68
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 69, 'TCP ?? ë¢°?±ì´ ?ˆëŠ” ?°ê²° ì§€?¥í˜• ?„ë‹¬ ?œë¹„?¤ì´??', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 69ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 69
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 70, 'ëª¨ë“ˆ???¤ìˆ˜??ê´€??ê¸°ëŠ¥??ê°€ì§???ëª¨ë“ˆ?ˆì˜ êµ¬ì„± ?”ì†Œ ?¤ì´ ê·?ê¸°ëŠ¥???œì°¨?ìœ¼ë¡??˜í–‰??ê²½ìš°???‘ì§‘??ê¸°ëŠ¥???‘ì§‘??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 70ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 70
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 71, 'OSI-7Layer , ?¤ë¥˜ ?œì–´?€ ?ë¦„ ?œì–´ ê¸°ëŠ¥???˜í–‰?˜ëŠ” ê³„ì¸µ?€??°ì´?°ë§??ê³„ì¸µ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 71ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 71
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 72, 'Date Coupling', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 72ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 72
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 73, 'Worst fit 10K ?„ë¡œê·¸ë¨ ?¤í–‰???„í•´?œëŠ” ?´ëŠ ë¶€ë¶„ì— ? ë‹¹?˜ëŠ”ê°€? ?ì—­ ë²ˆí˜¸ ë©”ëª¨ë¦??¬ê¸° ?¬ìš© ?¬ë? NO.1 8K FREE NO.2 12K FREE NO.3 10K IN USE NO.4 20K IN USE NO.5 16K FREE NO.2', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 73ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 73
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 74, '200.1.1.0/24 FLSM 10 Subnetë¡??˜ëˆ„ê³?ë¥??ìš©?ˆë‹¤ ?´ë•Œ ?œë¸Œ?¤íŒ…???¤íŠ¸?Œí¬ , ip subnet-zero . ì¤?ë²ˆì§¸ ?¤íŠ¸?Œí¬??ì£¼ì†Œ??0 broadcast IP ?200.1.1.159', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 74ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 74
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 75, '3ì¶”ì¶œ?????©ì³??ì¶œë ¥?˜ëŠ” ?Œì´??ì½”ë“œ?´ë‹¤ ???¤ì–´ê°??´ìš©?€. ???ë¬¸ì ?´ìƒ ë¬¸ì?´ì„ ?…ë ¥?˜ì‹œ??String = input("7 :") m = ( )??print(m) string[1:3]+string[-3:]', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 75ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 75
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 76, 'ì²??ë¦¬???«ìë¥??¬ìš©?????†ë‹¤.', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 76ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 76
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 77, '?œì–´? í˜¸ë¥??´ìš©?˜ì—¬ ?µì‹ ?˜ëŠ” ê²½ìš°?´ë©° ?˜ìœ„ ëª¨ë“ˆ?ì„œ ?ìœ„ ëª¨ë“ˆ, ë¡??œì–´? í˜¸ê°€ ?´ë™?˜ì—¬ ?ìœ„ ëª¨ë“ˆ?ê²Œ ì²˜ë¦¬ ëª…ë ¹??ë¶€?¬í•˜??ê¶Œë¦¬ ?„ë„?„ìƒ??ë°œìƒ?˜ê²Œ ?˜ëŠ” ê²°í•©?„ëŠ”?Data Coupling', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 77ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 77
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 78, 'C ? main(void) { int i; int sum = 0; for(i = 1; i <= 10; i = i + 2) sum = sum + i; printf("%d", sum); } 15', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 78ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 78
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 79, 'UNIX ?ls', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 79ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 79
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 80, 'C ?int', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 80ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 80
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 81, ', ?¤ì œ ë¬¼ë¦¬?ì¸ ?ì‚° ?€???Œí”„?¸ì›¨?´ë¡œ ê°€?í™”?¨ìœ¼ë¡œì¨ ?¤ì œ ?ì‚°?????±ì— ?€???•í™•????ë³´ë? ?»ì„ ????ê³??ì‚° ìµœì ???Œë°œ?¬ê³  , , ìµœì†Œ???ì‚°??ì¦ê? ???¤ê³„ë¶€???œì¡° ?œë¹„?¤ì— ?´ë¥´??ëª¨ë“  , , ê³¼ì •???¨ìœ¨?±ì„ ?¥ìƒ?œí‚¬ ???ˆëŠ” ëª¨ë¸?€?ìµœì ??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 81ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 81
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 82, '3 ?ê¸°ë???, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 82ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 82
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 83, '?€ ???¹ì—???œê³µ?˜ëŠ” ?•ë³´ ë°??œë¹„?¤ë? ?´ìš©?˜ì—¬ ( ) / ?ˆë¡œ???Œí”„?¸ì›¨?´ë‚˜ ?œë¹„???°ì´?°ë² ?´ìŠ¤ ?±ì„ ë§Œë“œ??, ê¸°ìˆ ?´ë‹¤. Quantum Key Distribution', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 83ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 83
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 84, '(Functional Point) ?„ë‹Œ ê²ƒì???´ë˜???¸í„°?˜ì´??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 84ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 84
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 85, 'DES', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 85ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 85
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 86, 'Putnam ?SQLR/30', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 86ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 86
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 87, '1978 MIT?˜í•´ ?œì•ˆ??ê³µê°œ???”í˜¸???Œê³ ë¦¬ì¦˜?€?DES', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 87ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 87
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 88, 'COCOMO ?Organic', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 88ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 88
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 89, '?´ì¬?˜ì–´ ?ˆëŠ” ë³€???¬ì´???í˜¸ê´€ê³„ë? ê·œëª…?˜ì—¬ ?¼ì •???¨í„´??ì°¾ì•„?´ëŠ” ê¸°ë²•?€?Data Mining', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 89ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 89
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 90, ', ?¤íŠ¸?Œí¬ ?ì„±??ìµœì ?”ë˜??ì°¨ì„¸?€ ?´ë™?µì‹  ?ˆë„¤?¸ì›Œ??ê³µê³µ , , ?ˆì „ ?±ì˜ ?¹ìˆ˜ëª©ì ???¬ìš©?˜ëŠ” ?ˆë¡œ??ë°©ì‹???¤íŠ¸?Œí¬ ê¸°ìˆ ???˜ë??˜ëŠ” ê²ƒì??Software Defined Perimeter', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 90ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 90
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 91, 'DDoS ?Secure shell', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 91ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 91
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 92, 'CPM ? ??0', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 92ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 92
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 93, 'RIP(Routing Information Protocol) ?ê±°ë¦¬ ë²¡í„° ?¼ìš°???„ë¡œ? ì½œ?´ë¼ê³ ë„ ?œë‹¤.', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 93ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 93
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 94, ', ?œì°¨??ëª¨ë¸?´ë¼ê³ ë„ ?˜ë©° ?€?? ??ê²€??ê³„íš ?”êµ¬?¬í•­ ë¶„ì„, , , êµ¬í˜„ ?ŒìŠ¤??? ì?ë³´ìˆ˜???¨ê³„ë¥??µí•´ ?Œí”„?¸ì›¨?´ë? ê°œë°œ?˜ëŠ” , , ëª¨í˜•?€???¬??ëª¨í˜•', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 94ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 94
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 95, '4ë¡??˜ì—´??ê²ƒì?? ê³„íš ?˜ë¦½??ê³ ê° ?‰ê???ê°œë°œ ë°?ê²€ì¦â’¸ ?„í—˜ ë¶„ì„???œìœ¼ë¡?ë°˜ë³µ - - -', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 95ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 95
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 96, ', ( )ë§ì¶”??ë°©ë²•?¼ë¡œ ?Œí”„?¸ì›¨?´ë? ?„ì„±?œí‚¤???¬ì‚¬??ë°©ë²•?€??©ì„± ì¤‘ì‹¬', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 96ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 96
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 97, 'JAVA ì¡´ì¬?˜ëŠ”ê°€ ?????”í˜¸???¤ë? ?€?¥í•˜??ë³€?˜ì´?? ( , key .) import javax.crypto,KeyGenerator; import javax.crypto.spec.ScretKeySpec; import javax.crypto.Cipher; ?ëµ...... public String encripString(String usr) { String key = "22df3023sf~2;asn!@#/>as"; if (key != null) byte[] bToEncrypt = usr.getBytes("UTF-8"); ?ëµ...... ë¬´ê²°??ê²€???†ëŠ” ì½”ë“œ ?¤ìš´ë¡œë“œ', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 97ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 97
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 98, '?Œí”„?¸ì›¨???„ë¡œ?¸ìŠ¤ë¥??‰ê? ë°?ê°œì„ ?˜ëŠ” êµ? œ ?œì??€?SCRUM', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 98ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 98
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 99, ', SW?¬ë?ë¥????µí•©???Œí”„?¸SDLC(Software Development Life Cycle)?¨ì–´ ê°œë°œ ë³´ì•ˆ ?ëª…ì£¼ê¸° ë°©ë²•ë¡ ì??CLASP', '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 99ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 99
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 3, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 100, 'LAN ? ë²„ìŠ¤??, '2020??3???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 100ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 3
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 100
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¶„ì„ê³?ì¤‘ì¬ê¸°ìˆ ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤ê³„ ë°?ì½”ë”© ê¸°ìˆ ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê´€ì°?ë°?ëª¨ë¸ ?‘ì„± ê¸°ìˆ ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?´ìš©???¤ëª…?˜ëŠ” ?”ì???¨í„´?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¨í„´Observer', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¨í„´Factory Method', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¨í„´Bridge', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¼ë°”??ê°ì²´ ì§€??ë¶„ì„ê³?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?™ì  ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°ì²´ ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?•ì  ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '? ì??ê¸°ë²•???€???¤ëª…?¼ë¡œ ë§ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê³„íš??ì¤‘ì ???ì–´ ë³€ê²??€?‘ì´ ?œí•´?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?Œí”„?¸ì›¨?´ê? ???¤í–‰?˜ëŠ”??ê°€ì¹˜ë? ?”ë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê³ ê°ê³¼ì˜ ?¼ë“œë°±ì„ ì¤‘ìš”?˜ê²Œ ?ê°?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¯¸ë“¤?¨ì–´ ?”ë£¨?˜ì˜ ? í˜•???¬í•¨?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Web Server', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'RPC', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ORB', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?œí€€???¤ì´?´ê·¸?¨ì˜ êµ¬ì„± ??ª©???´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¤í–‰', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?•ì¥', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë©”ì‹œì§€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€?¥ì—???•ë³´ ?€?‰ê³¼ ê°€??ë°€?‘í•œ ê´€ê³„ê? ?ˆëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Class', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Method', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Instance', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì???¨í„´ ì¤‘ì—???‰ìœ„???¨í„´???í•˜ì§€ ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?µì?ë²??¨í„´(Obseerver)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?„ë¡œ? í????¨í„´(Prototype)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?íƒœ ?¨í„´(State)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ê³„ ?ì¹™ ì¤??„êµ¬???½ê²Œ ?´í•´?˜ê³  ?¬ìš©?????ˆì–´???œë‹¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '? ì—°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì§ê???, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë©€?°ìš´?©ì„±', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì½”ë“œ??ê¸°ë³¸ ê¸°ëŠ¥?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œì???, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¶„ë¥˜', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ë³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?ˆì— ?¤ì–´ê°??´ìš©?¼ë¡œ ?³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?„ë¡œ? ì½œ(Protocol)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¨í„´(Pattern)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê´€ê³?Relation)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?œìš©?˜ëŠ” ?¤ì´?´ê·¸??ì¤??œìŠ¤?œì˜ ?™ì‘???œí˜„?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œí€€???¤ì´?´ê·¸??Sequence Diagram)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œë™ ?¤ì´?´ê·¸??Activity Diagram)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë°°ì¹˜ ?¤ì´?´ê·¸??Deployment Diagram)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ ì§€???Œí”„?¸ì›¨??ê³µí•™?ì„œ ?˜ë‚˜ ?´ìƒ??? ì‚¬??ê°ì²´?¤ì„', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´ë˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œí€€??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œë¸Œë£¨í‹´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„ë˜??ëª¨ë¸?ì„œ ì°??´ë˜?¤ì? ê°??´ë˜?¤ì˜ ê´€ê³„ë¡œ ?³ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?˜ì¡´ ê´€ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¼ë°˜??ê´€ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê·¸ë£¹ ê´€ê³?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€???Œí”„?¸ì›¨???¤ê³„ ???”ì???¨í„´??êµ¬ì„±?˜ëŠ” ?”ì†Œë¡œì„œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¬¸ì œ ë°?ë°°ê²½', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ë?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?˜í”Œì½”ë“œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë£Œ ?¬ì „?ì„œ ?ë£Œ??ë°˜ë³µ???˜ë??˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '( )', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '{ }', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '[ ]', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€???¤ê³„ ?ì¹™ ì¤??œë¸Œ?€?…ìƒ?ë°›?€ ?˜ìœ„ ?´ë˜?¤ì? ?´ë””?ì„œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'DIP(Dependency Inversion Principle)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'LSP(Liskov Substitution Principle)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SRP(Single Responsibility Principle)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë£Œ?ë¦„????êµ¬ì„±?”ì†Œë¡??³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'process, data flow, data store, terminator', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'data flow, data store, terminator, data dictionary', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'process, data store, terminator, mini-spec', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„êµ¬???€???¤ëª…', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?„êµ¬?´ë‹¤.?œì??”ëœ ê°œë°œ ?˜ê²½ êµ¬ì¶• ë°?ë¬¸ì„œ ?ë™??ê¸°ëŠ¥???œê³µ?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?‘ì—… ê³¼ì • ë°??°ì´??ê³µìœ ë¥??µí•´ ?‘ì—…?ê°„ ì»¤ë??ˆì??´ì…˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¦ë??œë‹¤.?„ë? ?´í›„ ?Œê°œ?˜ì—ˆ?¼ë©° ê°ì²´ì§€???œìŠ¤?œì— ?œí•´ ?¨ê³¼2000 ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ìœ¼ë¡??œìš©?œë‹¤.?¸í„°?˜ì´???”êµ¬ ?¬í•­ ê²€??ë°©ë²•???€???¤ëª…???³ì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¥??ì„¸??ì¡°ì‚¬?˜ì—¬ ê²°í•¨ ?œì? ?„ë°° ë¬¸ì œ???±ì„ ?Œì•…, , ?™ë£Œê²€???”êµ¬ ?¬í•­ ëª…ì„¸???‘ì„±?ê? ?”êµ¬ ?¬í•­ ëª…ì„¸?œë? :', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤ëª…?˜ê³  ?´í•´ê´€ê³„ì?¤ì´ ?¤ëª…???¤ìœ¼ë©´ì„œ ê²°í•¨??ë°œê²¬?¸ìŠ¤?™ì…˜ ?ë™?”ëœ ?”êµ¬ ?¬í•­ ê´€ë¦??„êµ¬ë¥??´ìš©?˜ì—¬ ?”êµ¬ :', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¬í•­ ì¶”ì ?±ê³¼ ?¼ê??±ì„ ê²€? ë„êµ?ê²€???ë£Œë¥??Œì˜ ?„ì— ë°°í¬?´ì„œ ?¬ì „ ê²€? í•œ CASE :', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ì§§ì? ?œê°„ ?™ì•ˆ ê²€???Œì˜ë¥?ì§„í–‰?˜ë©´??ê²°í•¨??ë°œê²¬ ?¸í„°?˜ì´??ë³´ì•ˆ???„í•´ ?¤íŠ¸?Œí¬ ?ì—­???ìš©?????ˆëŠ” ?”ë£¨?˜ê³¼', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SSL', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SMTP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'S-HTTP', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê³µí•™??ê¸°ë³¸ ?ì¹™?´ë¼ê³?ë³????†ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì§€?ì ??ê²€ì¦??œí–‰', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê²°ê³¼???€??ëª…í™•??ê¸°ë¡ ? ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ìµœë???ë§ì? ?¸ë ¥ ?¬ì…', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¨í‚¤ì§€ ?Œí”„?¸ì›¨?´ì˜ ?¼ë°˜?ì¸ ?œí’ˆ ?ˆì§ˆ ?”êµ¬?¬í•­ ë°??ŒìŠ¤?¸ë?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'IEEE 19554', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ISO/IEC 12119', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ISO/IEC 14959', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì¤??´ë¦° ì½”ë“œ ?‘ì„±?ì¹™?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì¤‘ë³µ??ìµœë??”ëœ ì½”ë“œ ?‘ì„±', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤ë¥¸ ëª¨ë“ˆ??ë¯¸ì¹˜???í–¥ ìµœì†Œ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¨ìˆœ ëª…ë£Œ??ì½”ë“œ ?‘ì„±,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¸”ë™ë°•ìŠ¤ ?ŒìŠ¤?¸ì˜ ? í˜•?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¤ë¥˜ ?ˆì¸¡', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?™ë“± ë¶„í•  ê¸°ë²•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¡°ê±´ ë£¨í”„ ê²€??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œì–´?ë¦„ ê·¸ë˜?„ê? ?¤ìŒê³?ê°™ì„ ?????˜ëŠ”', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '5', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '6', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?ë£Œ???€?˜ì—¬ ? íƒ ?•ë ¬???´ìš©?˜ì—¬ ?¤ë¦„ì°¨ìˆœ?¼ë¡œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '14, 37, 17, 40, 35', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '17, 14, 37, 35, 40', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '14, 17, 35, 40, 37', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ìƒ ê´€ë¦??„êµ¬??ì£¼ìš” ê¸°ëŠ¥?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì²´í¬??Check-in)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì²´í¬?„ì›ƒ(Check-out)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì»¤ë°‹(commit)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¸ë¦¬ë¥??´í–‰ë²•ìœ¼ë¡??´í–‰??ê²½ìš° ê°€??ë¨¼ì? ?ìƒ‰?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'B', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'D', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'G', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???ˆì§ˆ ëª©í‘œ ì¤?ì£¼ì–´ì§??œê°„?™ì•ˆ ì£¼ì–´ì§?ê¸°ëŠ¥???¤ë¥˜?†ì´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¬ìš© ?©ì´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '? ë¢°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ì‹??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œê³ ë¦¬ì¦˜ ?¤ê³„ ê¸°ë²•?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Greedy', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Static Block', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Backtracking', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œí’ˆ ?Œí”„?¸ì›¨?´ì˜ ?•ìƒ ê´€ë¦???• ë¡??€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°€?¥í•˜??ë°°í¬ë³?ê´€ë¦¬ì— ? ìš©ë¶ˆí•„?”í•œ ?¬ìš©?ì˜ ?ŒìŠ¤ ?˜ì • ?œí•œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?„ë¡œ?íŠ¸ ê°œë°œë¹„ìš©???¨ìœ¨?ìœ¼ë¡?ê´€ë¦?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?™ì¼???„ë¡œ?íŠ¸???€???¬ëŸ¬ ê°œë°œ???™ì‹œ ê°œë°œ ê°€??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œí’ˆ ?Œí”„?¸ì›¨???¨í‚¤ì§??„êµ¬ ?œìš© ??ê³ ë ¤?¬í•­???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??ì¶”ê?ë¡??¤ì–‘???´ê¸°ì¢??°ë™??ê³ ë ¤?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìš©???¸ì˜?±ì„ ?„í•œ ë³µì¡??ë°?ë¹„íš¨?¨ì„± ë¬¸ì œë¥?ê³ ë ¤?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ë? ì½˜í…ì¸ ì— ?€??ë³´ì•ˆ?€ ê³ ë ¤?˜ì? ?ŠëŠ”??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì????€?‘ê¶Œ ê´€ë¦?ê¸°ìˆ ê³?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì½˜í…ì¸??ë³„ì²´ê³„ ?œí˜„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì½˜í…ì¸??¤ë¥˜ ê°ì? ë°?ë³µêµ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¼ì´?¼ìŠ¤ ë°œê¸‰ ë°?ê´€ë¦?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¬¼ë¦¬?°ì´???€?¥ì†Œ???Œí‹°???¤ê³„?ì„œ ?Œí‹°??? í˜•?¼ë¡œ ?³ì? ?Šì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´ì‹œë¶„í• (Hash Partitioning)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì¡°í•©ë¶„í• (Composite Partitioning)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '? ë‹›ë¶„í• (Unit Partitioning)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???¤ëª…?˜ëŠ” ? í”Œë¦¬ì??´ì…˜ ?µí•© ?ŒìŠ¤??? í˜•?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?í–¥???µí•© ?ŒìŠ¤??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?Œê? ?ŒìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¹…ë±… ?ŒìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸í„°?˜ì´??êµ¬í˜„ ???¬ìš©?˜ëŠ” ê¸°ìˆ  ì¤??¤ìŒ ?´ìš©???¤ëª…?˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Trigger', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Greedy', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'AJAX', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???¬ê³µ?™ì´ ?Œí”„?¸ì›¨?´ì˜ ?¬ê°œë°œì— ë¹„í•´ ê°–ëŠ” ?¥ì ?¼ë¡œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¹„ìš© ?ˆê°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œìŠ¤??ëª…ì„¸???¤ë¥˜?µì œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œë°œ?œê°„??ì¦ê?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ŒíŒŒ ë² í? ?ŒìŠ¤?¸ì? ê°€??ë°€?‘í•œ ?°ê????ˆëŠ” ?ŒìŠ¤???¨ê³„??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¸ìˆ˜ ?ŒìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?µí•© ?ŒìŠ¤??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œìŠ¤???ŒìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¸ë¦¬??ì°¨ìˆ˜ ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '4', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '5', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¦´ë ˆ?´ì…˜ ??ëª¨ë“  ê²°ì •??ê°€ ?„ë³´?¤ì´ë©?ê·?ë¦´ë ˆ?´ì…˜', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???•ê·œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë³´ì´??ì½”ë“œ ?•ê·œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???•ê·œ??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ê´€ê³„í˜• ?°ì´??ëª¨ë¸???€???¤ëª…?¼ë¡œ ?³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°?ê°?ê°œRelation 3 , Attribute 5 , Tuple 3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°?ê°?ê°œRelation 1 , Attribute 5 , Tuple 3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°?ê°?ê°œRelation 1 , Attribute 3 , Tuple 5', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³?ëª…ë ¹?´ì— ?˜í•´ ë³´ì¥ ë°›ëŠ” ?¸ëœ??…˜???¹ì„±?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë³´ì•ˆ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ì??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¡œê·¸', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê´€ê³??°ì´?°ë² ?´ìŠ¤???Œì´ë¸????€???„ë˜ ë¬¸ì˜ ?¤í–‰ê²°ê³¼ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?™ë…„ 1 1 2 2 3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?™ë…„ 1 2 3', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ë¦„ ?™ë…„ ?ê¸¸??1 ê¹€ì² ìˆ˜ 1 ê°•ë‚¨ê¸?2 ?¤ë§??2 ?¥ë???3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ë¦„ ?™ë…„ ?ê¸¸??1 ê°•ë‚¨ê¸?2 ?¥ë???3 ëª…ë ¹?´ê? ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ROLLBACK', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'GRANT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SELECT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë³‘í–‰?œì–´ ê¸°ë²• ì¤?ë¡œí‚¹???€???¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?°ì´?°ë² ?´ìŠ¤ ?Œì¼ ?ˆì½”???±ì? ë¡œí‚¹ ?¨ìœ„ê°€ ?????ˆë‹¤, , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¡œí‚¹???¨ìœ„ê°€ ?‘ì•„ì§€ë©?ë¡œí‚¹ ?¤ë²„?¤ë“œê°€ ì¦ê??œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¡œí‚¹???¨ìœ„ê°€ ì»¤ì?ë©??°ì´?°ë² ?´ìŠ¤ ê³µìœ ?„ê? ì¦ê??œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê´€ê³??°ì´??ëª¨ë¸??ë¬´ê²°???œì•½ ì¤?ê¸°ë³¸??ê°’ì˜ ?ì„± ê°’ì´ ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì°¸ì¡° ë¬´ê²°??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?„ë©”??ë¬´ê²°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œí”Œ??? ì¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë·????¥ì ???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?°ì´??ë³´ì•ˆ ?©ì´', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¼ë¦¬???…ë¦½???œê³µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¬ìš©???°ì´??ê´€ë¦??©ì´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¶„ì‚° ?°ì´?°ë² ?´ìŠ¤???¬ëª…?????´ë‹¹ ?˜ì? ?ŠëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Replication Transparency', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Failure Transparency', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Media Access Transparency', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ê·œ?”ì˜ ëª©ì ?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë§Œë“ ???°ì´???½ì… ??ë¦´ë ˆ?´ì…˜???¬êµ¬?±í•  ?„ìš”?±ì„ ì¤„ì¸??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì¤‘ë³µ??ë°°ì œ?˜ì—¬ ?½ì… ?? œ ê°±ì‹  ?´ìƒ??ë°œìƒ???¼ê¸°?œë‹¤, , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¨ê³¼?ì¸ ê²€???Œê³ ë¦¬ì¦˜???ì„±?????ˆë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???´ë‹¹?˜ëŠ” ?¨ìˆ˜ ì¢…ì†??ì¶”ë¡  ê·œì¹™?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´í–‰ ê·œì¹™', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë°˜ì‚¬ ê·œì¹™', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê²°í•© ê·œì¹™', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ê³???ë¦´ë ˆ?´ì…˜???€???°ì‚°???˜í–‰ ê²°ê³¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'D3 A B', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'D2 2 2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'D3 A', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'D1 a b ?Œì´ë¸”ì—??ì»¬ëŸ¼??ì¡´ì¬?œë‹¤', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '(2)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '(3)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '(4)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´?°ë² ?´ìŠ¤ ë¡œê·¸ ë¥??„ìš”ë¡??˜ëŠ” ?Œë³µ ê¸°ë²•?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?€?˜ì  ì½”ë”© ë°©ë²•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?€???¤íƒ¬??ê¸°ë²•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ë”© ê¸°ë²•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª…ë ¹?´ê? ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'UPDATE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ALTER', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'DELETE', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒê³?ê°™ì´ ?„ìª½ ë¦´ë ˆ?´ì…˜???„ë˜ìª?ë¦´ë ˆ?´ì…˜?¼ë¡œ ?•ê·œ?”ë? ?˜ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???•ê·œ??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???•ê·œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???•ê·œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê´€ê³„ë??˜ì˜ ?œìˆ˜ê´€ê³??°ì‚°?ê? ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Cartesian Product', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Division', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Project', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì¤???ì§‘ê³„ ?¨ìˆ˜ ê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'COUNT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SUM', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'CREATE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¦´ë ˆ?´ì…˜ ì¡°ì‘ ???°ì´?°ë“¤??ë¶ˆí•„?”í•˜ê²?ì¤‘ë³µ?˜ì–´ ?ˆê¸°ì¹??Šê²Œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'rollback', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'cardinality', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'anomaly', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¦´ë ˆ?´ì…˜???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?°ë¼ ë³€?œë‹¤.??ë¦´ë ˆ?´ì…˜???¬í•¨???œí”Œ?¤ì? ëª¨ë‘ ?ì´?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '? íŠ¸ë¦¬ë·°?¸ëŠ” ?¼ë¦¬?ìœ¼ë¡?ìª¼ê°¤ ???†ëŠ” ?ìê°’ìœ¼ë¡??€?¥í•œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ë¦´ë ˆ?´ì…˜???¬í•¨???œí”Œ ?¬ì´?ëŠ” ?œì„œê°€ ?ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?ë°” ?„ë¡œê·¸ë¨ ì¡°ê±´ë¬¸ì— ?€???¼í•­ ì¡°ê±´ ?°ì‚°?ë? ?¬ìš©?˜ì—¬', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'int k; k = (i j) ? (i j) : (i + j);ï¼???int i = 7, j = 9;', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'int k; k = (i j) ? (i j) : (i + j);ï¼???int i = 7, j = 9;', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'int k; k = (i j) ? (i + j) : (i - j);ï¼int i = 7, j = 9;', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'int k; k = (i j) ? (i + j) : (i - j);ï¼œë‹¤???´ìš©???¤ëª…?˜ëŠ” ?Œí”„?¸ì›¨??ì·¨ì•½?ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?½ì…SQL', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë²„í¼ ?¤ë²„?Œë¡œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?”ë ‰? ë¦¬ ?‘ê·¼ ê³µê²©', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì¤????¤í¬ë¦½íŠ¸?ì„œ ?¬ìš©?????ˆëŠ” ?œì–´ë¬¸ì´ ?„ë‹Œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'for', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'repeat_do', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'while', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë©€?°ë??”ì–´???¤ì‹œê°?ì²˜ë¦¬ê°€ ê°€?¥í•˜??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë³´ë‹¤ ë³´ì•ˆ?±ì´ ê°•í™”?˜ì—ˆ?¤IPv4 .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ë™?¼ë¡œ ?¤íŠ¸?Œí¬ ?˜ê²½êµ¬ì„±??ê°€?¥í•˜??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¨ê³¼?ì¸ ëª¨ë“ˆ ?¤ê³„ë¥??„í•œ ? ì˜?¬í•­?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë³µì¡?„ì? ì¤‘ë³µ?±ì„ ì¤„ì´ê³??¼ê??±ì„ ? ì??œí‚¨??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ëª¨ë“ˆ??ê¸°ëŠ¥?€ ?ˆì¸¡??ê°€?¥í•´???˜ë©° ì§€?˜ì¹˜ê²??œí•œ???´ì–´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œë‹¤.? ì?ë³´ìˆ˜ê°€ ?©ì´?´ì•¼ ?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë°©ì‹?¼ë¡œ ?¤ì?ì¤„ë§ ??ê²½ìš° ?…ë ¥???‘ì—…???¤ìŒê³?ê°™ì„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??????A C B D', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??????D B C A', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??????D A B C', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???????´ì˜ì²´ì œ???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?íƒœë¥??Œì•…?˜ê³  ?ì› ë¶„ë°°ë¥??„í•œ ?¤ì?ì¤„ë§???´ë‹¹?œë‹¤.ë©”ëª¨ë¦?ê³µê°„ ê¸°ì–µ ?¥ì¹˜ ?…ì¶œ???¥ì¹˜ ?±ì˜ ?ì›??ê´€ë¦¬CPU, , ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œë‹¤.?´ì˜ì²´ì œ??ì¢…ë¥˜ë¡œëŠ” ë§¤í¬ë¡??„ë¡œ?¸ì„œ ?´ì…ˆë¸”ëŸ¬ ì»´íŒŒ?¼ëŸ¬ , ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?±ì´ ?ˆë‹¤.?…ì¶œ?¥ì¥ì¹˜ì? ?¬ìš©???„ë¡œê·¸ë¨???œì–´?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë°°ì¹˜ ?„ë¡œê·¸ë¨???„ìˆ˜ ?”ì†Œ???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???œë‹¤.?ˆì •?±ì? ?´ë–¤ ë¬¸ì œê°€ ?ê²¼?”ì? ?¸ì œ ë°œìƒ?ˆëŠ”ì§€ ?±ì„ ì¶”ì ??,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???ˆì–´???œë‹¤.?€?©ëŸ‰ ?°ì´?°ëŠ” ?€?©ëŸ‰???°ì´?°ë? ì²˜ë¦¬?????ˆì–´???œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¬´ê²°?±ì? ì£¼ì–´ì§??œê°„ ?´ì— ì²˜ë¦¬ë¥??„ë£Œ?????ˆì–´???˜ê³ ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?™ì‹œ???™ì‘?˜ê³  ?ˆëŠ” ?¤ë¥¸ ? í”Œë¦¬ì??´ì…˜??ë°©í•´?˜ì? ë§ì•„???œë‹¤.?„ë¡œ? ì½œ???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ë³¸ ?¤ë” ?¬ê¸°???´ê³  ê¹Œì? ?•ì¥ ê°€?¥í•˜??00byte 160byte .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤í¬ë¦??„ì†¡ ê¸°ëŠ¥???œê³µ?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œì„œ ?œì–´ ?¤ë¥˜ ?œì–´ ?ë¦„ ?œì–´ ê¸°ëŠ¥???œê³µ?œë‹¤, , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???¤ëª…?˜ëŠ” ?‘ì§‘?„ì˜ ? í˜•?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?°ì—°???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¼ë¦¬???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ˆì°¨???‘ì§‘??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ë§í¬???¤ì •ê³?? ì? ë°?ì¢…ë£Œë¥??´ë‹¹?˜ë©° ?¸ë“œê°„ì˜', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¬¼ë¦¬ ê³„ì¸µ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¸ì…˜ ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?‘ìš© ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì¤?ê°€??ê²°í•©?„ê? ê°•í•œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Stamp Coupling', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Common Coupling', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Control Coupling', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë©”ëª¨ë¦?ê´€ë¦?ê¸°ë²• ì¤?ë°©ë²•???¬ìš©??ê²½ìš° ?¬ê¸°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'NO.3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'NO.4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'NO.5', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤íŠ¸?Œí¬ë¥?ë°©ì‹???´ìš©?˜ì—¬ ê°œì˜ ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '201.1.5.175', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '202.1.11.254', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '203.1.255.245', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ?€ ?¬ìš©?ë¡œë¶€???…ë ¥ë°›ì? ë¬¸ì?´ì—??ì²˜ìŒê³??ì˜ ê¸€?ë?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'string[:3]+string[-3:-1]', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'string[0:3]+string[-3:]', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'string[0:]+string[:-1]', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œì´?¬ì˜ ë³€???‘ì„± ê·œì¹™ ?¤ëª…?¼ë¡œ ?³ì? ?Šì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ë¬¸ ?€ë¬¸ì ?Œë¬¸???«ì ë°‘ì¤„ ???¬ìš©??ê°€?¥í•˜?? , , (_) .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë³€???´ë¦„??ì¤‘ê°„??ê³µë°±???¬ìš©?????ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?´ë? ?¬ìš©?˜ê³  ?ˆëŠ” ?ˆì•½?´ëŠ” ?¬ìš©?????†ë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ë–¤ ëª¨ë“ˆ???¤ë¥¸ ëª¨ë“ˆ???´ë? ?¼ë¦¬ ì¡°ì§???œì–´?˜ê¸° ?„í•œ ëª©ì ?¼ë¡œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Stamp Coupling', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Control Coupling', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Common Coupling', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?„ë¡œê·¸ë¨??ê²°ê³¼ ê°’ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '19', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '25', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '27', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?ˆë¡œ???„ë¡œ?¸ìŠ¤ë¥??ì„±?˜ëŠ” ëª…ë ¹?´ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'cat', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'fork', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'chmod', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ì–´?ì„œ ?•ìˆ˜ ?ë£Œ?•ìœ¼ë¡??³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'float', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'char', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'double', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¬¼ë¦¬?ì¸ ?¬ë¬¼ê³?ì»´í“¨?°ì— ?™ì¼?˜ê²Œ ?œí˜„?˜ëŠ” ê°€?ì˜ ëª¨ë¸ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¤í–‰ ?œê°„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?”ì????¸ìœˆ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'N-Screen', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ë³´ ë³´ì•ˆ???€ ?”ì†Œ???´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?˜ë°œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¬´ê²°??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°€?©ì„±', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ë¹ˆì¹¸???¤ì–´ê°??Œë§?€ ê¸°ìˆ ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Digital Rights Management', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Grayware', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Mashup', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê¸°ëŠ¥ ?ìˆ˜ ëª¨í˜•?ì„œ ë¹„ìš©?°ì •???´ìš©?˜ëŠ” ?”ì†Œê°€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ëª…ë ¹???¬ìš©??ì§ˆì˜?? )', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?°ì´???Œì¼', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¶œë ¥ ë³´ê³ ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¸”ë¡ ?”í˜¸??ë°©ì‹???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'RC4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'AES', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SEED', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨í˜•??ê¸°ì´ˆë¡??´ì„œ ë§Œë“  ?ë™??ì¶”ì • ?„êµ¬??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SLIM', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'MESH', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'NFV', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???«ìë¥??Œì¸??ë¶„í•´?˜ê¸° ?´ë µ?¤ëŠ” ê²ƒì— ê¸°ë°˜?˜ì— ????, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ARIA', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SEED', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'RSA', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨ë¸???„ë¡œ?íŠ¸ ? í˜•?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Semi-detached', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Embedded', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Sequential', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¹…ë°?´í„° ë¶„ì„ ê¸°ìˆ  ì¤??€?‰ì˜ ?°ì´?°ë? ë¶„ì„?˜ì—¬ ?°ì´???ì—', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Wm-Bus', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Digital Twin', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Zigbee', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê¸°ì¡´ ë¬´ì„  ?œì˜ ?œê³„ ê·¹ë³µ???„í•´ ?±ì¥?˜ì??¼ë©° ?€ê·œëª¨ ?”ë°”?´ìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Virtual Private Network', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Local Area Network', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Mesh Network', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³µê²©ê³??°ê????ˆëŠ” ê³µê²© ë°©ë²•?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Tribe Flood Network', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Nimda', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Deadlock', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤íŠ¸?Œí¬ê°€ ?¤ìŒê³?ê°™ì„ ???„ê³„ê²½ë¡œ???Œìš”ê¸°ì¼?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??6', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?Œê·œëª??¤íŠ¸?Œí¬ ?˜ê²½???í•©?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ìµœë? ??ì¹´ìš´?¸ë? ???´í•˜ë¡??œì •?˜ê³  ?ˆë‹¤115 .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ìµœë‹¨ê²½ë¡œ?ìƒ‰?ëŠ” ?Œê³ ë¦¬ì¦˜???¬ìš©?œë‹¤Bellman-Ford .', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???ëª…ì£¼ê¸° ëª¨í˜• ì¤?ê³ ì „???ëª…ì£¼ê¸° ëª¨í˜•?¼ë¡œ ? í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '? ì??ëª¨í˜•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì»´í¬?ŒíŠ¸ ê¸°ë°˜ ë°©ë²•ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª¨í˜•6GT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ëª¨ë¸ ì¤??˜ì„ ??ëª¨ë¸??ê°€ì§€ ì£¼ìš” ?œë™???œì„œ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???????¸ìˆœ?¼ë¡œ ë°˜ë³µ- - -', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???????·ìˆœ?¼ë¡œ ë°˜ë³µ - - -', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???????¹ìˆœ?¼ë¡œ ë°˜ë³µ- - -', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???????¹ì „??ì¹©ê³¼ ê°™ì? ?Œí”„?¸ì›¨??ë¶€??ì¦?ë¸”ë¡ ëª¨ë“ˆ ??ë§Œë“¤?´ì„œ ?¼ì›Œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ì„± ì¤‘ì‹¬', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¶„ë¦¬ ì¤‘ì‹¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'êµ¬ì¡° ì¤‘ì‹¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì½”ë“œ?ì„œ ë°‘ì¤„ë¡??œì‹œ??ë¶€ë¶„ì—???´ë–¤ ë³´ì•ˆ ?½ì ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì¤‘ìš” ?ì›???€???˜ëª»??ê¶Œí•œ ?¤ì •', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?˜ë“œì½”ë“œ???”í˜¸?????¬ìš©', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ì ˆ???¸ì¦?†ëŠ” ì¤‘ìš” ê¸°ëŠ¥ ?ˆìš©', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ?œì? ì¤??Œí”„?¸ì›¨???ˆì§ˆ ë°??ì‚°???¥ìƒ???„í•´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ISO/IEC 12509', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SPICE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'CASE', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ë¬´?ìœ¼ë¡?ê²€ì¦ëœ ê°œë°œë³´ì•ˆ ë°©ë²•ë¡?ì¤??˜ë‚˜ë¡?ë³´ì•ˆ??ëª¨ë²”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'CWE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'PIMS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Seven Touchpoints', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ???¤íŠ¸?Œí¬ ? í´ë¡œì???, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?±í˜•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë§í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê·¸ë¬¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 3
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );


-- Auto-generated from 2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸°
-- year=2020, round=4
-- exam_slug=jeongchogi
insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 1, 'XP(eXtreme Programming) ?Linear Sequential Method', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 1ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 1
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 2, '(Rumbaugh) ???¤ì´?´ê·¸?¨ì??ê°ì²´ ?¤ì´?´ê·¸??Object Diagram)', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 2ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 2
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 3, 'CASE(Computer Aided Software Engineering)?³ì? ?Šì? ê²ƒì???¼ì´???¬ì´?????¨ê³„???°ê²°S/W', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 3ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 3
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 4, '(Encapsulation)ê²ƒì???¸í„°?˜ì´?¤ê? ?¨ìˆœ???œë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 4ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 4
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 5, '?´ë¼?´ì–¸?¸ëŠ” ?ì‹ ???¬ìš©?˜ì? ?ŠëŠ” ë©”ì„œ?œì? ?˜ì¡´ê´€ê³? ë¥?ë§ºìœ¼ë©????œë‹¤. ?´ë¼?´ì–¸?¸ê? ?¬ìš©?˜ì? ?ŠëŠ” ?¸í„°?˜ì´???Œë¬¸???í–¥??- ë°›ì•„?œëŠ” ???œë‹¤. ?¸í„°?˜ì´??ë¶„ë¦¬ ?ì¹™', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 5ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 5
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 6, 'ê²ƒì???¸ë“œ?€ ê°„ì„ ?¼ë¡œ êµ¬ì„±?œë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 6ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 6
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 7, ', , ë§Œë“  ì½”ë“œ???œì°¨ ì½”ë“œ', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 7ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 7
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 8, '??¨ì ???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì???Œí”„?¸ì›¨??êµ¬ì¡° ?Œì•…???©ì´?˜ë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 8ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 8
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 9, 'DFD(data flow diagram) ??ë£Œ ?ë¦„ ê·¸ë˜???ëŠ” ë²„ë¸” ì°¨íŠ¸?¼ê³ ???œë‹¤(bubble) .', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 9ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 9
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 10, '?¼ë°”??ë¶„ì„ ê¸°ë²•???¬í•¨?˜ì? ?ŠëŠ” ê²ƒì??ê°ì²´ ëª¨ë¸ë§?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 10ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 10
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 11, 'UML ?Things', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 11ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 11
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 12, '?„í‚¤?ì²˜ ?¤ê³„', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 12ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 12
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 13, '(Data Dictionary)ê²ƒì??[ ]', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 13ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 13
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 14, '(User Interface ??ê°€?¸ì•¼ ??ê¸°ëŠ¥???„ë‹Œ ê²ƒì?Development System) ??¬ìš©???…ë ¥??ê²€ì¦?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 14ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 14
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 15, 'ë¹„ì •??ëª…ì„¸ ê¸°ë²•?€ ?¬ìš©?ì˜ ?”êµ¬ë¥??œí˜„?????ì—°?´ë? ê¸°ë°˜', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 15ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 15
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 16, 'ë¨?ê²ƒì??ë¶„ì„ ê²°ê³¼??ë¬¸ì„œ?”ë? ?µí•´ ?¥í›„ ? ì?ë³´ìˆ˜??? ìš©?˜ê²Œ ?œìš©', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 16ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 16
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 17, 'ê¸°ëŠ¥ì¤‘ì‹¬ ê°œë°œ', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 17ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 17
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 18, 'ë¬´ì—‡?´ë¼ê³??˜ëŠ”ê°€??¨ì–´?¬ë¸”', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 18ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 18
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 19, 'GoF(Gangs of Four) ??ì„± ?¨í„´', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 19ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 19
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨???¤ê³„', 20, '?ë‹¹??ëª¨ë“ˆ???¬ê¸°ë¥?? ì??œë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 20ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
      and q.number = 20
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 21, 'ë°˜ë“œ???´ë? ì½˜í…ì¸ ì— ?€???”í˜¸??ë°?ë³´ì•ˆ??ê³ ë ¤?œë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 21ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 21
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 22, 'EAI(Enterprise Application Integration) Hybrid?¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì???€ ???¼í•©ë°©ì‹?´ë‹¤Hub & Spoke Message Bus .', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 22ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 22
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 23, 'pmd', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 23ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 23
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 24, 'Postfix ? 3 4 * 5 6 * ï¼?35', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 24ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 24
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 25, 'ê±°ë¦¬ê°€ ë¨?ê²ƒì??IPSec', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 25ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 25
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 26, '(Validation) ?ì—???‰í•´ì§€ë©??¤ë¥˜?€ ?¬ìš©?ì˜ ë¬¸ì œ?ì„ ?¬ìš©?ì? ê°œë°œ?ê? , ?¨ê»˜ ?•ì¸?˜ë©´??ê²€?¬í•˜??ê¸°ë²•?€??”ë²„ê¹?ê²€??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 26ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 26
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 27, '(Insertion Sort)?¤ë¦„ì°¨ìˆœ ?•ë ¬??ê²½ìš° ?Œì „ ?„ì˜ ê²°ê³¼?? ? ì´ˆê¸° ?ë£Œ : 8, 3, 4, 9, 7 3, 4, 8, 7, 9', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 27ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 27
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 28, '?¤ì¹˜ê³¼ì •?ì„œ ?œì‹œ?????ˆëŠ” ?ˆì™¸?í™©??ê´€???´ìš©??ë³„ë„ë¡?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 28ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 28
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 29, 'ESB', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 29ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 29
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 30, '?„ë¡œ?íŠ¸ ?”êµ¬ ë¶„ì„??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 30ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 30
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 31, 'ë¬¼ë¦¬???€???¥ì¹˜???…ì¥?ì„œ ë³??°ì´?°ë² ?´ìŠ¤ êµ¬ì¡°ë¡œì„œ ?¤ì œë¡??°ì´?°ë² ?´ìŠ¤???€?¥ë  ?ˆì½”?œì˜ ?•ì‹???•ì˜?˜ê³  ?€???°ì´????ª©???œí˜„ ë°©ë²• ?´ë? ?ˆì½”?œì˜ ë¬¼ë¦¬???? ???±ì„ ?˜í??¸ë‹¤. ?¸ë? ?¤í‚¤ë§?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 31ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 31
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 32, 'INORDER ? D B A E C F', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 32ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 32
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 33, 'n ?n 1', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 33ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 33
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 34, '?ŒìŠ¤?¸ì˜ ê²°ê³¼ê°€ ì°¸ì¸ì§€ ê±°ì§“?¸ì?ë¥??ë‹¨?˜ê¸° ?„í•´??- ?¬ì „???•ì˜??ì°¸ê°’???…ë ¥?˜ì—¬ ë¹„êµ?˜ëŠ” ê¸°ë²• ë°??œë™ ??ë§í•œ?? ì¢…ë¥˜?ëŠ” ì°??˜í”Œë§??´ë¦¬?¤í‹± ?¼ê???ê²€?¬ê? ì¡´ì¬?œë‹¤- , , , . ?ŒìŠ¤??ì¼€?´ìŠ¤', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 34ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 34
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 35, '?€ ?¤í–‰??ì²˜ë¦¬ ëª…ë ¹?¤ì„ ëª¨ì•„ ?œìŠ¤?¬ë¡œ ë§Œë“  ???œìŠ¤Gradle', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 35ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 35
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 36, 'ì½˜í…ì¸??œê³µ??ì½˜í…ì¸ ë? ?œê³µ?˜ëŠ” ?€??Contents Provider) :', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 36ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 36
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 37, 'ê¸°ì´ˆ ê²½ë¡œ ê²€??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 37ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 37
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 38, ', ê°??«ìë¥??”í•˜ê±°ë‚˜ ??ê°’ì„ ??ì£¼ì†Œë¡??¬ìš©?˜ëŠ” ë°©ì‹?€XOR ??œì‚°ë²?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 38ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 38
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 39, '??ë²ˆì— ??ê°€ì§€ ì²˜ë¦¬ë§??˜í–‰?œë‹¤- . ?´ë˜??ë©”ì†Œ???¨ìˆ˜ë¥?ìµœì†Œ ?¨ìœ„ë¡?ë¶„ë¦¬?œë‹¤- / / . ?¤í˜•??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 39ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 39
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?Œí”„?¸ì›¨??ê°œë°œ', 40, '(DRM) ?ì½˜í…ì¸??”í˜¸??ë°???ê´€ë¦?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 40ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
      and q.number = 40
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 41, '?¸ëœ??…˜???°ì‚°?€ ëª¨ë‘ ?¤í–‰?˜ê±°??ëª¨ë‘ ?¤í–‰?˜ì? ?Šì•„, ???œë‹¤. Durability', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 41ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 41
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 42, ', , , ?„ë¡œ?¸ìŠ¤?€ ?Œì´ë¸?ê°„ì— ë§¤íŠ¸ë¦?Š¤ë¥?ë§Œë“¤?´ì„œ ?¸ëœ??…˜??ë¶„ì„?˜ëŠ” ê²ƒì??ë¶„ì„CASE', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 42ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 42
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 43, ', , ?¨ìˆœ?”ë? ?„í•´ ì¤‘ë³µ ?µí•© ë¶„ë¦¬ ?±ì„ ?˜í–‰?˜ëŠ” ?°ì´??ëª¨ë¸ë§?, , ê¸°ë²•?€??¸ë±?¤ì •ê·œí™”', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 43ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 43
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 44, ', ?œë‹¤ ?´ì— ?í•©??ëª…ë ¹?´ëŠ”. SQL ?INSERT', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 44ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 44
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 45, '?°ì´??êµ¬ì¡°???ˆì •??ìµœë???, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 45ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 45
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 46, '- E-R ?°ê²°???€ë¦?ê²ƒì???¬ê°??ê°œì²´ ?€??', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 46ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 46
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 47, 'SQL ? ?Œì› ?„í™”ë²ˆí˜¸UPDATE ( ) ??10-14?™ï¼ ?Œì›ë²ˆí˜¸WHERE ?˜N4??ï¼?FROM', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 47ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 47
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 48, '?€ ë§Œì¡±?œí‚¤ì§€ ëª»í•˜???¤ëŠ”??„ë³´??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 48ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 48
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 49, 'DBA PARK [STUDENT]???ˆëŠ” ?œìŠ¤??ê¶Œí•œ??ë¶€?¬í•˜ê³ ì ?˜ëŠ” ë¬¸ì„ ?‘ì„±?˜ê³ ??SQL?œë‹¤ ?¤ìŒ??ì£¼ì–´ì§?ë¬¸ì˜ ë¹ˆì¹¸???Œë§ê²?ì±„ìš´ ê²ƒì?. SQL ? SQL GRANT ï¼?????STUDENT TO PARK; INSERT, INTO', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 49ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 49
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 50, 'ì£¼ì–´ì§?ë¦´ë ˆ?´ì…˜ ì¡°ì‘???„í•œ ?°ì‚°??ì§‘í•©?´ë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 50ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 50
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 51, 'SQL ? ê³¼ëª©?´ë¦„SELECT ?±ì FROM ?™ë²ˆWHERE EXISTS (SELECT ?™ìƒ ?™ìƒ ?™ë²ˆ ?±ì  ?™ë²ˆ ?™ìƒ ?™FROM WHERE . . AND .ï¼?ê³??„ì‚° ?„ê¸° ?™ìƒ ì£¼ì†Œ ê²½ê¸°IN (???? ???? AND . ????; ï¼??™ìƒ ?Œì´ë¸? ] ?™ë²ˆ ?´ë¦„ ?™ë…„ ?™ê³¼ ì£¼ì†Œ 1000 ê¹€ì² ìˆ˜ 1 ?„ì‚° ?œìš¸ 2000 ê³ ì˜ì¤€ 1 ?„ê¸° ê²½ê¸° 3000 ? ì§„??2 ?„ì ê²½ê¸° 4000 ê¹€?ì§„ 2 ?„ì‚° ê²½ê¸° 5000 ?•í˜„??3 ?„ì ?œìš¸ ?±ì  ?Œì´ë¸? ] ?™ë²ˆ ê³¼ëª©ë²ˆí˜¸ê³¼ëª©?´ë¦„?™ì  ?ìˆ˜ 1000 A100 ?ë£Œêµ¬ì¡° A 91 2000 A200 DB A ï¼?99 3000 A100 ?ë£Œêµ¬ì¡° B ï¼?88 3000 A200 DB B 85 4000 A200 DB A 94 4000 A300 ?´ì˜ì²´ì œ B ï¼?89 5000 A300 ?´ì˜ì²´ì œ B 88', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 51ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 51
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 52, '(Locking) ?ë¡œí‚¹???€?ì´ ?˜ëŠ” ê°ì²´???¬ê¸°ë¥?ë¡œí‚¹ ?¨ìœ„?¼ê³  ?œë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 52ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 52
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 53, 'X1 department ëª…ë ¹?€?delete select on department to X1;', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 53ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 53
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 54, '(VIEW) ?ë·??„ì— ???¤ë¥¸ ë·°ë? ?•ì˜?????ˆë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 54ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 54
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 55, '?¼ë¦¬???°ì´??êµ¬ì¡°', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 55ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 55
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 56, '3 (BCNF)?‘ì—…?€??ì ê°’ì´ ?„ë‹Œ ?„ë©”?¸ì„ ë¶„í•´', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 56ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 56
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 57, 'A1, A2, A3 3 A1ê°?ê°????„ë©”?¸ì? ê°?ê°????„ë©”?¸ì? ê°?ê°’ì„ ê°–ëŠ”?? , A2 2 , A3 4 . ??ë¦´ë ˆ?´ì…˜??ì¡´ì¬?????ˆëŠ” ê°€?¥í•œ ?œí”Œ ??ìµœë? ?˜ëŠ”(Tuple) ?24', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 57ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 57
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 58, '?„ë‹Œ ê²ƒì???€???ˆì½”???‘ì‹ ?¤ê³„', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 58ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 58
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 59, '4 , 2?€??ë¦´ë ˆ?´ì…˜ ?¸ìŠ¤?´ìŠ¤ê°€ ê°??œí”Œ??ê°–ëŠ”?¤ë©´ ê·?ë¦´ë ˆ?´ì…˜??7ì°¨ìˆ˜ ??degree) ?1', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 59ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 59
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•', 60, '?°ì´?°ì›¨?´í•˜?°ìŠ¤??ê¸°ë³¸?ì¸ OLAP(on-line analytical processing) ?°ì‚°???„ë‹Œ ê²ƒì??translate', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 60ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
      and q.number = 60
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 61, 'UNIX SHELL ?configenv', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 61ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 61
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 62, 'Java ?˜long???1byte', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 62ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 62
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 63, 'Java ?System.out.print( )', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 63ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 63
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 64, '?„ë¡œ?¸ìŠ¤ ?ì„± ì¢…ë£Œ,', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 64ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 64
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 65, 'OSI 7? ë¢°???ˆê³  ëª…í™•???°ì´?°ë? ?„ë‹¬?˜ëŠ” ê³„ì¸µ?€??„ì†¡ ê³„ì¸µ', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 65ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 65
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 66, 'until who | grep wow do sleep 5 done ?¬ìš©?ê? ë¡œê·¸?¸í•œ ê²½ìš°?ë§Œ ë°˜ë³µë¬¸ì„ ?˜í–‰?œë‹¤wow .', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 66ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 66
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 67, 'int x 1, y 6;ï¼?ï¼?while (y--) { x ;ï¼‹ï¼‹ } System.out.println(?œx ??x ?œy ??y);ï¼?ï¼?ï¼?x 7 y 0', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 67ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 67
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 68, '>>> a [0,10,20,30,40,50,60,70,80,90]ï¼?>>> a[:7:2] [20, 60]', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 68ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 68
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 69, 'ì»´í¬?ŒíŠ¸ ?¬ì‚¬??, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 69ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 69
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 70, ', SJF(Shortest ?•ì±…???¬ìš©??ê²½ìš° ê°€??ë¨¼ì? ì²˜ë¦¬?˜ëŠ” ?‘ì—…?€Job First) ? ?„ë¡œ?¸ìŠ¤ ë²ˆí˜¸ ?¤í–‰?œê°„ P1 6 P2 8 P3 4 P4 3 P1', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 70ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 70
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 71, '4 , ëª¨ë‘ ë¹„ì–´ ?ˆë‹¤ê³?ê°€?•í•œ???¤ìŒ???œì„œë¡??˜ì´ì§€ ì°¸ì¡°ê°€ ë°œìƒ??. ???˜ì´ì§€ êµì²´ ?Œê³ ë¦¬ì¦˜???¬ìš©??ê²½ìš° ?˜ì´ì§€ ê²°í•¨??, FIFO ë°œìƒ ?Ÿìˆ˜?? ?˜ì´ì§€ ì°¸ì¡° ?œì„œ : 1, 2, 3, 1, 2, 4, 5, 1 ??', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 71ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 71
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 72, 'TCP , ê°œë? ?„ì†¡?˜ê³  ?˜ì‹ ?ì˜ ?‘ë‹µ??ê¸°ë‹¤ë¦¬ëŠ” ë°©ì‹?¼ë¡œ ??ë²ˆì— ?„ë ˆ1??ê°œë§Œ ?„ì†¡?????ˆëŠ” ê¸°ë²•?€1 ?Slow Start', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 72ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 72
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 73, '(Coupling) ??°ì´??ê²°í•©??????ëª¨ë“ˆ??ë§¤ê°œë³€?˜ë¡œ ?ë£Œ(Data Coupling)', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 73ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 73
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 74, '?Šì? ê¸°ëŠ¥ ?”ì†Œë¡?êµ¬ì„±?˜ëŠ” ê²½ìš°?´ë©° ?œë¡œ ?¤ë¥¸ ?ìœ„ ëª¨ë“ˆ??, ?˜í•´ ?¸ì¶œ?˜ì–´ ì²˜ë¦¬?ì˜ ?°ê??±ì´ ?†ëŠ” ?œë¡œ ?¤ë¥¸ ê¸°ëŠ¥???˜í–‰?˜ëŠ” ê²½ìš°???‘ì§‘?„ëŠ”?Functional Cohesion', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 74ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 74
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 75, 'internal', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 75ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 75
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 76, 'UDP ??°ì´???„ì†¡ ??ë¥?ë°›ëŠ”?? ACK .', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 76ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 76
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 77, '(2, ???€??ë¬¼ë¦¬ ì£¼ì†Œ??76) ? ?¸ê·¸ë¨¼íŠ¸ë²ˆí˜¸ ?œì‘ì£¼ì†Œ ê¸¸ì´ ë°”ì´?? ) 0 670 248 1 1752 422 2 222 198 3 996 604 398', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 77ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 77
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 78, 'TCP/IP? ì½œ?€?TCP', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 78ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 78
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 79, 'C ?for', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 79ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 79
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©', 80, 'PHP ?@', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 80ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
      and q.number = 80
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 81, '???¬ìš©?˜ëŠ” ?¨ê³¼ë¥?ê°€ì§€??ë³´ì•ˆ ?”ë£¨?˜ì??ZIGBEE', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 81ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 81
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 82, 'CMM(Capability Maturity Model) ?ìµœì ?¨ê³„', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 82ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 82
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 83, 'ê°€???¤ë˜??ëª¨í˜•?¼ë¡œ ë§ì? ?ìš© ?¬ë?ê°€ ?ˆì?ë§??”êµ¬?¬í•­ ??ë³€ê²½ì´ ?´ë ¤?°ë©° ê°??¨ê³„??ê²°ê³¼ê°€ ?•ì¸?˜ì–´?¼ì?ë§?, ?¤ìŒ ?¨ê³„ë¡??˜ì–´ê°„ë‹¤ ? í˜• ?œì°¨??ëª¨í˜•?¼ë¡œ ê³ ì „???? ëª?ì£¼ê¸° ëª¨í˜•?´ë¼ê³ ë„ ?œë‹¤. ?¨í‚¤ì§€ ëª¨í˜•', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 83ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 83
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 84, 'ê²ƒì???œí˜„ì¸?, '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 84ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 84
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 85, '?˜ë“œ?”ìŠ¤?¬ì? ê°™ì? ?°ì´???€?¥ì¥ì¹˜ë? ?¸ìŠ¤?¸ë²„???´ëŒ‘- ?°ì— ì§ì ‘ ?°ê²°?˜ëŠ” ë°©ì‹ ?€?¥ì¥ì¹˜ì? ?¸ìŠ¤??ê¸°ê¸° ?¬ì´???¤íŠ¸?Œí¬ ?”ë°”?´ìŠ¤ê°€ - ?ˆì? ë§ì•„???˜ê³  ì§ì ‘ ?°ê²° ?˜ëŠ” ë°©ì‹?¼ë¡œ êµ¬ì„± DAS', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 85ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 85
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 86, 'ê³µí†µ ì»´í¬?ŒíŠ¸ ?¬ì‚¬?©ìœ¼ë¡?ì¤‘ë³µ ?ˆì‚° ?ˆê°', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 86ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 86
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 87, 'SoftTechë¸”ë¡ ?¤ì´?´ê·¸?¨ì„ ì±„íƒ???ë™???„êµ¬??SREM', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 87ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 87
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 88, '(eXtreme Programming) 5?˜ì? ?ŠëŠ” ê²ƒì???˜ì‚¬?Œí†µ', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 88ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 88
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 89, '. ( )?´ìš©?¼ë¡œ ?³ì? ê²ƒì?? ?•ì±… ??( ) DAC RBAC ê¶Œí•œ ë¶€???œìŠ¤???°ì´???Œìœ ??ì¤‘ì•™ ê´€ë¦¬ì ?‘ê·¼ ê²°ì • ë³´ì•ˆ?±ê¸‰ (Label) ? ë¶„ (Identity) ??•  (Role) ?•ì±… ë³€ê²?ê³ ì •??ë³€ê²??´ë ¤?€( ) ë³€ê²??©ì´ ë³€ê²??©ì´ ?¥ì  ?ˆì •??ì¤‘ì•™ ì§‘ì¤‘??êµ¬í˜„ ?©ì´ ? ì—°??ê´€ë¦??©ì´ NAC', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 89ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 89
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 90, '4ë¡??˜ì—´??ê²ƒì?? ê³„íš ?˜ë¦½??ê³ ê° ?‰ê???ê°œë°œ ë°?ê²€ì¦â’¸ ?„í—˜ ë¶„ì„???œìœ¼ë¡?ë°˜ë³µ- - -', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 90ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 90
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 91, '(estimation models) ?COCOMO', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 91ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 91
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 92, 'ê³µê°œ?¤ë¡œ ?”í˜¸?”ëœ ë©”ì‹œì§€??ë°˜ë“œ??ê³µê°œ?¤ë¡œ ë³µí˜¸???´ì•¼', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 92ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 92
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 93, 'ê´‘ì„¬? ë? ?´ìš©???µì‹ ê¸°ìˆ ???˜ë‚˜ë¥??˜ë??? ?Œì¥???œë¡œ ?¤ë¥¸ ë³µìˆ˜??ê´‘ì‹ ?¸ë? ?™ì‹œ???´ìš©?˜ëŠ” ê²? ?¼ë¡œ ê´‘ì„¬? ë? ?¤ì¤‘???˜ëŠ” ë°©ì‹??ë¹›ì˜ ?Œì¥ ì¶•ê³¼ ?Œì¥???¤ë¥¸ ê´‘ì„ ?€ ?œë¡œ ê°„ì„­???¼ìœ¼- ?¤ì? ?ŠëŠ” ?±ì§ˆ???´ìš©??Wavelength Division Multiplexing', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 93ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 93
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 94, 'ê²?? ë„?¨ìœ¼ë¡œì¨ ?•ë³´? ì¶œ ?±ì˜ ê³µê²©??? ë°œ?????ˆëŠ” ì·¨ì•½?ì?, ?Ransomware', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 94ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 94
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 95, 'CBD(Component Based Development)ê²ƒì??ê°œë°œ ê¸°ê°„ ?¨ì¶•?¼ë¡œ ?¸í•œ ?ì‚°???¥ìƒ', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 95ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 95
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 96, '(SDDC : Software Defined Data ???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?Center) ?ì»´í“¨???¤íŠ¸?Œí‚¹ ?¤í† ë¦¬ì? ê´€ë¦??±ì„ ëª¨ë‘ ?Œí”„?¸ì›¨?´ë¡œ , , ,', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 96ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 96
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 97, 'ë³´ì•ˆ??ê²°í•¨?¼ë¡œ ?¸í•˜??ë°œìƒ ê°€?¥í•œ ê°ì¢… ?´í‚¹?¼ë¡œë¶€???œìŠ¤?œì„ ë³´í˜¸?˜ê¸° ?„í•˜???¬ìš©?˜ëŠ” ê²ƒì?? GPIB', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 97ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 97
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 98, 'NS(Nassi-Schneiderman) chart ??¼ë¦¬??ê¸°ìˆ ??ì¤‘ì ?????„í˜•???œí˜„ ë°©ë²•?´ë‹¤.', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 98ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 98
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 99, '?€?©ëŸ‰ ?°ì´?°ë? ë¶„ì‚° ì²˜ë¦¬?˜ê¸° ?„í•œ ëª©ì ?¼ë¡œ ê°œë°œ??- ?„ë¡œê·¸ë˜ë°?ëª¨ë¸?´ë‹¤. ???˜í•´ ê³ ì•ˆ??ê¸°ìˆ ë¡œì¨ ?€?œì ???€?©ëŸ‰ ?°ì´- Google ??ì²˜ë¦¬ë¥??„í•œ ë³‘ë ¬ ì²˜ë¦¬ ê¸°ë²•???œê³µ?œë‹¤. ?„ì˜???œì„œë¡??•ë ¬???°ì´?°ë? ë¶„ì‚° ì²˜ë¦¬?˜ê³  ?´ë? - ?¤ì‹œ ?©ì¹˜??ê³¼ì •??ê±°ì¹œ?? MapReduce', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 99ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 99
  );

insert into questions (
  exam_id, year, round, subject, number, content, explanation, difficulty, exam_part
)
select e.id, 2020, 4, '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?, 100, 'êµ? œ ?œì??€?ISO 14001', '2020??4???•ë³´ì²˜ë¦¬ê¸°ì‚¬ ?„ê¸° 100ë²??•ë‹µ ?´ì„¤ ì¤€ë¹?ì¤‘ì…?ˆë‹¤.', 2, 'written'
from exams e
where e.slug = 'jeongchogi'
  and not exists (
    select 1 from questions q
    where q.exam_id = e.id
      and q.year = 2020
      and q.round = 4
      and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
      and q.number = 100
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Pair Programming', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Collective Ownership', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Continuous Integration', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¼ë°”??ê°ì²´ì§€??ë¶„ì„ ê¸°ë²•?ì„œ ?™ì  ëª¨ë¸ë§ì— ?œìš©??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 1
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¨í‚¤ì§€ ?¤ì´?´ê·¸??Package Diagram)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?íƒœ ?¤ì´?´ê·¸??State Diagram)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ë£Œ ?ë¦„??Data Flow Diagram)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ì£¼ìš” ê¸°ëŠ¥?¼ë¡œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 2
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê·¸ë˜??ì§€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤ì–‘???Œí”„?¸ì›¨??ê°œë°œ ëª¨í˜• ì§€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¸ì–´ ë²ˆì—­', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°ì²´ì§€??ê¸°ë²•??ìº¡ìŠ?????€???¤ëª…?¼ë¡œ ?€ë¦?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 3
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?Œí”„?¸ì›¨???¬ì‚¬?©ì„±???’ì•„ì§„ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë³€ê²?ë°œìƒ ???¤ë¥˜???Œê¸‰?¨ê³¼ê°€ ?ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ìœ„ ?´ë˜?¤ì˜ ëª¨ë“  ?ì„±ê³??°ì‚°???˜ìœ„ ?´ë˜?¤ê? ë¬¼ë ¤ë°›ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê²ƒì„ ?˜ë??œë‹¤.?¤ìŒ ?´ìš©???¤ëª…?˜ëŠ” ê°ì²´ì§€???¤ê³„ ?ì¹™?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 4
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¨ì¼ ì±…ì„ ?ì¹™', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°œë°© ?ì‡„???ì¹™', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¦¬ìŠ¤ì½”í”„ êµì²´???ì¹™', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œì´???„í„° ?•íƒœ???Œí”„?¸ì›¨???„í‚¤?ì²˜???€???¤ëª…?¼ë¡œ ?³ì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 5
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œë¸Œ?œìŠ¤?œì´ ?…ë ¥?°ì´?°ë? ë°›ì•„ ì²˜ë¦¬?˜ê³  ê²°ê³¼ë¥??¤ìŒ ?œë¸Œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œìŠ¤?œìœ¼ë¡??˜ê²¨ì£¼ëŠ” ê³¼ì •??ë°˜ë³µ?œë‹¤.ê³„ì¸µ ëª¨ë¸?´ë¼ê³ ë„ ?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œì˜ ?œë¸Œ?œìŠ¤??ëª¨ë¸ ë·??œì–´ ?¼ë¡œ êµ¬ì„±?˜ì–´ ?ˆë‹¤3 ( , , ) .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì½”ë“œ???€????ª©??ì¤‘ëŸ‰ ë©´ì  ?©ëŸ‰ ?±ì˜ ë¬¼ë¦¬???˜ì¹˜ë¥??´ìš©?˜ì—¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 6
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì§?ì½”ë“œ10', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œì˜ ?«ì ì½”ë“œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¸”ë¡ ì½”ë“œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì???¨í„´ ?¬ìš©????, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 7
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê°ì²´ì§€???¤ê³„ ë°?êµ¬í˜„???ì‚°?±ì„ ?’ì´?”ë° ?í•©?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ì‚¬?©ì„ ?„í•œ ê°œë°œ ?œê°„???¨ì¶•?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ˆì°¨???¸ì–´?€ ?¨ê»˜ ?´ìš©?????¨ìœ¨??ê·¹ë??”ëœ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 8
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'êµ¬ì¡°??ë¶„ì„ ê¸°ë²•???´ìš©?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œê°„ ?ë¦„??ëª…í™•?˜ê²Œ ?œí˜„?????ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???”ì†Œ???”ì‚´?????¬ê°??ì§ì„  ?¨ì„  ?´ì¤‘???¼ë¡œ ?œDFD , , , ( / )', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œí•œ??ê·¸ë˜???œê¸°ë²•ì„ ?´ìš©?˜ì—¬ ?Œí”„?¸ì›¨??êµ¬ì„± ?”ì†Œë¥?ëª¨ë¸ë§í•˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 9
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ëŠ¥ ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?™ì  ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¸”ë™ë°•ìŠ¤ ë¶„ì„ ëª¨ë¸ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ê¸°ë³¸ êµ¬ì„±?”ì†Œê°€ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 10
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Terminal', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Relationship', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Diagram', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨?´ì˜ ?ìœ„ ?¤ê³„???í•˜ì§€ ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 11
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ëª¨ë“ˆ ?¤ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¸í„°?˜ì´???•ì˜', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¬ìš©???¸í„°?˜ì´???¤ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì¤??ë£Œ ?¬ì „ ?ì„œ ? íƒ???˜ë?ë¥??˜í??´ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 12
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '{ }', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ï¼?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ï¼ì†Œ?„íŠ¸?¨ì–´???¬ìš©???¸í„°?˜ì´??ê°œë°œ ?œìŠ¤??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 13
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ëŸ¬ ì²˜ë¦¬?€ ?ëŸ¬ ë©”ì‹œì§€ ì²˜ë¦¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?„ì?ê³??„ë¡¬?„íŠ¸ ?œê³µ(prompt)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ŒìŠ¤ ì½”ë“œ ë¶„ì„ ë°??¤ë¥˜ ë³µêµ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”êµ¬?¬í•­ ëª…ì„¸ ê¸°ë²•???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 14
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ë¡œ ?œìˆ ?œë‹¤.ë¹„ì •??ëª…ì„¸ ê¸°ë²•?€ ?¬ìš©?ì˜ ?”êµ¬ë¥??œí˜„????ë¹„ì •??ëª…ì„¸ Z', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê¸°ë²•???¬ìš©?œë‹¤.?•í˜• ëª…ì„¸ ê¸°ë²•?€ ?¬ìš©?ì˜ ?”êµ¬ë¥??œí˜„?????˜í•™?ì¸ ?ë¦¬?€', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œê¸°ë²•ì„ ?´ìš©?œë‹¤.?•í˜• ëª…ì„¸ ê¸°ë²•?€ ë¹„ì •??ëª…ì„¸ ê¸°ë²•??ë¹„í•´ ?œí˜„??ê°„ê²°?˜ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ?¨ê³„?ì„œ ?”êµ¬ ë¶„ì„ ê³¼ì •???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 15
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?????ˆë‹¤.ê°œë°œ ë¹„ìš©??ê°€??ë§ì´ ?Œìš”?˜ëŠ” ?¨ê³„?´ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ë£Œ?ë¦„???ë£Œ ?¬ì „ ?±ì´ ?¨ê³¼?ìœ¼ë¡??´ìš©?????ˆë‹¤, .', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë³´ë‹¤ êµ¬ì²´?ì¸ ëª…ì„¸ë¥??„í•´ ?Œë‹¨??ëª…ì„¸??ê°€ ??Mini-Spec)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?©ë  ???ˆë‹¤.? ì??ë°©ë²•ë¡ ì— ?´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 16
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¤í¬??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?µìŠ¤?¸ë¦¼ ?„ë¡œê·¸ë˜ë°?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª¨ë“ˆì¤‘ì‹¬ ê°œë°œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ë¼?´ì–¸?¸ì? ?œë²„ ê°„ì˜ ?µì‹ ???´ë‹¹?˜ëŠ” ?œìŠ¤???Œí”„?¸ì›¨?´ë?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 17
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?˜ì´?¨ì–´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¯¸ë“¤?¨ì–´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?‘ìš© ?Œí”„?¸ì›¨??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì???¨í„´ ë¶„ë¥˜???´ë‹¹?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 18
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'êµ¬ì¡° ?¨í„´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?‰ìœ„ ?¨í„´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¶”ìƒ ?¨í„´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë°”ëŒì§í•œ ?Œí”„?¸ì›¨???¤ê³„ ì§€ì¹¨ì´ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 19
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ëª¨ë“ˆ ê°„ì˜ ?‘ì† ê´€ê³„ë? ë¶„ì„?˜ì—¬ ë³µì¡?„ì? ì¤‘ë³µ??ì¤„ì¸??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ëª¨ë“ˆ ê°„ì˜ ê²°í•©?„ëŠ” ê°•í• ?˜ë¡ ë°”ëŒì§í•˜??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª¨ë“ˆ ê°„ì˜ ?¨ê³¼?ì¸ ?œì–´ë¥??„í•´ ?¤ê³„?ì„œ ê³„ì¸µ???ë£Œ ì¡°ì§??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œì‹œ?˜ì–´???œë‹¤. ?Œí”„?¸ì›¨???¨í‚¤ì§??„êµ¬ ?œìš© ??ê³ ë ¤ ?¬í•­?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨???¤ê³„'
  and q.number = 20
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë³´ì•ˆ???„í•˜???´ê¸°ì¢??°ë™??ê³ ë ¤?˜ì? ?Šì•„???œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¬ìš©???¸ì˜?±ì„ ?„í•œ ë³µì¡??ë°?ë¹„íš¨?¨ì„± ë¬¸ì œë¥?ê³ ë ¤?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œí’ˆ ?Œí”„?¸ì›¨??ì¢…ë¥˜???í•©???”í˜¸???Œê³ ë¦¬ì¦˜???ìš©?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'êµ¬ì¶•? í˜• ì¤????€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 21
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?„ìš”??ê²½ìš° ??ê°€ì§€ ë°©ì‹?¼ë¡œ êµ¬í˜„??ê°€?¥í•˜?¤EAI .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?°ì´??ë³‘ëª©?„ìƒ??ìµœì†Œ?”í•  ???ˆë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ì¤‘ê°„??ë¯¸ë“¤?¨ì–´ë¥??ì? ?Šê³  ê°?? í”Œë¦¬ì??´ì…˜??point to', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¡??°ê²°?œë‹¤point .?ŒìŠ¤ ì½”ë“œ ?ˆì§ˆ ë¶„ì„ ?„êµ¬ ì¤??•ì  ë¶„ì„ ?„êµ¬ê°€ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 22
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'checkstyle', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'valance', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'cppcheck', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?°ì‚°?ì— ?€???°ì‚°ê²°ê³¼ë¡??³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 23
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '42', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '77', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '360', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸í„°?˜ì´??ë³´ì•ˆ???„í•´ ?¤íŠ¸?Œí¬ ?ì—­???ìš©?????ˆëŠ” ê²ƒìœ¼ë¡?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 24
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SSL', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SMTP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'S-HTTP', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê²€ì¦?ê²€??ê¸°ë²• ì¤?ê°œë°œ?ì˜ ?¥ì†Œ?ì„œ ?¬ìš©?ê? ê°œë°œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 25
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?•ìƒ ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ë£Œêµ¬ì¡° ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ŒíŒŒ ê²€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ì´ˆê¸° ?ë£Œ???€?˜ì—¬ ?½ì… ?•ë ¬ ???´ìš©?˜ì—¬', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 26
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '3, 4, 9, 7, 8', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '7, 8, 3, 4, 9', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '3, 8, 4, 9, 7', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???¤ì¹˜ ë§¤ë‰´?¼ì— ?€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 27
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'êµ¬ë¶„?˜ì—¬ ?¤ëª…?œë‹¤.?¤ì¹˜ ?œì‘ë¶€???„ë£Œ???Œê¹Œì§€????ê³¼ì¥??ë¹ ì§?†ì´ ?œì„œ ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¡??¤ëª…?œë‹¤.?¤ì¹˜ ë§¤ë‰´?¼ì? ê°œë°œ??ê¸°ì??¼ë¡œ ?‘ì„±?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¤ì¹˜ ë§¤ë‰´?¼ì—??ëª©ì°¨ ê°œìš” ê¸°ë³¸?¬í•­ ?±ì´ ê¸°ë³¸?ìœ¼ë¡??¬í•¨, ,', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?˜ì–´???œë‹¤.?¸í„°?˜ì´??êµ¬í˜„ ê²€ì¦??„êµ¬ê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 28
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'xUnit', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'STAF', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'NTAF', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???•ìƒ ê´€ë¦¬ì—??ê´€ë¦???ª©???¬í•¨?˜ì? ?ŠëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 29
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ŒìŠ¤ ì½”ë“œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?´ì˜ ë°??¤ì¹˜ ì§€ì¹¨ì„œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?„ë¡œ?íŠ¸ ê°œë°œ ë¹„ìš©', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¤ëª…???´ë‹¹?˜ëŠ” ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 30
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´ë? ?¤í‚¤ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê°œë… ?¤í‚¤ë§?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ˆí¼ ?¤í‚¤ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¸ë¦¬???€???´í–‰ ê²°ê³¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 31
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'A B D C E F', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'D B E C F A', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'A B C D E F', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°œì˜ ?¸ë“œë¡?êµ¬ì„±??ë¬´ë°©??ê·¸ë˜?„ì˜ ìµœë? ê°„ì„ ?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 32
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ï¼?n 2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ï¼n(n 1) 2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ï¼?ï¼?n(n 1)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ï¼??¤ìŒ???¤ëª…?˜ëŠ” ?ŒìŠ¤???©ì–´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 33
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ŒìŠ¤???¬ë‚˜ë¦¬ì˜¤', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ŒìŠ¤???¤ë¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ŒìŠ¤???°ì´??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¹Œë“œ ?ë™???„êµ¬???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 34
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???¨ìœ„ë¡??¤í–‰?œë‹¤.ë¹Œë“œ ?ë™???„êµ¬??ì§€?ì ???µí•©ê°œë°œ?˜ê²½?ì„œ ? ìš©?˜ê²Œ ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?©ëœ??ë¹Œë“œ ?ë™???„êµ¬?ëŠ” ?±ì´ ?ˆë‹¤Ant, Gradle, Jenkins .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ë¥?ê¸°ë°˜?¼ë¡œ ???¤í”ˆ?ŒìŠ¤ë¡??ˆë“œë¡œì´????Jenkins Groovy', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°œë°œ ?˜ê²½?ì„œ ?¬ìš©?œë‹¤.?€?‘ê¶Œ ê´€ë¦?êµ¬ì„± ?”ì†Œ???€???¤ëª…???€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 35
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¶Œìì½˜í…ì¸?ë¶„ë°°??ì½˜í…ì¸ ë? ë©”í? ?°ì´??Contents Distributor) :', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?€ ?¨ê»˜ ë°°í¬ ê°€?¥í•œ ?¨ìœ„ë¡?ë¬¶ëŠ” ê¸°ëŠ¥?´ë¦¬?´ë§ ?˜ìš°????ê´€ë¦?ë°??¼ì´? ìŠ¤ ë°œê¸‰ (Clearing House) :', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê´€ë¦¬ì»¨?¸ë¡¤??ë°°í¬??ì½˜í…ì¸ ì˜ ?´ìš© ê¶Œí•œ???µì œDRM :', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¸”ë™ë°•ìŠ¤ ?ŒìŠ¤??ê¸°ë²•?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 36
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?™ì¹˜ ?´ë˜??ë¶„í•´', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê²½ê³„ê°?ë¶„ì„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?ì¸ ê²°ê³¼ ê·¸ë˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ì‹± ?¨ìˆ˜ ì¤??ˆì½”???¤ë? ?¬ëŸ¬ ë¶€ë¶„ìœ¼ë¡??˜ëˆ„ê³??˜ëˆˆ ë¶€ë¶„ì˜', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 37
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?´ë”©ë²?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê¸°ìˆ˜ë³€?˜ë²•', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?«ìë¶„ì„ë²?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ?ì„œ ?¤ëª…?˜ëŠ” ?´ë¦° ì½”ë“œ ?‘ì„± ?ì¹™?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 38
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¨ìˆœ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì¶”ìƒ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?˜ì¡´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ì????€?‘ê¶Œ ê´€ë¦?ê¸°ìˆ ê³?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 39
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì½˜í…ì¸??ë³„ì²´ê³„ ?œí˜„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì½˜í…ì¸??¤ë¥˜ ê°ì? ë°?ë³µêµ¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¼ì´? ìŠ¤ ë°œê¸‰ ë°?ê´€ë¦?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¤ëª…ê³?ê´€???ˆëŠ” ?¸ëœ??…˜???¹ì§•?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?Œí”„?¸ì›¨??ê°œë°œ'
  and q.number = 40
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Isolation', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Consistency', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Atomicity', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´?°ë² ?´ìŠ¤???í–¥??ì£¼ëŠ” ?ì„± ?½ê¸° ê°±ì‹  ?? œ ?°ì‚°?¼ë¡œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 41
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ì¹˜ ë¶„ì„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¶„ì„CRUD', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ê???ë¶„ì„', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ê·œ?”ëœ ?”í‹°???ì„± ê´€ê³„ë? ?œìŠ¤?œì˜ ?±ëŠ¥ ?¥ìƒê³?ê°œë°œ ?´ì˜??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 42
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë°˜ì •ê·œí™”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì§‘ë‹¨??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¨¸ì§•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?™ìƒ ?Œì´ë¸”ì„ ?ì„±?????±ë³„ ?„ë“œê°€ ?„ë½?˜ì–´ ?´ë? ì¶”ê??˜ë ¤ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 43
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ALTER', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'DROP', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'MODIFY', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?•ê·œ?”ì˜ ?„ìš”?±ìœ¼ë¡?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 44
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì¤‘ë³µ ?°ì´?°ì˜ ?œì„±??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?˜ì • ?? œ ???´ìƒ?„ìƒ??ìµœì†Œ??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?Œì´ë¸?ë¶ˆì¼ì¹??„í—˜??ìµœì†Œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°œì²´ ê´€ê³?ëª¨ë¸???¤ì´?´ê·¸?¨ì—???¬ìš©?˜ëŠ” ê¸°í˜¸?€ ê·??˜ë???, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 45
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ê°???ì„±-', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??ê°œì²´ ?€?…ê³¼ ?ì„±???°ê²°', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ë§ˆë¦„ëª?ê´€ê³??€??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ë¬¸ì—??ë¹ˆì¹¸???¤ì–´ê°??´ìš©?¼ë¡œ ?³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 46
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SET', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'INTO', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'TO', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¦´ë ˆ?´ì…˜???ˆëŠ” ëª¨ë“  ?œí”Œ???€??? ì¼?±ì? ë§Œì¡±?œí‚¤ì§€ë§?ìµœì†Œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 47
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ë³¸??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ˆí¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¸ë˜??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°€ ?¬ìš©???ê²Œ ?Œì´ë¸????°ì´?°ë? ê°±ì‹ ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 48
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '????ALTER, TO', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '????UPDATE, ON', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '????REPLACE, IN', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '????ê´€ê³„ë??˜ì— ?€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 49
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¼ë°˜ ì§‘í•© ?°ì‚°ê³??œìˆ˜ ê´€ê³??°ì‚°?¼ë¡œ êµ¬ë¶„?œë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì§ˆì˜???€???´ë? êµ¬í•˜ê¸??„í•´ ?˜í–‰?´ì•¼ ???°ì‚°???œì„œë¥?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª…ì‹œ?œë‹¤.?í•˜???•ë³´?€ ê·??•ë³´ë¥??´ë–»ê²?? ë„?˜ëŠ”ê°€ë¥?ê¸°ìˆ ?˜ëŠ” ë¹„ì ˆ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ì°¨ì  ë°©ë²•?´ë‹¤. ?¤ìŒ ë¬¸ì˜ ?¤í–‰ ê²°ê³¼??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 50
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê³¼ëª©?´ë¦„ DB', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê³¼ëª©?´ë¦„ DB DB', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê³¼ëª©?´ë¦„ DB DB ?´ì˜ì²´ì œ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³¼ëª©?´ë¦„ DB ?´ì˜ì²´ì œ ë¡œí‚¹ ê¸°ë²•???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 51
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¡œí‚¹ ?¨ìœ„ê°€ ?‘ì•„ì§€ë©?ë³‘í–‰???˜ì?????•„ì§„ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?°ì´?°ë² ?´ìŠ¤??ë¡œí‚¹ ?¨ìœ„ê°€ ?????ˆë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¡œí‚¹ ?¨ìœ„ê°€ ì»¤ì?ë©?ë¡œí¬ ?˜ê? ?‘ì•„ ë¡œí‚¹ ?¤ë²„?¤ë“œê°€ ê°ì†Œ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???¬ìš©???ê²Œ ?Œì´ë¸”ì— ?€??ê²€???°ì‚°???Œìˆ˜?˜ëŠ”', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 52
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'remove select on department from X1;', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'revoke select on department from X1;', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'grant select on department from X1;', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë·????€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 53
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë·°ì— ?€??ì¡°ì‘?ì„œ ?½ì… ê°±ì‹  ?? œ ?°ì‚°?€ ?œì•½???°ë¥¸?? , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë·°ì˜ ?•ì˜??ê¸°ë³¸ ?Œì´ë¸”ê³¼ ê°™ì´ ë¬¸ì„ ?´ìš©?˜ì—¬ ë³€ê²½ALTER', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œë‹¤.ë·°ê? ?•ì˜??ê¸°ë³¸ ?Œì´ë¸”ì´ ?œê±°?˜ë©´ ë·°ë„ ?ë™?ìœ¼ë¡??œê±°??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?? ?°ì´??ëª¨ë¸???œì‹œ?´ì•¼ ???”ì†Œë¡?ê±°ë¦¬ê°€ ë¨?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 54
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì¶œë ¥ êµ¬ì¡°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?°ì‚°', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œì•½ ì¡°ê±´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???•ê·œ?•ì—??ë³´ì´?¤ì½”???•ê·œ???¼ë¡œ ?•ê·œ?”í•˜ê¸??„í•œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 55
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¶€ë¶??¨ìˆ˜ ì¢…ì† ?œê±°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?´í–‰ ?¨ìˆ˜ ì¢…ì† ?œê±°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê²°ì •?ê? ?„ë³´?¤ê? ?„ë‹Œ ?¨ìˆ˜ ì¢…ì† ?œê±°', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°??ì„±??ê°–ëŠ” ??ë¦´ë ˆ?´ì…˜?ì„œ ???„ë©”?¸ì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 56
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '12', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '8', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '9', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?°ì´?°ë² ?´ìŠ¤ ?¤ê³„ ??ë¬¼ë¦¬???¤ê³„ ?¨ê³„?ì„œ ?˜í–‰?˜ëŠ” ?¬í•­??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 57
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ˆì½”??ì§‘ì¤‘??ë¶„ì„ ë°??¤ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?‘ê·¼ ê²½ë¡œ ?¤ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ëª©í‘œ ??ë§ëŠ” ?¤í‚¤ë§??¤ê³„DBMS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '??ë¦´ë ˆ?´ì…˜ ?¤í‚¤ë§ˆê? ê°??ì„± ê°??„ë³´??ê·¸ë¦¬ê³?ê·??¤í‚¤ë§ˆì˜', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 58
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '7', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 59
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'roll-up', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'dicing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'drill-down', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?˜ê²½ ë³€?˜ë? ì¶œë ¥?˜ëŠ” ëª…ë ¹?´ê? ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?°ì´?°ë² ?´ìŠ¤ êµ¬ì¶•'
  and q.number = 60
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'printenv', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'env', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'setenv', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?„ë¡œê·¸ë˜ë°??¸ì–´???•ìˆ˜ ?°ì´???€??ì¤????¬ê¸°??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 61
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '2byte', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '4byte', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '8byte', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?¬ìš©?˜ëŠ” ì¶œë ¥ ?¨ìˆ˜ê°€ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 62
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'System.out.println( )', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'System.out.printing( )', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'System.out.printf( )', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ì˜ì²´ì œ?ì„œ ì»¤ë„??ê¸°ëŠ¥???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 63
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¬ìš©???¸í„°?˜ì´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê¸°ì–µ ?¥ì¹˜ ? ë‹¹ ?Œìˆ˜,', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?Œì¼ ?œìŠ¤??ê´€ë¦?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³„ì¸µ?ì„œ ?¨ë§ê¸??¬ì´???¤ë¥˜ ?˜ì •ê³??ë¦„ ?œì–´ë¥??˜í–‰?˜ì—¬', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 64
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?‘ìš© ê³„ì¸µ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¸ì…˜ ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œí˜„ ê³„ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ???¤í¬ë¦½íŠ¸???˜ë?ë¡??³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 65
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¬ìš©?ê? ë¡œê·¸?¸í•  ?Œê¹Œì§€ ë°˜ë³µë¬¸ì„ ?˜í–‰?œë‹¤wow .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ë¬¸ì?´ì„ ë³µì‚¬?œë‹¤wow .', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¬ìš©?ì— ?€???•ë³´ë¥?ë¬´í•œ ë°˜ë³µ?˜ì—¬ ì¶œë ¥?œë‹¤wow .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?ë°” ì½”ë“œë¥??¤í–‰??ê²°ê³¼??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 66
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ï¼?ï¼x 6 y -1', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ï¼?ï¼x 7 y -1', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ï¼?ï¼ì˜¤ë¥?ë°œìƒUnresolved compilation problem', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?Œì´?¬ìœ¼ë¡?êµ¬í˜„???„ë¡œê·¸ë¨???¤í–‰ ê²°ê³¼ë¡??³ì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 67
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '[60, 20]', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '[0, 20, 40, 60]', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '[10, 30, 50, 70]', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³µí†µëª¨ë“ˆ???¬ì‚¬??ë²”ìœ„???°ë¥¸ ë¶„ë¥˜ê°€ ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 68
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?”ë?ì½”ë“œ ?¬ì‚¬??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¨ìˆ˜?€ ê°ì²´ ?¬ì‚¬??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '? í”Œë¦¬ì??´ì…˜ ?¬ì‚¬??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒê³?ê°™ì? ?„ë¡œ?¸ìŠ¤ê°€ ì°¨ë?ë¡??ì— ?„ì°©?˜ì?????, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 69
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'P2', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'P3', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'P4', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê°œì˜ ?˜ì´ì§€ë¥??˜ìš©?????ˆëŠ” ì£¼ê¸°?µì¥ì¹˜ê? ?ˆìœ¼ë©?ì´ˆê¸°?ëŠ”', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 70
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '??', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë¦„?œì–´ê¸°ë²• ì¤??„ë ˆ?„ì´ ?ì‹¤?˜ì—ˆ?????ì‹¤???„ë ˆ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 71
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Sliding Window', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Stop and Wait', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Congestion Avoidance', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê²°í•©?????€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 72
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ë¥??„ë‹¬?????ë£Œêµ¬ì¡° ?•íƒœë¡??„ë‹¬?˜ì–´ ?´ìš©?????°ì´?°ê? , ê²°í•©?˜ì–´ ?ˆë‹¤ê³??œë‹¤.?´ìš© ê²°í•©?????˜ë‚˜??ëª¨ë“ˆ??ì§ì ‘?ìœ¼ë¡?(Content Coupling)', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¤ë¥¸ ëª¨ë“ˆ???´ìš©??ì°¸ì¡°??????ëª¨ë“ˆ?€ ?´ìš©?ìœ¼ë¡?ê²°í•©?˜ì–´ ?ˆë‹¤ê³??œë‹¤.ê³µí†µ ê²°í•©??????ëª¨ë“ˆ???™ì¼???„ì—­ (Common Coupling)', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?°ì´?°ë? ?‘ê·¼?œë‹¤ë©?ê³µí†µê²°í•© ?˜ì–´ ?ˆë‹¤ê³??œë‹¤.ê²°í•©??????ëª¨ë“ˆê°„ì˜ ?í˜¸?‘ìš© ?ëŠ” ?˜ì¡´???•ë„(Coupling) ,', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ë¥??˜í??´ëŠ” ê²ƒì´???‘ì§‘?„ì˜ ì¢…ë¥˜ ì¤??œë¡œ ê°„ì— ?´ë– ???˜ë? ?ˆëŠ” ?°ê?ê´€ê³„ë„ ì§€?ˆì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 73
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Sequential Cohesion', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Logical Cohesion', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Coincidental Cohesion', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ë°”?ì„œ ?¬ìš©?˜ëŠ” ?‘ê·¼?œì–´?ì˜ ì¢…ë¥˜ê°€ ?„ë‹Œ ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 74
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'private', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'default', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'public', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¹ì„±???´ë‹¹?˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 75
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¡ì‹  ì¤‘ì— ë§í¬ë¥?? ì? ê´€ë¦¬í•˜ë¯€ë¡?? ë¢°?±ì´ ?’ë‹¤.', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?ë¦„?œì–´???œì„œ?œì–´ê°€ ?†ì–´ ?„ì†¡?ë„ê°€ ë¹ ë¥´??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?œì–´ë¥??„í•œ ?¤ë²„?¤ë“œê°€ ?¬ë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒê³?ê°™ì? ?¸ê·¸ë¨¼íŠ¸ ?Œì´ë¸”ì„ ê°€ì§€???œìŠ¤?œì—???¼ë¦¬ ì£¼ì†Œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 76
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '400', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '1928', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '1930', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?¬ìš©?˜ëŠ” ?¼ë¦¬ì£¼ì†Œë¥?ë¬¼ë¦¬ì£¼ì†Œë¡?ë³€?˜ì‹œì¼?ì£¼ëŠ” ?„ë¡œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 77
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ARP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'FTP', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'IP', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¸ì–´?ì„œ êµ¬ì¡°ì²´ë? ?¬ìš©?˜ì—¬ ?°ì´?°ë? ì²˜ë¦¬?????¬ìš©?˜ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 78
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'scanf', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'struct', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'abstract', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?ì„œ ?¬ìš© ê°€?¥í•œ ?°ì‚°?ê? ?„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 79
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '#', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ï¼œï¼ ===', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?´ìš©?ê? ?¸í„°?·ê³¼ ê°™ì? ê³µì¤‘ë§ì— ?¬ì„¤ë§ì„ êµ¬ì¶•?˜ì—¬ ë§ˆì¹˜ ?„ìš©ë§?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?„ë¡œê·¸ë˜ë°??¸ì–´ ?œìš©'
  and q.number = 80
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'NDD', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'IDS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'VPN', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ëª¨ë¸???ˆë²¨ë¡??³ì? ?Šì? ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 81
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê´€ë¦¬ë‹¨ê³?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ê³„íš?¨ê³„', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?•ì˜?¨ê³„', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?¤ëª…???´ë‹¹?˜ëŠ” ?ëª…ì£¼ê¸° ëª¨í˜•?¼ë¡œ ê°€???³ì? ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 82
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ì½”ì½”ëª?ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '??¬??ëª¨í˜•', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê´€ê³„í˜• ëª¨ë¸', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?œë¹„??ì§€???„í‚¤?ì²˜ ê¸°ë°˜ ? í”Œë¦¬ì??´ì…˜??êµ¬ì„±?˜ëŠ” ì¸µì´ ?„ë‹Œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 83
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?„ë¡œ?¸ìŠ¤ì¸?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œì–´ ?´ë˜?¤ì¸µ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ë¹„ì¦ˆ?ˆìŠ¤ì¸?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ ?´ìš©???¤ëª…?˜ëŠ” ?¤í† ë¦¬ì? ?œìŠ¤?œì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 84
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'NAS', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'N-SCREEN', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'NFC', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ?„ë ˆ?„ì›Œ?¬ì˜ ?ìš© ?¨ê³¼ë¡?ë³????†ëŠ” ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 85
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'ê¸°ìˆ ì¢…ì†?¼ë¡œ ?¸í•œ ? í–‰?¬ì—…???˜ì¡´??ì¦ë?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?œì??”ëœ ?°ê³„ëª¨ë“ˆ ?œìš©?¼ë¡œ ?í˜¸ ?´ìš©???¥ìƒ', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê°œë°œ?œì????˜í•œ ëª¨ë“ˆ?”ë¡œ ? ì?ë³´ìˆ˜ ?©ì´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¬ì—??ê°œë°œ??ê²ƒìœ¼ë¡?êµ¬ì¡°???”êµ¬ ë¶„ì„???˜ê¸° ?„í•´', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 86
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'PSL/PSA', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'HIPO', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SADT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?µìŠ¤?¸ë¦¼ ?„ë¡œê·¸ë˜ë°???ê°€ì§€ ê°€ì¹˜ì— ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 87
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?¨ìˆœ??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?¼ë“œë°?, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'ê³ ê° ë°°ì œ', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ?€ ?•ë³´???‘ê·¼?µì œ ?•ì±…???€???¤ëª…?´ë‹¤ ?????¤ì–´ê°?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 88
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'MAC', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'SDAC', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'AAC', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨??ê°œë°œ ëª¨ë¸ ì¤??˜ì„ ??ëª¨ë¸??ê°€ì§€ ì£¼ìš” ?œë™???œì„œ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 89
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '???????¸ìˆœ?¼ë¡œ ë°˜ë³µ- - -', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '???????·ìˆœ?¼ë¡œ ë°˜ë³µ- - -', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '???????¹ìˆœ?¼ë¡œ ë°˜ë³µ- - -', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???????¹ì†Œ?„íŠ¸?¨ì–´ ë¹„ìš© ì¶”ì •ëª¨í˜• ???„ë‹Œ ê²ƒì?', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 90
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Putnam', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Function-Point', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'PERT', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, 'ê³µê°œ???”í˜¸??ë°©ì‹???€???¤ëª…?¼ë¡œ ?€ë¦?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 91
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?œë‹¤.ë¹„ë?ì¹??”í˜¸ê¸°ë²•?´ë¼ê³ ë„ ?œë‹¤.', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?€?œì ??ê¸°ë²•?€ ê¸°ë²•???ˆë‹¤RSA .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ë¶„ë°°ê°€ ?©ì´?˜ê³  ê´€ë¦¬í•´??????ê°œìˆ˜ê°€ ?ë‹¤, .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¤ìŒ???¤ëª…?˜ëŠ” ?¤ì¤‘??ê¸°ìˆ ?€', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 92
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Frequency Division Multiplexing', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Code Division Multiplexing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Time Division Multiplexing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?¹í˜?´ì????…ì˜?ì¸ ?¤í¬ë¦½íŠ¸ë¥??¬í•¨?œì¼œ ?¬ìš©??ì¸¡ì—???¤í–‰??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 93
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'Pharming', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Phishing', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'XSS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ?€ë¦?, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 94
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?ˆë¡œ??ê¸°ëŠ¥ ì¶”ê?ê°€ ?¬ìš´ ?•ì¥??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?Œí”„?¸ì›¨???¬ì‚¬?©ì´ ê°€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?„ë?ê¹Œì? ê°€??ë§ì´ ?ìš©?˜ì—ˆ???Œí”„?¸ì›¨??ê°œë°œ ë°©ë²•1960', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???•ì˜ ?°ì´?°ì„¼??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 95
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?•ì˜?œë‹¤.?¸ë ¥ ê°œì… ?†ì´ ?Œí”„?¸ì›¨??ì¡°ì‘ë§Œìœ¼ë¡??ë™ ?œì–´ ê´€ë¦¬í•œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, '?°ì´?°ì„¼????ëª¨ë“  ?ì›??ê°€?í™”?˜ì—¬ ?œë¹„?¤í•œ??', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '?¹ì • ?˜ë“œ?¨ì–´??ì¢…ì†?˜ì–´ ?¹í™”???…ë¬´ë¥??œë¹„?¤í•˜ê¸°ì— ?í•©', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?˜ë‹¤.ì»´í“¨???´ì˜ì²´ì œ??ì»¤ë„??ë³´ì•ˆ ê¸°ëŠ¥??ì¶”ê???ê²ƒìœ¼ë¡??´ì˜ì²´ì œ??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 96
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'CentOS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'XSS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Secure OS', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '???€???¤ëª…?¼ë¡œ ê±°ë¦¬ê°€ ë¨?ê²ƒì?', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 97
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, '?°ì† ? íƒ ë°??¤ì¤‘ ? íƒ ë°˜ë³µ ?±ì˜ ?œì–´?¼ë¦¬ êµ¬ì¡°ë¡??œí˜„?œë‹¤, , .', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'ì£¼ë¡œ ?”ì‚´?œë? ?¬ìš©?˜ì—¬ ?¼ë¦¬?ì¸ ?œì–´êµ¬ì¡°ë¡??ë¦„???œí˜„??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, '??ì¡°ê±´??ë³µí•©?˜ì–´ ?ˆëŠ” ê³³ì˜ ì²˜ë¦¬ë¥??œê°?ìœ¼ë¡?ëª…í™•???ë³„??, true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?”ë° ?í•©?˜ë‹¤.?¤ìŒ ?´ìš©???í•©???©ì–´??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 98
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'SQL', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'Hijacking', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'Logs', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '?Œí”„?¸ì›¨???„ë¡œ?¸ìŠ¤???€??ê°œì„  ë°??¥ë ¥ ì¸¡ì • ê¸°ì????€??, false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 99
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 1, 'IEEE 802.5', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 1
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 2, 'IEEE 488', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 2
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 3, 'SPICE', false
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 3
  );

insert into choices (question_id, number, content, is_correct)
select q.id, 4, '', true
from questions q
join exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
  and q.year = 2020
  and q.round = 4
  and q.subject = '?•ë³´?œìŠ¤??êµ¬ì¶•ê´€ë¦?
  and q.number = 100
  and not exists (
    select 1 from choices c
    where c.question_id = q.id
      and c.number = 4
  );
