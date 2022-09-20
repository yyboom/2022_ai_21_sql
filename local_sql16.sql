DROP DATABASE IF EXISTS myshop;
CREATE DATABASE myshop;

USE myshop;

CREATE TABLE cate(
	id INT,
    topid INT,
    name VARCHAR(20) NOT NULL
);

ALTER TABLE cate ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE cate ADD CONSTRAINT FOREIGN KEY (topid)
REFERENCES cate (id); -- id는 반드시 topid를 참조해야 한다.(self join)

INSERT INTO cate VALUES(10,NULL,'가전');-- 최고인 아이들임
INSERT INTO cate VALUES(20,NULL,'모바일');
INSERT INTO cate VALUES(30,NULL,'가구');

INSERT INTO cate VALUES (11,10,'냉장고');
INSERT INTO cate VALUES (12,10,'선풍기');
INSERT INTO cate VALUES (21,20,'갤럭시');
INSERT INTO cate VALUES (22,20,'아이폰');
INSERT INTO cate VALUES (31,30,'옷장');
INSERT INTO cate VALUES (32,30,'책상');

CREATE TABLE item(
	id INT,
    cateid INT,
    name VARCHAR(20),
    price INT
);    

ALTER TABLE item ADD CONSTRAINT PRIMARY KEY(id);
ALTER TABLE item ADD CONSTRAINT FOREIGN KEY (cateid)
REFERENCES cate(id);

INSERT INTO item VALUES (100,21,'520',100000);

SELECT * FROM cate;
SELECT * FROM item;
-- 최상위 카테고리를 조회하시오
SELECT * FROM cate WHERE topid IS NULL;

-- 상품을 입력 할 카테고리를 조회하시오
-- 상위 카페고리 정보까지 조회 하시오
-- 상위 카테만 있는 것, 하위만 있는 것 두개로 나눠서 생각해라(c1이 하위, c2가 상위)
SELECT * FROM cate c1 INNER JOIN cate c2 ON c1.topid = c2.id;

-- 가전의 하위 카테고리를 조회 하시오
-- 최상위 클래스가 가전인 것을 찾으면 됨
SELECT * FROM cate c1 INNER JOIN cate c2 ON c1.topid = c2.id
WHERE c2.name = '가전';

-- 제품 정보를 조회 하시오
-- 카테고리명 제품명 가격
SELECT c.name, i.name, i.price FROM item i
INNER JOIN cate c
ON i.cateid = c.id;

-- 상위 카테고리명, 가테고리명 제품명 가격
SELECT c2.name, c.name, i.name, i.price FROM item i
INNER JOIN cate c ON i.cateid = c.id
INNER JOIN cate c2 ON i.cateid = c2.id;