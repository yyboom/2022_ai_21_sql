-- table 생성시에 사용하는 것이라 DDL임
CREATE TABLE temp 
-- table 생성시에 타입 결정을 사용함 
  (id INT,
  name VARCHAR(3),
  no CHAR(5),
  rate FLOAT,
  regdate DATE,
  hdate DATETIME
);

DESC temp;
SELECT * FROM temp;

INSERT INTO temp VALUES (10,'JML','조윤영', 3.4, CURDATE(), SYSDATE());
INSERT INTO temp VALUES (10,'조윤영','111', 3.4, CURDATE(), SYSDATE()); -- character은 자리를 지정해주면 그것만 나옴! 
																		-- =>자리수가 남으면 공백으로 나옴
INSERT INTO temp VALUES (10,'조윤','22', 3.4, CURDATE(), SYSDATE());
INSERT INTO temp VALUES (10,'조윤','22', 3.4, '2020-08-29', SYSDATE());
-- INSERT INTO temp VALUES (10,'조윤','22', 3.4, '08-29-2020', '2020-08-30 10:11:35'); 이러면 안나옴!
INSERT INTO temp VALUES (10,'황말숙','22', 3.4, '2020-08-29', SYSDATE());

-- 날짜를 이런식으로 가져올 수 있음
SELECT name,DATE_FORMAT(regdate, '%Y-%m-%d'), DATE_FORMAT(hdate, '%r')
FROM temp;

SELECT id,CONCAT(name,'-',no),regdate FROM temp; -- 두개를 한꺼번에 가져오는게 concat임!

SELECT name, CHAR_LENGTH(name), LENGTH(name) FROM temp; -- 자바에서는 한글 하나를 2byte로 처리함
														-- mysql에서는 문자 하나를 3byte로 처리하게됨
-- 회원 이름이 2글자인 회원을 조회 하시오
SELECT * FROM temp
WHERE CHAR_LENGTH(name) = 2;

SELECT CONCAT_WS('-',id,name,no) FROM temp;

SELECT FORMAT(rate,4) FROM temp;

SELECT BIN(id),HEX(id),OCT(id) FROM temp;

SELECT INSERT(name,2,3,'*') FROM temp; -- 2열부터 3개

SELECT no FROM temp;

SELECT regdate, 
ADDDATE(regdate, INTERVAL 31 DAY),-- 31일 더하고
SUBDATE(regdate, INTERVAL 31 DAY) -- 31일 빼고
FROM temp;

SELECT regdate, (CURDATE() - regdate) / 24 
FROM temp; -- 현재를 기준으로 입사한 시간을 구해라

SELECT regdate, DATEDIFF(CURDATE() ,regdate) , TIMEDIFF(NOW(), hdate)
FROM temp;

SELECT regdate, PERIOD_ADD(DATE_FORMAT(regdate, '%Y%m'),12) 
FROM temp;

-- emp 테이블에서 오늘을 기준으로 입사 한지 몇개월이 지났는지 조회 하시오
SELECT hdate,
PERIOD_DIFF(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(hdate, '%Y%m')) AS m,
DATEDIFF(CURDATE(),hdate) AS d
FROM emp
WHERE PERIOD_DIFF(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(hdate, '%Y%m')) > 280;

SELECT VERSION();
SELECT * FROM dept;

-- JASON 형태로 끄집어낼 수 있다.
SELECT JSON_OBJECT('deptno', deptno, 'deptname', deptname) FROM dept;
SELECT JSON_ARRAY('deptno', deptno, 'deptname', deptname) FROM dept;

