-- DML
-- CRUD(INSERT,SELECT,UPDATE,DELETE)

-- DDL
DROP DATABASE IF EXISTS shopdb;
CREATE DATABASE shopdb;

-- DATA TYPE
-- 숫자(정수, 실수)
-- 문자(char,varchar)
-- DATA(년원ㅇ리, 년원일시분초)

USE shopdb;

DROP TABLE IF EXISTS cust; -- 삭제해라

-- JAVA랑 연동할 것
-- cust 고객정보
CREATE TABLE cust( -- 쇼핑몰에 들어가는 고객의 정보
	id VARCHAR(10), -- KEYWORD
    pwd VARCHAR(10) NOT NULL, -- 반드시 넣어야 하는 것들은 NOT NULL
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20),
    birth INT,
    rate FLOAT,
    addr CHAR(2), -- 주소
    rdate DATE NOT NULL,
    logintime DATETIME -- 회원가입할때는 필요없음
);

-- CUST TABLE에 제약조건을 걸어주겠다.
ALTER TABLE cust ADD CONSTRAINT PRIMARY KEY(id);
ALTER TABLE cust ADD CONSTRAINT UNIQUE(email); -- email이 같으면 안됨!
ALTER TABLE cust ADD CONSTRAINT CHECK (rate > 0.0 AND rate < 1.0);
ALTER TABLE cust ALTER COLUMN addr SET DEFAULT '서울'; -- default는 제약 조건이 아님!!!(NULL이면 자동으로 '서울'이 입력됨)

-- VALUES를 하면 모든 변수의 값을 다 넣어줘야 함.
-- 특정한 값들만 넣어주고 싶으면 VALUES앞에 ()안에다가 넣을 변수명을 적어줌!
INSERT INTO cust (id,pwd,name,email,birth,rate,rdate,logintime) VALUES('id01', 'pwd01', '이말숙', 'a@gamil.com', '19910102', 0.3, CURDATE(), NOW());
INSERT INTO cust VALUES('id02', 'pwd02', '홍말숙', 'b@gamil.com', '19920102', 0.3, '경기', CURDATE(), NOW());


-- item 상품정보
DROP TABLE IF EXISTS item;

CREATE TABLE item(
	id INT, -- 숫자가 자동으로 증가될 것
    cate VARCHAR(20)NOT NULL,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    img VARCHAR(20),
    rdate DATETIME
);

-- item table에 제약조건을 걸어주겠다.
ALTER TABLE item ADD CONSTRAINT PRIMARY KEY(id);
ALTER TABLE item MODIFY id INT AUTO_INCREMENT; -- 제약이 아닌 수정 숫자가 자동으로 올라가게끔!(이때 PRIMARY KEY를 지정해준 후 해야함!)
ALTER TABLE item AUTO_INCREMENT = 1000; -- 1000부터!올라가라
ALTER TABLE item ADD CONSTRAINT UNIQUE (name);
ALTER TABLE item ADD CONSTRAINT CHECK (price > 0);

-- ITEM에 상품 정보 넣기
INSERT INTO item VALUES (NULL, '바지', '청바지', 10000, 'P1.JPG', NOW());
INSERT INTO item VALUES (NULL, '바지', '반바지', 20000, 'P2.JPG', NOW());
INSERT INTO item VALUES (NULL, '상의', '반팔', 30000, 'P3.JPG', NOW());
INSERT INTO item VALUES (NULL, '상의', '긴팔', 40000, 'P4.JPG', NOW());


DESC cust;
SELECT * FROM cust;

DESC item;
SELECT * FROM item;
