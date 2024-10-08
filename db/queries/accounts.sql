-- CREATE
INSERT INTO accounts(account_number,balance,customer_id) VALUES ('123321', 50000, 1);

-- GENERATE SERIES
INSERT INTO accounts (account_number, balance, customer_id)
SELECT 
    'Acc-' || LPAD(gs::TEXT, 6, '0') AS account_number,
    (random() * 10000)::BIGINT AS balance,
    gs AS customer_id
FROM generate_series(1, 100) gs;
--- END CREATE

-- READ
SELECT * FROM accounts;
SELECT count(*) FROM accounts;

-- GET BALANCE BY ID
WITH get_balance AS(  
    SELECT c.name, a.account_number, a.balance
    FROM customers c 
    JOIN accounts a ON c.id = a.customer_id
    WHERE c.id = 1	
)
SELECT * FROM get_balance;

-- SORT BY HIGHEST BALANCE
SELECT * FROM accounts ORDER BY balance DESC;
-- END READ

-- UPDATE
UPDATE accounts
SET balance = 10000
WHERE id = 1;  
-- END UPDATE

-- DELETE
DELETE FROM accounts WHERE id = 2;
-- END DELETE