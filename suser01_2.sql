DESC cust;
DESC item;

SELECT * FROM cust;
SELECT * FROM item;

-- select
SELECT ca.id, ca.user_id, c.name AS cust_name,ca.item_id, i.name AS item_name, i.price, ca.cnt, i.price*ca.cnt AS total_price, ca.rdate FROM cart ca
INNER JOIN cust c ON ca.user_id=c.id
INNER JOIN item i ON ca.item_id=i.id;

-- 상세조회
SELECT ca.id,ca.user_id,i.name AS item_name, i.price AS item_price, ca.cnt, i.imgname AS item_imgname, ca.rdate 
FROM cart ca
INNER JOIN item i ON ca.item_id = i.id
WHERE ca.id = 100;

SELECT sum(cnt) AS total_item_count FROM cart;

SELECT sum(i.price*ca.cnt) AS total_price FROM cart ca
INNER JOIN item i ON ca.item_id=i.id;