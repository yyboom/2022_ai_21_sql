SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM title;

-- 두개의 table을 합치는 것
SELECT e.empno, d.deptname, d. deptloc, e.empname FROM emp e
INNER JOIN dept d -- emp와 dept table에 조인을 걸겠다.
ON e.deptno = d.deptno; -- 어떤 data를 가지고 올지 조건을 반드시 써야함!(조건이 명확하게 일치하는 것들만!)
-- inner join은 on뒤에 조건이 정확하게 맞을 때 추출해냄!
-- WHERE d.deptloc = '서울'; -- 더 작은 조건을 걸어서 누군라르 찾음

-- 지역 별 연봉의 평균을 구하시오
SELECT d.deptloc, AVG(e.salary) AS avg FROM emp e
INNER JOIN dept d	
ON e.deptno = d.deptno
GROUP BY d.deptloc;

-- 대구 지역의 우러급, 평균보다 많이 받는 지역의 월급 평균을 구하시오.
SELECT d.deptloc, AVG(e.salary) AS avg FROM emp e
INNER JOIN dept d	
ON e.deptno = d.deptno
GROUP BY d.deptloc
HAVING avg > (SELECT AVG(e.salary) AS avg FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
-- GROUP BY d.deptloc = '대구'; 여기서는 굳이 grorp by를 쓸 필요 없음! group by를 쓰면 having절 쓸수 있음
WHERE d.deptloc = '대구');

-- 사원 정보를 조회 한다.
-- 이름, 부서명
SELECT e.empname, d.deptname FROM emp e
INNER JOIN dept d
ON e. deptno = d.deptno;

-- 이름, 부서명, 직급명(3개의 table을 가져와서 연결)
SELECT e.empname, d.deptname, t.titlename FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno; 




