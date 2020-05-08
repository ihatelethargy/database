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

-- (2) 1990년과 1991년에 고용된 직원들에 대해 직원 명을 성과 이름과 맡은 직책 반환 (order fname/lname 순으로)
SELECT CONCAT(e.fname, ' ', e.lname) AS Name, j.job_desc
FROM employee e
LEFT OUTER JOIN jobs j 
ON e.job_id = j.job_id
WHERE (year(e.hire_date) = 1990 or year(e.hire_date) = 1991); 


