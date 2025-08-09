create table demo_table(
    id int primary key,
    name text,
    salary int,
    department_id int,
    FOREIGN KEY(department_id) REFERENCES department(id)
);
