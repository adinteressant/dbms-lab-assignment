start transaction;
select salary from employee where id =1;
update employee set salary = salary * 1.2 where id = 1;


start transaction;
select salary from employee where id=1;
update employee set salary = salary*1.3 where id=1;
