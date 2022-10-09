-- DML
-- CRUD(INSERT, SELECT, UPDATE, DELETE)

-- DDL
DROP DATABASE IF EXISTS shopdb;
CREATE DATABASE shopdb;

-- DATA TYPE
-- 숫자(정수, 실수)
-- 문자(char, varchar)
-- DATA(년월일,년월일시분초) 

USE shopdb;

DROP TABLE IF EXISTS adm;
-- 관리자 명을 넣는 table
CREATE TABLE adm(
	id VARCHAR(10),
    pwd VARCHAR(10) NOT NULL,
    -- 관리자의 레벨
    lev int NOT NULL
);
ALTER TABLE adm ADD CONSTRAINT PRIMARY KEY(id);
INSERT INTO adm VALUES ('admin01','pwd01',1);
INSERT INTO adm VALUES ('admin02','pwd02',2);
INSERT INTO adm VALUES ('admin03','pwd03',3);

SELECT * FROM adm;

DROP TABLE IF EXISTS cust;

CREATE TABLE cust(
	id VARCHAR(10),
    pwd VARCHAR(10) NOT NULL,
    name VARCHAR(20) NOT NULL
);
ALTER TABLE cust ADD CONSTRAINT PRIMARY KEY(id);

INSERT INTO cust VALUES ('id01','pwd01','홍말숙');
INSERT INTO cust VALUES ('id02','pwd02','이말숙');
INSERT INTO cust VALUES ('id03','pwd03','정말숙');

SELECT * FROM cust;

-- item table
DROP TABLE IF EXISTS item;

CREATE TABLE item(
   id INT,
   name VARCHAR(20) NOT NULL,
   price INT NOT NULL,
   imgname VARCHAR(30),
   rdate DATETIME 
);
ALTER TABLE item ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE item MODIFY id INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 100;
ALTER TABLE item ADD CONSTRAINT CHECK (price > 0);

DESC item;

INSERT INTO item VALUES (NULL,'청바지',10000,'a.jpg',SYSDATE());
INSERT INTO item VALUES (NULL,'반바지',20000,'b.jpg',SYSDATE());
INSERT INTO item VALUES (NULL,'반팔',30000,'c.jpg',SYSDATE());
INSERT INTO item VALUES (NULL,'긴팔',40000,'d.jpg',SYSDATE());

SELECT * FROM item;

-- cart table
DROP TABLE IF EXISTS cart;

CREATE TABLE cart(
	id INT,
    user_id VARCHAR(10),
    item_id INT,
    cnt INT,
    rdate DATE
);
ALTER TABLE cart ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE cart MODIFY id INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT=100;
-- ALTER TABLE cart ADD FOREIGN KEY (user_id) REFERENCES cust (id);
-- ALTER TABLE cart ADD FOREIGN KEY (item_id) REFERENCES item (id);

INSERT INTO cart VALUES (NULL,'id01',100,2,SYSDATE());
INSERT INTO cart VALUES (NULL,'id02',102,3,SYSDATE());
INSERT INTO cart VALUES (NULL,'id02',103,1,SYSDATE());
INSERT INTO cart VALUES (NULL,'id03',101,5,SYSDATE());

DESC cart;
SELECT * FROM cart;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales(
	rdate DATE,
    price INT,
    gender CHAR(1)
);

INSERT sales VALUES ('2020-01-02',100000,'M');
INSERT sales VALUES ('2020-01-02',200000,'F');
INSERT sales VALUES ('2020-02-02',300000,'M');
INSERT sales VALUES ('2020-02-02',550000,'F');
INSERT sales VALUES ('2020-03-02',560000,'M');
INSERT sales VALUES ('2020-03-02',700000,'F');
INSERT sales VALUES ('2020-04-02',450000,'M');
INSERT sales VALUES ('2020-04-02',800000,'F');
INSERT sales VALUES ('2020-05-02',750000,'M');
INSERT sales VALUES ('2020-05-02',330000,'F');
INSERT sales VALUES ('2020-06-02',910000,'M');
INSERT sales VALUES ('2020-06-02',920000,'F');
INSERT sales VALUES ('2020-07-02',660000,'M');
INSERT sales VALUES ('2020-07-02',550000,'F');
INSERT sales VALUES ('2020-08-02',430000,'M');
INSERT sales VALUES ('2020-08-02',560000,'F');


DESC sales;
SELECT * FROM sales;

-- 월별 매출
SELECT DATE_FORMAT(rdate,'%m') AS month, SUM(price) AS total_price FROM sales
GROUP BY month;

-- 월별 성별 매출
SELECT DATE_FORMAT(rdate,'%m') AS month, gender, price FROM sales
GROUP BY month, gender;

-- 1월부터 8월까지 성별 매출
SELECT gender,sum(price) AS total_price FROM sales
WHERE MONTH(rdate) BETWEEN 1 AND 8
GROUP BY gender;

DROP TABLE IF EXISTS marker;
CREATE TABLE marker(
	id INT,
    title VARCHAR(30),
    target VARCHAR(30),
    lat FLOAT,
    lng FLOAT,
    img VARCHAR(30),
    loc CHAR(1)
);

ALTER TABLE marker ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE marker MODIFY id INT AUTO_INCREMENT;
ALTER TABLE marker AUTO_INCREMENT=100;

INSERT INTO marker VALUES (NULL,'국밥집','http://www.naver.com',33.450901,126.570267,'mk1.png','j');
INSERT INTO marker VALUES (NULL,'짬뽕집','http://www.daum.net',33.460901,126.580267,'mk2.png','j');
INSERT INTO marker VALUES (NULL,'닭발집','http://www.google.com',33.440901,126.573267,'mk3.png','j');

INSERT INTO marker VALUES (NULL,'국밥집','http://www.naver.com',37.5286891, 127.061432,'mk1.png','s');
INSERT INTO marker VALUES (NULL,'짬뽕집','http://www.daum.net',37.5386891,127.021432,'mk2.png','s');
INSERT INTO marker VALUES (NULL,'닭발집','http://www.google.com',37.51868911,127.031432,'mk3.png','s');

INSERT INTO marker VALUES (NULL,'국밥집','http://www.naver.com',35.1223984,126.570267,'mk1.png','b');
INSERT INTO marker VALUES (NULL,'짬뽕집','http://www.daum.net',35.1113984,129.0996448,'mk2.png','b');
INSERT INTO marker VALUES (NULL,'닭발집','http://www.google.com',33.5199183,126.6142571,'mk3.png','b');

DESC marker;
SELECT * FROM marker;