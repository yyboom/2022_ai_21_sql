DROP DATABASE IF EXISTS furnishop;
CREATE DATABASE furnishop;

USE furnishop;

-- cust table ------------------------------------------------------------------
DROP TABLE IF EXISTS cust;

CREATE TABLE cust(
	custid VARCHAR(10),
    custpwd VARCHAR(10) NOT NULL,
    custname VARCHAR(20) NOT NULL,
    custaddr VARCHAR(20),
    custtel VARCHAR(20),
    custemail VARCHAR(20),
    custdate DATE,
    withdraw VARCHAR(1),
    custbirth INT
);
ALTER TABLE cust ADD CONSTRAINT PRIMARY KEY(custid);

INSERT INTO cust VALUES ('id01','pwd01','홍말숙','서울특별시 마포구', '010-1234-1234','ghdakftnr@naver.com', SYSDATE(),'x',19800225);
INSERT INTO cust VALUES ('id02','pwd02','이말숙','서울특별시 영등포구', '010-5236-3847','dlakftnr@naver.com', SYSDATE(),'x',19730123);
INSERT INTO cust VALUES ('id03','pwd03','정말숙','경기도 성남시', '010-2323-3294','wjdakftnr@naver.com', SYSDATE(),'x',19830629);
INSERT INTO cust VALUES ('id04','pwd04','고말숙','전라남도 광양시', '010-4752-2501','rhakftnr@naver.com', SYSDATE(),'x',19890812);
INSERT INTO cust VALUES ('id05','pwd05','김말숙','충청남도 천안시', '010-5865-3847','rlaakftnr@naver.com', SYSDATE(),'o',19650305);
INSERT INTO cust VALUES ('id06','pwd06','조말숙','경기도 수원시', '010-8278-9594','whakftnr@naver.com', SYSDATE(),'x',20010325);
INSERT INTO cust VALUES ('id07','pwd07','하말숙','경기도 용인시', '010-7854-9392','gkakftnr@naver.com', SYSDATE(),'o',200401211);
INSERT INTO cust VALUES ('id08','pwd08','유말숙','강원도 평창시', '010-1132-6505','dbakftnr@naver.com', SYSDATE(),'x',19901117);
INSERT INTO cust VALUES ('id09','pwd09','신말숙','서울특별시 강남구', '010-3727-2749','tlsakftnr@naver.com', SYSDATE(),'x',19991226);
INSERT INTO cust VALUES ('id10','pwd10','정말숙','강원도 춘천시', '010-6859-2094','wjdakftnr@naver.com', SYSDATE(),'o',19930414);

DESC cust;
SELECT * FROM cust;

-- cate table ------------------------------------------------------------------
DROP TABLE IF EXISTS cate;
CREATE TABLE cate(
	cateno INT,
	catename VARCHAR(20) NOT NULL
);
ALTER TABLE cate ADD CONSTRAINT PRIMARY KEY(cateno);

INSERT INTO cate VALUES(1, '침실');
INSERT INTO cate VALUES(2, '거실');
INSERT INTO cate VALUES(3, '주방');

DESC cate;
SELECT*FROM cate;

-- item table -----------------------------------------------------------------
DROP TABLE IF EXISTS item;
CREATE TABLE item(
	itemno INT,
	cateno INT,
	itemname VARCHAR(20) NOT NULL,
	itemprice INT NOT NULL,
	itemcolor VARCHAR(20) NOT NULL,
	itemsize VARCHAR(30) NOT NULL,
	itemimg VARCHAR(20),
	itemimg1 VARCHAR(20),
	itemstock INT NOT NULL,
	itemsell INT NOT NULL
);
ALTER TABLE item ADD CONSTRAINT PRIMARY KEY(itemno);
ALTER TABLE item MODIFY itemno INT AUTO_INCREMENT;
ALTER TABLE item AUTO_INCREMENT = 100;
-- ALTER TABLE item ADD FOREIGN KEY(cateno) REFERENCES cate(cateno);

INSERT INTO item VALUES(NULL, 01, '침대', 1096000, '베이지', 'Q', 'bed', 'bed1', 5, 12);
INSERT INTO item VALUES(NULL, 01, '옷장', 689000, '그레이', '1500*750*737', 'closet', 'closet1', 5, 12);
INSERT INTO item VALUES(NULL, 01, '화장대', 529000, '베이지', '1500*750*737', 'dresser', 'dresser1', 5, 12);
INSERT INTO item VALUES(NULL, 01, '책상', 550000, '브라운', '1500*750*737', 'desk', 'desk1', 5, 12);

INSERT INTO item VALUES(NULL, 02, '소파', 1290000, '그레이', '1500*750*737', 'sofa', 'sofa1', 5, 12);
INSERT INTO item VALUES(NULL, 02, '거실장', 590000, '베이지', '1500*750*737', 'living-room-dresser', 'living-room-dresser1', 5, 12);
INSERT INTO item VALUES(NULL, 02, '테이블', 199000, '베이지', '1500*750*737', 'side-table', 'side-table1', 5, 12);

INSERT INTO item VALUES(NULL, 03, '식탁', 699000, '베이지', '1500*750*737', 'table', 'table1', 5, 12);
INSERT INTO item VALUES(NULL, 03, '의자', 209000, '그레이', '1500*750*737', 'chair', 'chair1', 5, 12);
INSERT INTO item VALUES(NULL, 03, '수납장', 859000, '브라운', '1500*750*737', 'storage-closet', 'storage-closet1', 5, 12);

DESC item;
SELECT*FROM item;

-- orderpage table-------------------------------------------------------------
CREATE TABLE orderpage (
	orderno INT NOT NULL,
	custid VARCHAR(20) NOT NULL,
	orderdate DATE NOT NULL,
	orderpay VARCHAR(20) NULL,
	itemcnt INT NOT NULL,
	elevator VARCHAR(1) NOT NULL,
	shipname VARCHAR(50) NOT NULL,
	shipaddr VARCHAR(50) NOT NULL,
	reciever VARCHAR(20) NOT NULL,
	recievertel VARCHAR(20) NOT NULL
);

ALTER TABLE orderpage ADD PRIMARY KEY (orderno);
ALTER TABLE orderpage MODIFY orderno INT AUTO_INCREMENT;
ALTER TABLE orderpage AUTO_INCREMENT = 300;
-- ALTER TABLE orderpage ADD FOREIGN KEY (custid) REFERENCES cust(custid);
ALTER TABLE orderpage ADD CONSTRAINT CHECK (itemcnt>0);

INSERT INTO orderpage VALUES(NULL,'id01','2022-09-07','네이버페이',2,'Y','우리집','서울특별시 마포구','홍말숙','010-1234-1234');
INSERT INTO orderpage VALUES(NULL,'id02','2022-08-24','카카오페이',1,'Y','집','서울특별시 영등포구','이말숙','010-5236-3847');
INSERT INTO orderpage VALUES(NULL,'id03','2022-10-11','산용카드',1,'Y','집','경기도 성남시 분당구','조재윤','010-5536-0908');
INSERT INTO orderpage VALUES(NULL,'id04','2022-07-25','네이버페이',2,'N','이모댁','경기도 화성시 동탄동','박지후','010-7869-3425');
INSERT INTO orderpage VALUES(NULL,'id02','2022-06-30','카카오페이',3,'N','집','서울특별시 영등포구','이말숙','010-5236-3847');
INSERT INTO orderpage VALUES(NULL,'id06','2022-10-07','신용카드',3,'Y','삼촌댁','경기도 성남시 분당구','강훈','010-2324-1768');
INSERT INTO orderpage VALUES(NULL,'id09','2022-05-19','네이버페이',2,'Y','우리집','서울특별시 강남구','신말숙','010-3727-2749');
INSERT INTO orderpage VALUES(NULL,'id08','2022-06-30','카카오페이',3,'N','집','강원도 평창시','유말숙','010-1132-6505');
INSERT INTO orderpage VALUES(NULL,'id06','2022-10-07','신용카드',3,'Y','집','경기도 수원시','조말숙','010-8278-9594');
INSERT INTO orderpage VALUES(NULL,'id09','2022-05-19','네이버페이',2,'Y','우리집','서울특별시 강남구','신말숙','010-3727-2749');


DESC orderpage;
SELECT * FROM orderpage;

-- ship table ------------------------------------------------------------------
DROP TABLE IF EXISTS ship;

CREATE TABLE ship(
	shipid INT,
    orderno INT,
    shipstatus VARCHAR(20)
);
ALTER TABLE ship ADD CONSTRAINT PRIMARY KEY(shipid);
ALTER TABLE ship MODIFY shipid INT AUTO_INCREMENT;
ALTER TABLE ship AUTO_INCREMENT = 200;
-- ALTER TABLE ship ADD CONSTRAINT FOREIGN KEY(orderno) REFERENCES orderpage(orderno);

INSERT INTO ship VALUES (NULL,300,'출고요청');
INSERT INTO ship VALUES (NULL,301,'간선하차');
INSERT INTO ship VALUES (NULL,302,'배송완료');
INSERT INTO ship VALUES (NULL,303,'집화처리');
INSERT INTO ship VALUES (NULL,304,'출고완료');
INSERT INTO ship VALUES (NULL,305,'간선상차');
INSERT INTO ship VALUES (NULL,306,'간선하차');
INSERT INTO ship VALUES (NULL,307,'배송완료');
INSERT INTO ship VALUES (NULL,308,'배송출고');
INSERT INTO ship VALUES (NULL,309,'간선상차');

DESC ship;
SELECT * FROM ship;

-- detail order-------------------------------------------------------------------
CREATE TABLE detailorder (
	detailno INT NOT NULL,
	orderno INT NOT NULL,
	itemno INT NOT NULL
);

ALTER TABLE detailorder ADD CONSTRAINT PRIMARY KEY(detailno);
ALTER TABLE detailorder MODIFY detailno INT AUTO_INCREMENT;
ALTER TABLE detailorder AUTO_INCREMENT = 400;
-- ALTER TABLE detailorder ADD CONSTRAINT FOREIGN KEY(orderno) REFERENCES orderpage(orderno);
-- ALTER TABLE detailorder ADD CONSTRAINT FOREIGN KEY(itemno) REFERENCES item(itemno);

INSERT INTO detailorder VALUES(NULL,300,100);
INSERT INTO detailorder VALUES(NULL,301,101);
INSERT INTO detailorder VALUES(NULL,302,102);
INSERT INTO detailorder VALUES(NULL,303,103);
INSERT INTO detailorder VALUES(NULL,304,103);
INSERT INTO detailorder VALUES(NULL,305,105);
INSERT INTO detailorder VALUES(NULL,306,108);
INSERT INTO detailorder VALUES(NULL,307,108);
INSERT INTO detailorder VALUES(NULL,308,109);
INSERT INTO detailorder VALUES(NULL,309,104);

DESC detailorder;
SELECT * FROM detailorder;

-- cart table-----------------------------------------------------------------------
DROP TABLE IF EXISTS cart;

CREATE TABLE cart(
	cartno INT,
	custid VARCHAR(20),
	itemno INT,
	cartcnt INT
);
ALTER TABLE cart ADD CONSTRAINT PRIMARY KEY(cartno);
ALTER TABLE cart MODIFY cartno INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT = 500;
-- ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY(custid) REFERENCES cust(custid);
-- ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY(itemno) REFERENCES item(itemno);

INSERT INTO cart VALUES(NULL, 'id03', 103, 3);
INSERT INTO cart VALUES(NULL, 'id05', 102, 1);
INSERT INTO cart VALUES(NULL, 'id07', 101, 5);
INSERT INTO cart VALUES(NULL, 'id04', 102, 4);
INSERT INTO cart VALUES(NULL, 'id08', 103, 2);
INSERT INTO cart VALUES(NULL, 'id09', 101, 1);
INSERT INTO cart VALUES(NULL, 'id10', 103, 5);

DESC cart;
SELECT * FROM cart;

-- wishlist table-------------------------------------------------------------------
DROP TABLE IF EXISTS wishlist;
CREATE TABLE wishlist(
	wishno INT,
	custid VARCHAR(20),
	itemno INT
);
ALTER TABLE wishlist ADD CONSTRAINT PRIMARY KEY(wishno);
ALTER TABLE wishlist MODIFY wishno INT AUTO_INCREMENT;
ALTER TABLE wishlist AUTO_INCREMENT = 600;
-- ALTER TABLE wishlist ADD FOREIGN KEY(custid) REFERENCES cust(custid);
-- ALTER TABLE wishlist ADD FOREIGN KEY(itemno) REFERENCES item(itemno);

INSERT INTO wishlist VALUES(NULL, 'id01', 100);
INSERT INTO wishlist VALUES(NULL, 'id01', 105);
INSERT INTO wishlist VALUES(NULL, 'id01', 103);
INSERT INTO wishlist VALUES(NULL, 'id02', 106);
INSERT INTO wishlist VALUES(NULL, 'id02', 104);
INSERT INTO wishlist VALUES(NULL, 'id03', 107);
INSERT INTO wishlist VALUES(NULL, 'id03', 108);
INSERT INTO wishlist VALUES(NULL, 'id06', 108);
INSERT INTO wishlist VALUES(NULL, 'id06', 109);
INSERT INTO wishlist VALUES(NULL, 'id08', 100);

DESC wishlist;
SELECT*FROM wishlist;

-- review table---------------------------------------------------------------------
DROP TABLE IF EXISTS review;

CREATE TABLE review(
	reviewno INT,
	custid VARCHAR(20),
	itemno INT,
	rating INT,
	reviewcon VARCHAR(100),
	reviewdate DATE,
	reviewimg VARCHAR(20)
);
ALTER TABLE review ADD CONSTRAINT PRIMARY KEY(reviewno);
ALTER TABLE review MODIFY reviewno INT AUTO_INCREMENT;
ALTER TABLE review AUTO_INCREMENT = 700;
-- ALTER TABLE review ADD CONSTRAINT FOREIGN KEY(custid) REFERENCES cust(custid);
-- ALTER TABLE review ADD CONSTRAINT FOREIGN KEY(itemno) REFERENCES item(itemno);

INSERT INTO review VALUES(NULL,'id06',108,4,'그리 썩 좋아보이지는 않았지만 가격대비는 국내생산에 조립도 쉽고 튼튼하고 좋은것 같아요!!','2022-09-20','reviewchair.jpg');
INSERT INTO review VALUES(NULL,'id03',105,5,'부모님댁에 보내드렸는데 배송도 1주일내로 빨리받았고 고급스럽고 예쁘다고 부모님이 많이 좋아하시네요. 좋은제품 저렴히 구입할수 있어서 감사합니다.','2022-09-15','reviewliving.jpg');
INSERT INTO review VALUES(NULL,'id08',109,3,'배송도 보통이고 생각만큼은 아닌것 같아요 참고하세요','2022-10-11','reviewcloset.jpg');
INSERT INTO review VALUES(NULL,'id01',104,1,'배송도 너무 늦고 최악입니다 마감도 별로에요 ㅜ.ㅜ','2022-08-30','reviewsofa.jpg');
INSERT INTO review VALUES(NULL,'id03',106,4,'생각보다 배송도 빠르고 가격대비 퀄리티가 좋네요 번창하세요','2022-08-20','reviewtable.jpg');
INSERT INTO review VALUES(NULL,'id02',108,5,'저렴한 가격에 퀄리티 좋습니다 특히 팔걸이 포장이 제일 마음에 들더군요 팔걸이 스크래치 방지를 위해 파란색 비닐로 감싸주고 비닐포장으로 마무리 하고 기분 좋네요 많이 파세요~!','2022-10-07','reviewchair1.jpg');
INSERT INTO review VALUES(NULL,'id03',106,4,'생각보다 배송도 빠르고 가격대비 퀄리티가 좋네요 번창하세요','2022-08-20','reviewtable1.jpg');
INSERT INTO review VALUES(NULL,'id09',108,5,'가격대비 마감도 준수합니다 배송도빠르게 왔어요 좋은상품 감사합니다!!','2022-07-20','reviewchair3.jpg');

DESC review;
SELECT*FROM review;