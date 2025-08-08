select * from employee;

select * from department;
select employee.name,department.name from employee join
department on employee.department_id = department.id where salary>'30000';

select employee.name,department.name from employee join department
on employee.department_id = department.id;

select employee.name,department.name from department left join employee
on employee.department_id = department.id;

SELECT d.name AS department_name, max(e.salary) AS total_salary    
FROM employee e                                                     
JOIN department d ON e.department_id = d.id            
GROUP BY d.name                                            
HAVING max(e.salary) > '20000';
