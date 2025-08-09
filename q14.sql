start transaction;
select * from employee where id =1;
update employee set salary = 0 where id=1;
rollback;

start transaction;
select * from employee where id =1;
update employee set salary = 0 where id=1;
commit;
