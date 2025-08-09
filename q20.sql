
CREATE TABLE transaction_log (
    log_id SERIAL PRIMARY KEY,
    transaction_id TEXT,
    operation_type TEXT, 
    table_name TEXT,
    record_id INT,
    column_name TEXT,
    old_value TEXT,      
    new_value TEXT,      
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    committed BOOLEAN DEFAULT FALSE
);


INSERT INTO transaction_log (transaction_id, operation_type, table_name, old_value, new_value) VALUES ('TXN001', 'UPDATE', 'employee', 'old_name', 'new_name');

update employee set name='old_name' where id =1;

select * from employee where id = 1;

update employee set name='new_name' where id =1

select * from employee where id = 1;

--undo
UPDATE employee SET name = (
    SELECT old_value
    FROM transaction_log
    WHERE transaction_id = 'TXN001'
    LIMIT 1
)
WHERE id = 1;

--redo
UPDATE employee
SET name = (
    SELECT new_value
    FROM transaction_log
    WHERE transaction_id = 'TXN001'
    LIMIT 1
)
WHERE id = 1;
