SELECT * FROM dept;
DESC dept;

INSERT INTO dept VALUES ('60','영업 1부','광주'); -- primary key 는 수정 불가. 즉 맨앞의 것 수정 불가, 뒤에 두개 수정 가능
iNSERT INTO dept (deptno ,  deptname) VALUES ('70','마게팅');

UPDATE dept SET deptname = '영업2부' , deptloc = '강원' -- 이러면 모든 데이터가 다 바뀌게 된다.
WHERE deptno = '60'; -- 반드시 WHERE절로 조건을 주어야 함!!(KEY VALUE값을)

-- 삭제
DELETE FROM dept -- where문 전에 ;써주면 안됨!
WHERE deptno = '50';