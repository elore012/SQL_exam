
-- create table for departments

CREATE TABLE departments(
department_id INTEGER,
department VARCHAR(100)
)

INSERT INTO departments (department_id,department)
VALUES(1,"Marketing"),(2,"Consultancy"),(3,"IT");

-- create table for salary

CREATE TABLE salary (
    salary_id INTEGER,
    salary INTEGER
);

INSERT INTO salary(salary_id,salary)
VALUES(1,1000),(2,1500),(3,20000);

-- create table for employee with department and salary foreign keys

CREATE table employee(id INTEGER NOT NULL,
name VARCHAR(100),date_hired DATETIME,department_id INT,PRIMARY KEY(id),
CONSTRAINT FK_DepartmentsEmployee
FOREIGN KEY(department_id)REFERENCES departments(department_id),salary_id INT,
CONSTRAINT FK_SalaryEmployee FOREIGN KEY(salary_id) REFERENCES salary(salary_id));


INSERT INTO employee (id, name, date_hired, department_id, salary_id)
VALUES (
    1,
    'Employee1',
    '2017-10-07 00:00:00',
    3,
    1
  ),
  (
    2,
    'Employee2',
    '2012-10-08 00:00:00',
    2,
    3
  ),
  (
    3,
    'Employee3',
    '2016-08-10 00:00:00',
    1,
    2
  ),
  (
    4,
    'Employee4',
    '2018-08-10 00:00:00',
    3,
    2
  );


-- query employee who has highest paid salary 
select * from employee where salary_id =3;

-- query employee who were hired between 2017 and 2018
select  *
from employee
where date_hired between '2017-01-01' and '2018-12-30';

-- query employee who is from It department and was hired 2018 onwards

SELECT 
*
FROM
employee emp inner join departments dep  on emp.department_id = dep.department_id 
WHERE emp.department_id = 3 AND date_hired >= '2018-01-01 00:00:00';