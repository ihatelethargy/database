-- 출판사 pubs
USE pubs;

-- (1) 'Binnet & Hardley' 명칭의 출판사에서 출판사에서 출판한 책 이름

-- INNER JOIN 이용
SELECT t.title
FROM publishers p
JOIN titles t
ON t.pub_id = p.pub_id
WHERE p.pub_name = 'Binnet & Hardley';

-- print 내용
SELECT title
FROM titles
WHERE pub_id IN (SELECT pub_id FROM publishers WHERE pub_name = 'Binnet & Hardley');
