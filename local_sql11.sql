DESC emp;
SELECT * FROM emp;
DESC dept;
SELECT * FROM dept;
DESC title;
SELECT * FROM title;

-- 1. 오늘 날짜 기준으로 입사 일부터 며칠이 지났고 몇달이 지났는지 출력 하시오
SELECT DATEDIFF(DATE_FORMAT(curdate(),'%Y%m%d'), DATE_FORMAT(hdate, '%Y%m%d')) AS datediff,
PERIOD_DIFF(DATE_FORMAT(curdate(),'%Y%m'), DATE_FORMAT(hdate, '%Y%m')) AS monthdiff
FROM emp;

-- 2. 직원들 연봉이 4000이상이면 high, 2500 이상이면 middle, 2500이하면 low 출력
SELECT salary,
(CASE 
WHEN salary>=4000 THEN 'high'
WHEN salary>=2500 THEN 'middle'
ELSE 'low'
END) AS grade
FROM emp;

-- 3. 부서 별 연봉 평균의 합을 구하시오
SELECT deptno, AVG(salary) From emp
GROUP BY deptno;

-- 4. 부서 별 입사일 평균을 구하시오
SELECT deptno, AVG(DATEDIFF(DATE_FORMAT(curdate(),'%Y%m%d'), DATE_FORMAT(hdate, '%Y%m%d'))) FROM emp
GROUP BY deptno;

-- 5. 이말숙 직원과 같은 해에 입사는 직원을 조회 하시오
SELECT empname, hdate FROM emp
WHERE year(hdate)=year((SELECT hdate FROM emp WHERE empname='이말숙')); 

-- 6. 부서별 최고 임금을 받는 직원의 평균을 구하고 그 평균 보다 많이 받는 직원을 조회 하시오 
SELECT * FROM emp
WHERE salary > (SELECT AVG(max) 
FROM (SELECT MAX(salary) AS max FROM emp
GROUP BY deptno) emp);

-- 7. 직원정보를 출력 한다. 직원의 연봉 정보와 연봉의 세금 정보를 같이 출력 한다. 세금은 10%
SELECT empname, salary, (salary * 90 / 100) As tex From emp;

-- 8. 직원정보 중 2001 이전에 입사 하였고 월급이 4000만원 미만인 직원을 조회
SELECT * FROM emp
WHERE 
-- 9. manager가 있는 직원 중 이름에 '자' 가 들어가 있는 직원정보 조회
-- 10. 월급이 2000미만은 '하' 4000미만은 '중' 4000이상은 '고' 를 출력
SELECT salary,
(CASE 
WHEN salary<2000 THEN '하'
WHEN salary<4000 THEN '중'
ELSE '고'
END) AS grade
FROM emp;