DROP DATABASE IF EXISTS clothshop;

CREATE DATABASE clothshop;
USE clothshop;

-- ---------고객 테이블---------------
DROP TABLE IF EXISTS cust;
CREATE TABLE cust(
userid VARCHAR(30),
pwd INT NOT NULL,
username VARCHAR(10) NOT NULL,
addr VARCHAR(30) NOT NULL,
rdate DATE NOT NULL,
mobile VARCHAR(20) NOT NULL,
email VARCHAR(20)
);

ALTER TABLE cust ADD CONSTRAINT PRIMARY KEY (userid);
ALTER TABLE cust ADD CONSTRAINT UNIQUE(email);

SELECT * FROM cust;
DESC cust;

-- 고객 --
INSERT INTO cust VALUES('id01',1111,'송강호','서울', '2022-07-25','010-1234-5678','abc@gmail.com');
INSERT INTO cust VALUES('id02',2222,'이병헌','인천','2022-06-15','010-3333-4444','great@gmail.com');
INSERT INTO cust VALUES('id03',3333,'김남길','경기','2022-07-12','010-5555-7777','voice@gmail.com');
INSERT INTO cust VALUES('id04',4444,'전도연','부산','2022-05-15','010-8888-3333','name@gmail.com');
INSERT INTO cust VALUES('id05',5678,'신하균','인천', '2021-10-25','010-4484-2332','eye@gnaver.com');
INSERT INTO cust VALUES('id06',7644,'공유','수원', '2013-01-15','010-3679-2134','busan@hanmail.net');
INSERT INTO cust VALUES('id07',2345,'하정우','광교', '2011-04-07','010-0392-1484','trace4885@naver.com');
INSERT INTO cust VALUES('id08',7686,'윤계상','수원', '2008-9-14','010-1230-8574','youalone@naver.com');
INSERT INTO cust VALUES('id09',9855,'마동석','인천', '2013-06-25','010-2030-2028','punch@naver.com');
INSERT INTO cust VALUES('id10',2354,'이연희','경기', '2020-8-15','010-5016-5573','soso@gmail.com');
INSERT INTO cust VALUES('id11',7698,'한효주','제주', '2017-03-01','010-3092-1042','change@naver.com');
INSERT INTO cust VALUES('id12',9645,'이다혜','부산', '2013-11-25','010-1924-6855','sky102@gmail.com');
INSERT INTO cust VALUES('id13',1029,'한예슬','전주', '2009-05-05','010-4829-1039','bigeye@gmail.com');

-- 주문 테이블 ----------------------------------------

DROP TABLE IF EXISTS orederpage;
CREATE TABLE orderpage(
orderid INT,
userid VARCHAR(30) NOT NULL,
orderprice INT NOT NULL,
pay VARCHAR(20) NOT NULL,
bdate DATE NOT NULL,
orderaddr VARCHAR(20) NOT NULL,
totalcnt INT NOT NULL,
phonenum VARCHAR(20) NOT NULL,
people VARCHAR(20) NOT NULL
);

ALTER TABLE orderpage ADD PRIMARY KEY (orderid);
ALTER TABLE orderpage MODIFY orderid INT AUTO_INCREMENT;
ALTER TABLE orderpage AUTO_INCREMENT = 1000;
ALTER TABLE orderpage ADD FOREIGN KEY (userid) REFERENCES cust(userid);
ALTER TABLE orderpage ADD CONSTRAINT CHECK (totalcnt>0);

SELECT* FROM orderpage;
DESC orderpage;

-- 주문 --

INSERT INTO orderpage VALUES(NULL,'id01',220000,'카드', '2022-09-01', '서울', 8, '010-1234-5678','송강호' );
INSERT INTO orderpage VALUES(NULL,'id02',400000,'카드', '2022-08-21', '서울', 8, '010-3233-3333','이민정' );
INSERT INTO orderpage VALUES(NULL,'id03',340000,'카드', '2022-06-29', '부산', 7, '010-1934-5642','진선규' );
INSERT INTO orderpage VALUES(NULL,'id04',370000,'카드', '2022-08-17', '제주', 9, '010-2252-3253','성시경' );
INSERT INTO orderpage VALUES(NULL,'id07',10000,'무통장입금', '2022-08-04', '부산', 2, '010-0392-1484','하정우' );
INSERT INTO orderpage VALUES(NULL,'id11',60000,'계좌이체', '2022-08-04', '인천', 1, '010-3092-1042','한효주' );
INSERT INTO orderpage VALUES(NULL,'id12',30000,'계좌이체', '2022-08-29', '전주', 1, '010-1924-6855','이다혜' );
INSERT INTO orderpage VALUES(NULL,'id05',10000,'카드', '2022-08-21', '광주', 2, '010-4484-2332','신하균');
INSERT INTO orderpage VALUES(NULL,'id13',80000,'무통장입금', '2022-08-24', '강원', 2, '010-4829-1039','한예슬' );
INSERT INTO orderpage VALUES(NULL,'id02',150000,'계좌이체', '2022-03-17', '인천', 3, '010-3333-4444','이병헌' );

-- 배송 테이블 -----------------------------------------------------

DROP TABLE IF EXISTS shipping;

CREATE TABLE shipping(
shipid INT,
orderid INT NOT NULL,
stats VARCHAR(20) NOT NULL,
shipdate DATE NOT NULL
);

ALTER TABLE shipping ADD CONSTRAINT PRIMARY KEY (shipid);
ALTER TABLE shipping MODIFY shipid INT AUTO_INCREMENT;
ALTER TABLE shipping AUTO_INCREMENT = 1200;
ALTER TABLE shipping ADD FOREIGN KEY (orderid) REFERENCES orderpage(orderid);

SELECT * FROM shipping;
DESC shipping;

-- 배송 --

INSERT INTO shipping VALUES(NULL, 1000, '배송진행중', '2022-09-04');
INSERT INTO shipping VALUES(NULL, 1001, '집화처리중','2022-09-06');
INSERT INTO shipping VALUES(NULL, 1002, '수하물도착', '2022-09-08');
INSERT INTO shipping VALUES(NULL, 1003, '금일수령가능', '2022-09-02');
INSERT INTO shipping VALUES(NULL, 1004, '화물지도착', '2022-09-10');
INSERT INTO shipping VALUES(NULL, 1005, '배송완료','2022-09-06');
INSERT INTO shipping VALUES(NULL, 1006, '배송완료','2022-08-06');
INSERT INTO shipping VALUES(NULL, 1007, '배송완료','2022-08-10');
INSERT INTO shipping VALUES(NULL, 1008, '배송진행중','2022-09-02');
INSERT INTO shipping VALUES(NULL, 1009, '배송완료','2022-08-29');

-- --카테 테이블
DROP TABLE IF EXISTS cate;

CREATE TABLE cate(
cateid INT,
topid INT,
catename VARCHAR(10)
);
ALTER TABLE cate ADD CONSTRAINT PRIMARY KEY (cateid);
ALTER TABLE cate ADD CONSTRAINT FOREIGN KEY (topid) REFERENCES cate(cateid);
ALTER TABLE cate ADD CONSTRAINT UNIQUE(catename); -- 카테고리 명은 동일하면 안됨

SELECT * FROM cate;
DESC cate;

-- 카테
INSERT INTO cate VALUES (10,NULL, '상의');
INSERT INTO cate VALUES (20,NULL, '하의');
INSERT INTO cate VALUES (30,NULL, '아우터');
INSERT INTO cate VALUES (40,NULL, '신발');
INSERT INTO cate VALUES (50,NULL, '악세사리');


-- ---아이템 테이블
DROP TABLE IF EXISTS item;

CREATE TABLE item(
itemid INT,
cateid INT,
itemname VARCHAR(20) NOT NULL,
itemprice INT NOT NULL,
size INT,
color VARCHAR(20) NOT NULL,
itemstatus VARCHAR(20) NOT NULL
);
ALTER TABLE item ADD CONSTRAINT PRIMARY KEY(itemid);
ALTER TABLE item ADD CONSTRAINT FOREIGN KEY (cateid) REFERENCES cate(cateid);
ALTER TABLE item MODIFY itemid INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 1000;
ALTER TABLE item ADD CONSTRAINT UNIQUE (itemname);

SELECT * FROM item;
DESC item;

-- 아이템
INSERT INTO item VALUES (NULL, '10', '셔츠', '40000', '100', '스카이블루','주문가능');
INSERT INTO item VALUES (NULL, '10', '반팔티셔츠', '10000', '85', '블루','주문가능');
INSERT INTO item VALUES (NULL, '10', '니트', '80000', '100', '퍼플','주문가능');
INSERT INTO item VALUES (NULL, '20', '스커트', '20000', '90', '아이보리', '주문가능');
INSERT INTO item VALUES (NULL, '20', '슬랙스', '30000', '95','베이지', '주문 불가');
INSERT INTO item VALUES (NULL, '30', '패딩', '60000', '105', '블랙','주문가능');
INSERT INTO item VALUES (NULL, '40', '운동화', '50000', '270', '블랙','주문가능');
INSERT INTO item VALUES (NULL, '40', '구두', '60000', '235', '그레이','주문불가');
INSERT INTO item VALUES (NULL, '40', '로퍼', '70000', '250', '브라운','주문가능');
INSERT INTO item (itemid, cateid, itemname, itemprice, color, itemstatus)VALUES (NULL, '50', '양말', '3000', '옐로우','주문불가');
INSERT INTO item (itemid, cateid, itemname, itemprice, color, itemstatus)VALUES (NULL, '50', '가방', '30000', '블랙','주문가능');
INSERT INTO item (itemid, cateid, itemname, itemprice, color, itemstatus)VALUES (NULL, '50', '귀걸이', '25000', '실버','주문가능');
INSERT INTO item (itemid, cateid, itemname, itemprice, color, itemstatus)VALUES (NULL, '50', '피어싱', '15000', '골드','주문불가');

-- finalorder(주문상세)--------------------------------------------------------------------------
DROP TABLE IF EXISTS finalorder;

CREATE TABLE finalorder(
finalid INT,
orderid INT NOT NULL,
itemid INT NOT NULL,
totalcnt INT NOT NULL,
totalprice INT NOT NULL
);

ALTER TABLE finalorder ADD CONSTRAINT PRIMARY KEY(finalid);
ALTER TABLE finalorder MODIFY finalid INT AUTO_INCREMENT;
ALTER TABLE finalorder AUTO_INCREMENT = 3000;
ALTER TABLE finalorder ADD CONSTRAINT FOREIGN KEY(orderid) REFERENCES orderpage(orderid);
ALTER TABLE finalorder ADD CONSTRAINT FOREIGN KEY(itemid) REFERENCES item(itemid);
ALTER TABLE finalorder ADD CONSTRAINT CHECK (totalcnt>0);
ALTER TABLE finalorder ADD CONSTRAINT CHECK (totalprice>0);

SELECT * FROM finalorder;
DESC finalorder;

-- finalorder insert문(주문상세)
INSERT INTO finalorder VALUES (NULL, '1000', '1000', 3, 120000);
INSERT INTO finalorder VALUES (NULL, '1000', '1003', 5, 100000);

INSERT INTO finalorder VALUES (NULL, '1001', '1002', 4, 320000);
INSERT INTO finalorder VALUES (NULL, '1001', '1003', 4, 80000);

INSERT INTO finalorder VALUES (NULL, '1002', '1000', 1, 40000);
INSERT INTO finalorder VALUES (NULL, '1002', '1006', 6, 300000);

INSERT INTO finalorder VALUES (NULL, '1003', '1002', 1, 80000);
INSERT INTO finalorder VALUES (NULL, '1003', '1008', 2, 140000);
INSERT INTO finalorder VALUES (NULL, '1003', '1011', 6, 150000);

INSERT INTO finalorder VALUES (NULL, '1004', '1001', 2, 10000);
INSERT INTO finalorder VALUES (NULL, '1005', '1005', 1, 60000);
INSERT INTO finalorder VALUES (NULL, '1006', '1010', 1, 30000);
INSERT INTO finalorder VALUES (NULL, '1007', '1001', 2, 10000);

INSERT INTO finalorder VALUES (NULL, '1008', '1005', 1, 60000);
INSERT INTO finalorder VALUES (NULL, '1008', '1003', 1, 20000);

INSERT INTO finalorder VALUES (NULL, '1009', '1000', 2, 80000);
INSERT INTO finalorder VALUES (NULL, '1009', '1008', 1, 70000);



-- cart(장바구니) ---------------------------------------------------------------------------
DROP TABLE IF EXISTS cart;

CREATE TABLE cart(
cartid INT,
userid VARCHAR(30) NOT NULL,
itemid INT NOT NULL,
amount INT NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT PRIMARY KEY(cartid);
ALTER TABLE cart MODIFY cartid INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT = 4000;
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY(userid) REFERENCES cust(userid);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY(itemid) REFERENCES item(itemid);
ALTER TABLE cart ADD CONSTRAINT CHECK (amount>0);

SELECT * FROM cart;
DESC cart;

-- cart insert문(장바구니)
INSERT INTO cart VALUES (NULL, 'id01', '1000', 3);
INSERT INTO cart VALUES (NULL, 'id01', '1001', 1);
INSERT INTO cart VALUES (NULL, 'id02', '1001', 2);
INSERT INTO cart VALUES (NULL, 'id03', '1002', 4);
INSERT INTO cart VALUES (NULL, 'id04', '1003', 6);


-- 리뷰테이블 ------------------------------------

DROP TABLE IF EXISTS review;

CREATE TABLE review(
reviewid INT ,
itemid INT NOT NULL,
userid VARCHAR(30) NOT NULL,
rating INT,
content VARCHAR(30)
);
ALTER TABLE review ADD CONSTRAINT PRIMARY KEY (reviewid);
ALTER TABLE review MODIFY reviewid INT AUTO_INCREMENT;
ALTER TABLE review AUTO_INCREMENT =100;
ALTER TABLE review ADD CONSTRAINT FOREIGN KEY(itemid) REFERENCES item(itemid);
ALTER TABLE review ADD CONSTRAINT FOREIGN KEY(userid) REFERENCES cust(userid);

SELECT* FROM review;
DESC review;

-- review
INSERT INTO review VALUES (NULL, 1000, 'id01', 5, '배송 빨리 와서 좋아요');
INSERT INTO review VALUES (NULL, 1001, 'id02', 1, '사진 색이랑 달라요');
INSERT INTO review VALUES (NULL, 1002, 'id03', 4, '입고 다닐 만 해요');
INSERT INTO review VALUES (NULL, 1003, 'id04', 2, '길이가 너무 길어요');
INSERT INTO review VALUES (NULL, 1004, 'id05', 5, '사이즈가 잘 맞아요');
INSERT INTO review VALUES (NULL, 1005, 'id06', 1, '배송이 너무 늦어요');
INSERT INTO review VALUES (NULL, 1006, 'id07', 4, '사진이랑 똑같아요');
INSERT INTO review VALUES (NULL, 1007, 'id08', 2, '옷이 잘 늘어나요');
INSERT INTO review VALUES (NULL, 1008, 'id09', 5, '교환 배송이 빨라요');
INSERT INTO review VALUES (NULL, 1009, 'id10', 1, '세탁하면 물 빠져요');
INSERT INTO review VALUES (NULL, 1000, 'id10', 1, '사이즈 잘못 배송 왔어요');
INSERT INTO review VALUES (NULL, 1001, 'id09', 4, '싸게 잘 샀어요');
INSERT INTO review VALUES (NULL, 1002, 'id08', 2, '사이즈가 생각보다 작아요');
INSERT INTO review VALUES (NULL, 1003, 'id07', 5, '할인 많이 해서 좋아요');
INSERT INTO review VALUES (NULL, 1004, 'id06', 1, '옷감이 달라요');
INSERT INTO review VALUES (NULL, 1005, 'id05', 4, '감사해요');
INSERT INTO review VALUES (NULL, 1006, 'id04', 2, '판매자랑 연락이 안돼요');

-- 관심물품 테이블-------------------------------

DROP TABLE IF EXISTS interestitem;

CREATE TABLE interestitem(
interestid INT ,
itemid INT NOT NULL,
userid VARCHAR(30) NOT NULL
);
ALTER TABLE interestitem ADD CONSTRAINT PRIMARY KEY (interestid);
ALTER TABLE interestitem MODIFY interestid INT AUTO_INCREMENT;
ALTER TABLE interestitem AUTO_INCREMENT =200;
ALTER TABLE interestitem ADD CONSTRAINT FOREIGN KEY(itemid) REFERENCES item(itemid);
ALTER TABLE interestitem ADD CONSTRAINT FOREIGN KEY(userid) REFERENCES cust(userid);

SELECT* FROM interestitem;
DESC interestitem;

-- 관심 물품 테이블 insert-------------------------------

INSERT INTO interestitem VALUES (NULL, 1000, 'id01');
INSERT INTO interestitem VALUES (NULL, 1001, 'id02');
INSERT INTO interestitem VALUES (NULL, 1002, 'id03');
INSERT INTO interestitem VALUES (NULL, 1003, 'id04');
INSERT INTO interestitem VALUES (NULL, 1004, 'id05');
INSERT INTO interestitem VALUES (NULL, 1005, 'id06');
INSERT INTO interestitem VALUES (NULL, 1006, 'id07');
INSERT INTO interestitem VALUES (NULL, 1007, 'id08');
INSERT INTO interestitem VALUES (NULL, 1008, 'id09');
INSERT INTO interestitem VALUES (NULL, 1009, 'id10');
INSERT INTO interestitem VALUES (NULL, 1000, 'id10');
INSERT INTO interestitem VALUES (NULL, 1001, 'id09');
INSERT INTO interestitem VALUES (NULL, 1002, 'id08');
INSERT INTO interestitem VALUES (NULL, 1003, 'id07');
INSERT INTO interestitem VALUES (NULL, 1004, 'id06');
INSERT INTO interestitem VALUES (NULL, 1005, 'id05');
INSERT INTO interestitem VALUES (NULL, 1006, 'id04');

-- 주소가 인천인 사람들의 구매목록을 조회하시오.(고객 아이디, 고객 이름, 고객 주소, 상품 번호, 상품 이름)

-- 아우터 카테고리의 물품들을 구매한 고객을 조회하시오(카테 아이디, 상품 아이디, 상품 이름, 구매고객 아이디, 구매고객 이름)