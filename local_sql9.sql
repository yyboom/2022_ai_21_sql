SELECT * FROM buytbl;
SELECT * FROM usertbl;

-- 구매 정보에서 사용자의 이름과 사용자의 구매 항목을 출력하시오
SELECT b.prodName, u.name FROM buytbl b
INNER JOIN usertbl u ON b.userID = u.userID;

-- 170 이상인 회원의 구매 항목을 출력하시오
SELECT b.prodName FROM buytbl b
INNER JOIN usertbl u ON b.userID = u.userID
WHERE u.height > 170;

-- 지역 별 구매 금액(price*amount)의 평균을 구하시오
SELECT u.addr, AVG(b.price * b.amount) FROM buytbl b
INNER JOIN usertbl u ON b.userID = u.userID
GROUP BY u.addr;

-- 전체 회원의 구매 모록을 보고자 한다.(회원이름, 구매상품이름)
SELECT u.name, b.prodNAme FROM usertbl u
LEFT OUTER JOIN buytbl b ON b.userID = u.userID -- OUTER은 조건에 무합하지 않아도 조회해주는 것!
WHERE b.prodNAme IS NULL;