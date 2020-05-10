USE pubs;

-- *(1) 현재 직원(employee)는 출판사에 관계없이 하나의 테이블에 저장되어 있다. 각 출판사 명 별 직원 수를 구하시오. 단 출판사 이름은 유일하지 않다고 가정합니다.

SELECT p.pub_name , count(e.emp_id)
FROM publishers p
JOIN employee e
ON p.pub_id = e.pub_id
GROUP BY pub_name;

-- (2) 책에 대해 pubs의 서점들에 의해 1993년도에 주문된 총 판매된 수량, 총 주문 금액을 구하려 한다. 이때 책 이름 별 판매수량 및 주문금액은 sales 테이블의 데이터로부터 계산합니다.
-- (i) 주문된 적이 있는 경우에 한해 위의 질의 내용을 구하라. (INNER)
SELECT t.title, s.qty AS '판매수량' ,s.qty*(SELECT t.price FROM titles t WHERE s.title_id =t.title_id) AS '주문금액'
FROM sales s
JOIN titles t
ON s.title_id = t.title_id
GROUP BY t.title;

-- (ii) 주문된 적이 없는 경우도 포함하도록 질의 내용을 구하라.  OUTER JOIN titles 기준!

SELECT t.title, s.qty AS '판매수량', s.qty*(SELECT t.price FROM titles t WHERE s.title_id =t.title_id) AS '주문금액'
FROM titles t
LEFT OUTER JOIN sales s
ON s.title_id = t.title_id
GROUP BY t.title;


-- **(4) 단독 저자에 의해 저술된 책 이름을 구하시오. (먼저 묶고 HAVING)
SELECT t.title AS '단독저자'
FROM titles t
JOIN titleauthor ta
ON t.title_id = ta.title_id
GROUP BY t.title
HAVING COUNT(ta.au_id) = 1;

