USE sqlDB;

/*
SELECT userID, amount -> 못생겼다! 의미가 없다. 
FROM buyTbl
ORDER BY userID;
그룹별로 묶어주자
*/
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 갯수' 
FROM buyTbl
GROUP BY userID
ORDER BY userID;

/*총구매액 구하기*/
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매 금액'
FROM buyTbl
GROUP BY userID
ORDER BY 2 DESC; -- 구매 많이 한 순으로!

/*평균 구매 갯수*/
SELECT AVG(amount) AS '평균 구매 갯수'
FROM buyTbl;

/*사용자별 평균 구매 갯수*/
SELECT userID AS '사용자 아이디', AVG(amount) AS '평균 구매 금액'
FROM buyTbl
GROUP BY userID
ORDER BY 2 DESC;


/*키가 큰놈 작은놈*/
SELECT name, height
FROM userTbl 
WHERE height = (SELECT MAX(height) FROM userTbl) OR height = (SELECT MIN(height) FROM userTbl); -- OR 할때 height 뺴먹지 말기 

/*전체 회원 수*/
SELECT COUNT(*)
FROM userTbl;
/*휴대폰 있는 사람*/
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자 수'
FROM userTbl;

/*직원수 조회 -> 다조회하는건 멍청한짓 ->COUNT를 쓰면 훨씬 빠르다*/

/*WHERE - GROUP BY - HAVING - ORDER BY */
/*사용자별 총 구매 액*/
SELECT userID AS '사용자', SUM(price*amount) AS '총 구매 액'
FROM buyTbl
GROUP BY userID;

/*천만원 이상 고객*/
/*WHERE 절에는 그룹핑과 관련된것은 사용 불가능!*/
SELECT userID AS '사용자', SUM(price*amount) AS '총 구매 액'
FROM buyTbl
GROUP BY userID
HAVING SUM(price*amount) > 1000
ORDER BY 2 DESC;

/* ROLLUP 소합계 소합계 소합계 합계*/
SELECT groupName, SUM(price * amount) AS '비용'
FROM buyTbl
GROUP BY groupName
WITH ROLLUP;






 