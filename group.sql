USE pubs;

-- (1) 현재 직원(employee)는 출판사에 관계없이 하나의 테이블에 저장되어 있다. 각 출판사 명 별 직원 수를 구하시오. 단 출판사 이름은 유일하지 않다고 가정합니다.

SELECT p.pub_name, e.fname 
FROM publishers p, employee e;


-- GROUP BY p.pub_name;