-- CREATE
INSERT INTO transactions(amount, type, status, account_id)
VALUES (nominal, 'deposit', 'success', 1);

-- GENERATE SERIES
INSERT INTO transactions (amount, transaction_date, type, status, account_id)
SELECT 
    (random() * 1000)::BIGINT AS amount,
    NOW() AS transaction_date,
    CASE WHEN random() > 0.5 THEN 'deposit' ELSE 'withdraw' END AS type,
   	'success' AS status,
    gs AS account_id
FROM generate_series(1, 100) gs;
-- END CREATE

-- READ
SELECT * FROM transactions;
SELECT count(*) FROM transactions;

SELECT id, amount, transaction_date, type, status
FROM transactions
WHERE transaction_date >= '2024-10-08' AND transaction_date < '2024-11-08'; -- NOW()
-- END READ

-- UPDATE
UPDATE transactions
SET type = 'failed' -- type/status
WHERE id = 1;
-- END UPDATE

-- DELETE
DELETE FROM transactions WHERE id = 1;
-- END DELETE

-- PROCEDURE
-- CALL PROCEDURE
CALL deposit(1, 5000);
CALL withdraw(1, 5000);
-- END PROCEDURE

