-- MEMBUAT DATABASE
CREATE DATABASE db_bank;

-- CREATE TABLE
CREATE TABLE customers(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	identification_number VARCHAR(50) NOT NULL,
	address TEXT NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP
);

CREATE TABLE accounts(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	account_number VARCHAR(50) NOT NULL,
	balance BIGINT NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP,
	customer_id INT NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE transactions(
	id BIGSERIAL PRIMARY KEY NOT NULL,
	amount BIGINT NOT NULL,
	transaction_date TIMESTAMP NOT NULL DEFAULT NOW(),
	type VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL,
	account_id INT NOT NULL,
	FOREIGN KEY(account_id) REFERENCES accounts(id)
);

-- ALTER TABLE
ALTER TABLE customers -- accounts/transactions
ADD COLUMN deleted_at TIMESTAMP ;

-- PROCEDURE
CREATE OR REPLACE PROCEDURE withdraw(
	account_id INT,
	nominal BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO transactions(amount, type, status, account_id)
    VALUES (nominal, 'withdraw', 'success', account_id);
	
	UPDATE accounts
	SET balance = balance - nominal
	WHERE id = account_id;

	COMMIT;
END;$$;

CREATE OR REPLACE PROCEDURE deposit(
	account_id INT,
	nominal BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
	i
	INSERT INTO transactions(amount, type, status, account_id)
    VALUES (nominal, 'deposit', 'success', account_id);

	UPDATE accounts
	SET balance = balance + nominal
	WHERE id = account_id;

	COMMIT;
END;$$;
-- END PROCEDURE


-- INDEX
CREATE INDEX idx_customers_on_name ON customers(name);
CREATE INDEX idx_transactions_on_transaction_date ON transactions(transaction_date);

-- DROP
DROP TABLE customers;
DROP TABLE accounts; 
DROP TABLE transactions;
DROP PROCEDURE IF EXISTS withdraw;
DROP PROCEDURE IF EXISTS deposit;
DROP INDEX idx_customers_on_name;
DROP INDEX idx_transactions_on_transaction_date;