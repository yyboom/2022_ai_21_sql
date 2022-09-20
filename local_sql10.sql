SELECT * FROM dept;
SELECT * FROM title;

INSERT INTO dept VALUES ('50', '연구소','제주');
INSERT INTO emp VALUES ('1011',NULL,NULL,'이수습',NULL,5000,CURDATE());

SELECT e. empname, d.deptname FROM emp e
LEFT OUTER JOIN dept d ON e. deptno = d.deptno -- OUTER은 조건에 무합하지 않아도 조회해주는 것!(방향을 써줘야함)
UNION -- RIGHT, LEFT OUTER한거를 합쳐라. 하지만 자주쓰는 문법은 아님
SELECT e. empname, d.deptname FROM emp e
RIGHT OUTER JOIN dept d ON e. deptno = d.deptno; -- OUTER은 조건에 무합하지 않아도 조회해주는 것!

SELECT * FROM emp e
CROSS JOIN dept d;

-- self join
SELECT e1.empname, e2.empname FROM emp e1
LEFT OUTER JOIN emp e2 ON e1.manager = e2.empno; -- 상사의 id와 그 상사의 필드와 맞을때 조회해줄 수 있는 것






