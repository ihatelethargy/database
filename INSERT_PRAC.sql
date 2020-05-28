USE sqlDB;
/*여러가지 입력법*/
CREATE TABLE testTbl2 (id int, userName char(3), age int);
INSERT INTO testTbl2 VALUES (1, '홍길동', 25);

INSERT INTO testTbl2(id, userName) VALUES (2,'설현');
INSERT INTO testTbl2(userName, age, id) VALUES('초아', 26, 3); 

/*AUTO INCREMENT*/
CREATE TABLE testTbl3
(
id int AUTO_INCREMENT PRIMARY KEY,
userName char(3),
age int);

INSERT INTO testTbl3 VALUES (NULL, '지민', 25); -- AUTO 자리에는 NULL 을 넣어주자.
INSERT INTO testTbl3 VALUES (NULL, '유나', 22);
INSERT INTO testTbl3 VALUES (NULL, '재경', 26);

SELECT *
FROM testTbl3;

SELECT last_insert_id();

/*AUTO 번호를 100번부터!*/
ALTER TABLE testtbl3 AUTO_INCREMENT = 100;
INSERT INTO testtbl3 VALUES (NULL, '연우', 24);

SELECT last_insert_id();
SELECT * 
FROM testTbl3;

/*데이터를 1000번부터 넣기 3번씩 건너 뛰면서 */
ALTER TABLE testTbl3 AUTO_INCREMENT = 1000;
SET @@auto_increment_increment=3; -- 3명씩 건너뛴다
INSERT INTO testTbl3 VALUES(NULL, '동구', 24);
INSERT INTO TESTTbl3 VALUES(NULL, '은하', 23);
SELECT * 
FROM testTbl3;

/*이미 DB가 있다면 삽입 가능하다! 하나씩 SELECT 할 필요 없다*/
USE sqlDB;

CREATE TABLE testTbl4(id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4
SELECT emp_no, first_name, last_name
FROM employees.employees;

CREATE TABLE testTbl5
(SELECT emp_no, first_name, last_name FROM employees.employees); -- 이렇게 하면 한번에 테이블 생성가능

USE sqlDB;
/*UPDATE 문*/
UPDATE testTbl4
SET Lname = '없음'
WHERE Fname = 'Kyichy'; -- 이렇게 하면 변경된다. 

/*DELETE 문*/
DELETE 
FROM testTbl4
WHERE Fname = 'Aamer'; -- 조건을 꼭 써줘야 합니다.


