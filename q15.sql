set session transaction isolation level read uncommitted;

start transaction;

select * from employee where id =1;
set session transaction isolation level read committed;

start transaction;

SELECT * FROM employee where id=1;
set session transaction isolation level repeatable read;

start transaction;
SELECT  * FROM employee where id=1;

set session transaction isolation level serializable;

start transaction;
SELECT * FROM employee where id=1;
