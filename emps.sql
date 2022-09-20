-- 2022.08.25 yycho
-- emplyee management database

DROP DATABASE IF EXISTS emps;
CREATE DATABASE IF NOT EXISTS emps;
USE emps;

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS title;
CREATE TABLE dept(
deptno CHAR(2) PRIMARY KEY,
deptname VARCHAR(20),
deptloc VARCHAR(20) 
);
CREATE TABLE title(
titleno CHAR(2) PRIMARY KEY,
titlename VARCHAR(20) 
);
CREATE TABLE emp(
empno CHAR(4) PRIMARY KEY,
titleno CHAR(2), 
deptno CHAR(2),
empname VARCHAR(10),
manager CHAR(4),
salary INT(5),
hdate DATE
);
INSERT INTO emp VALUES ('1001','40','10', 'ŷ',NULL, 5000,'1997-01-01' );
INSERT INTO emp VALUES ('1002','30','20', '�̿���','1001', 4300,'1998-01-01' );
INSERT INTO emp VALUES ('1003','30','30', '�����','1001', 4800,'1999-01-01' );
INSERT INTO emp VALUES ('1004','30','40', 'ȫ����','1001', 4500,'1999-12-01' );
INSERT INTO emp VALUES ('1005','20','20', '�̸���','1002', 3300,'2000-01-01' );
INSERT INTO emp VALUES ('1006','10','20', '�踻��','1002', 2800,'2001-01-01' );
INSERT INTO emp VALUES ('1007','20','30', 'ȫ����','1003', 3500,'2000-12-01' );
INSERT INTO emp VALUES ('1008','10','30', '�̿���','1003', 2300,'2002-05-01' );
INSERT INTO emp VALUES ('1009','20','40', '�谭��','1004', 3800,'2001-01-01' );
INSERT INTO emp VALUES ('1010','10','40', 'ȫ����','1004', 2500,'2002-12-01' );
INSERT INTO dept VALUES ('10', '������', '����');
INSERT INTO dept VALUES ('20', '�����', '�λ�');
INSERT INTO dept VALUES ('30', '������', '�뱸');
INSERT INTO dept VALUES ('40', '�����', '����');
INSERT INTO title VALUES ('40','��ǥ');
INSERT INTO title VALUES ('30','����');
INSERT INTO title VALUES ('20','�븮');
INSERT INTO title VALUES ('10','���');