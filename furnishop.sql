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
INSERT INTO ship VALUES (NULL,310,'집화처리');
INSERT INTO ship VALUES (NULL,311,'배송출고');
INSERT INTO ship VALUES (NULL,312,'배송출고');
INSERT INTO ship VALUES (NULL,313,'출고완료');
INSERT INTO ship VALUES (NULL,314,'배송완료');
INSERT INTO ship VALUES (NULL,315,'간선하차');

DESC ship;
SELECT * FROM ship;