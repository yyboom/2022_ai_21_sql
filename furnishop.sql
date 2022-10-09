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

INSERT INTO cust VALUES ('id01','pwd01','홍말숙','서울');
INSERT INTO cust VALUES ('id02','pwd02','이말숙');
INSERT INTO cust VALUES ('id03','pwd03','정말숙');

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

INSERT INTO cust VALUES ('id01','pwd01','홍말숙','서울');
INSERT INTO cust VALUES ('id02','pwd02','이말숙');
INSERT INTO cust VALUES ('id03','pwd03','정말숙');

DESC ship;
SELECT * FROM ship;