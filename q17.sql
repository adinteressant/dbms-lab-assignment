begin;
SELECT * FROM employee WHERE id = 2 FOR UPDATE;

UPDATE employee SET salary = 200000 WHERE id = 2;

COMMIT;

START TRANSACTION;

SELECT salary FROM employee WHERE id = 2;

UPDATE employee SET salary = salary + 5000 WHERE id = 2;

select name from employee where id=2;
UPDATE employee SET salary = salary *1.1 WHERE id = 2;
commit;

