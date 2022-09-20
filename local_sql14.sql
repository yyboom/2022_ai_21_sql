DROP DATABASE IF EXISTS amarket;

CREATE DATABASE amarket;

USE amarket;
-- ========================================================================================================

-- CUST TABLE
DROP TABLE IF EXISTS cust; -- 삭제해라

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
-- ==============================================================================================================

-- CATE TABLE
DROP TABLE IF EXISTS cate;

CREATE TABLE cate(
	id INT,
    name VARCHAR(10) NOT NULL
);

ALTER TABLE cate ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE cate MODIFY id INT AUTO_INCREMENT;
ALTER TABLE cate AUTO_INCREMENT = 10;
ALTER TABLE cate ADD CONSTRAINT UNIQUE (name);

INSERT INTO cate VALUES (NULL, '하의'); -- AUTO INCREMENT는 NULL로 두명 자동으로 들어감
INSERT INTO cate VALUES (NULL, '상의');

-- ==============================================================================================

-- ITEM TABLE
DROP TABLE IF EXISTS item;

CREATE TABLE item(
	id INT, -- 숫자가 자동으로 증가될 것
    cateid INT NOT NULL, -- CATE TABLE에 들어가 있는 것만 들어갈 수 있음!! => 제약사항으로 걸어줘야함
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
-- CATEID는 다른 TABLE의 것을 참조하는데 그것은 CATE TABLE의 ID이다.
ALTER TABLE item ADD CONSTRAINT FOREIGN KEY (cateid) REFERENCES cate(id);

-- ITEM에 상품 정보 넣기
INSERT INTO item VALUES (NULL, 10, '청바지', 10000, 'P1.JPG', NOW());
-- 밑에 CATEID가 가장 먼저 들어간것임!(CATEID를 같은 것을 넣어줘야함!)
INSERT INTO item VALUES (NULL, 10, '반바지', 20000, 'P2.JPG', NOW());
INSERT INTO item VALUES (NULL, 11, '반팔', 30000, 'P3.JPG', NOW());
INSERT INTO item VALUES (NULL, 11, '긴팔', 40000, 'P4.JPG', NOW());
-- ========================================================================================================

-- CART TABLE
DROP TABLE IF EXISTS cart;

CREATE TABLE cart(
	id INT, -- 숫자가 자동으로 증가될 것
    custid VARCHAR(10) NOT NULL, -- CATE TABLE에 들어가 있는 것만 들어갈 수 있음!! => 제약사항으로 걸어줘야함
    itemid INT NOT NULL,
    cnt INT NOT NULL,
    rdate DATETIME NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT PRIMARY KEY(id);
ALTER TABLE cart MODIFY id INT AUTO_INCREMENT; 
ALTER TABLE cart AUTO_INCREMENT = 100; -- 100부터!올라가라
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (custid) REFERENCES cust(id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (itemid) REFERENCES item(id);

INSERT INTO cart VALUES (NULL, 'id01', 1000, 3, NOW());
INSERT INTO cart VALUES (NULL, 'id01', 1001, 2, NOW());
INSERT INTO cart VALUES (NULL, 'id01', 1002, 5, NOW());
INSERT INTO cart VALUES (NULL, 'id02', 1001, 2, NOW());
INSERT INTO cart VALUES (NULL, 'id02', 1002, 3, NOW());
INSERT INTO cart VALUES (NULL, 'id02', 1003, 4, NOW());
-- =====================================================================================================

DESC cust;
SELECT * FROM cust;

DESC item;
SELECT * FROM item;

DESC cate;
SELECT * FROM cate;

DESC cart;
SELECT * FROM cart;
-- =================================================================================================

-- 상품을 조회 하시오
-- 상품명, 상품금액, 카테고리명, 등록일
SELECT i.name, i.price, ct.name AS item_name, i.rdate FROM item i -- as뒤에는 이나올때 이름을 바꿔주는 것!
INNER JOIN cate ct ON i.cateid = ct.id;

-- 장바구니를 조회 하시오
-- 고객 ID, 고객이름, 카테고리명, 상품명, 상품금액, 총금액(상품금액 * CNT), 등록일
SELECT cu.id, cu.name, ct.name AS cate_name, i.name AS item_name, i.price, i.price * cr.cnt AS total, cr.rdate FROM cart cr
INNER JOIN cust cu ON cr.custid = cu.id
INNER JOIN item i ON cr.itemid = i.id
INNER JOIN cate ct ON i.cateid = ct.id;
-- ======================================================================================================================

CREATE VIEW cart_info -- 조회 방법을 바꾸거나 매번 TABLE을 다끌고 와서 VIEW를 안하고 싶을때 만들어두면 좋음! P.358
AS
(
SELECT cu.id, cu.name, ct.name AS cate_name, i.name AS item_name, i.price, i.price * cr.cnt AS total, cr.rdate FROM cart cr
INNER JOIN cust cu ON cr.custid = cu.id
INNER JOIN item i ON cr.itemid = i.id
INNER JOIN cate ct ON i.cateid = ct.id
);

SELECT * FROM cart_info;
