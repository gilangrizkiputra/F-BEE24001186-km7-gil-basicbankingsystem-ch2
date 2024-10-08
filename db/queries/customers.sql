-- CREATE
INSERT INTO customers(name, identification_number, address, phone_number) 
VALUES ('Gilang', '132135324232', 'Jakarta', '083213273213');

-- GENERATE SERIES
INSERT INTO customers (name, identification_number, address, phone_number)
SELECT 
    'Customer ' || gs AS name,
    'ID-' || gs::TEXT AS identification_number,
    'Address ' || gs AS address,
    '001-' || LPAD(gs::TEXT, 4, '0') AS phone_number
FROM generate_series(1, 100) gs;
-- END CREATE

-- READ
SELECT * FROM customers; 
SELECT count(*) FROM customers;

SELECT name, identification_number, address, phone_number
FROM customers
WHERE name LIKE 'Customer%';
-- END READ

-- UPDATE
UPDATE customers
SET address = 'Bandung' --name/address/phone_number
WHERE id = 1;
-- END UPDATE

-- DELETE
DELETE FROM customers WHERE id = 1;
-- END DELETE