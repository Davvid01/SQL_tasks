create table employees (
emp_no int identity(1,1) primary key,
department varchar(20),
salary int)

insert into employees (department, salary) values
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

--WINDOWS FUNCTION wyswietla wszystkiego wiersze, ale wyswitela obok funkcje grupującą w zaleznosci co grupowalismy
select emp_no, salary, department, avg(salary) over() as 'general avg', min(salary) over(), max(salary) over() from employees
group by department

-- tutaj już grupujemy window fuction po departamencie, czyli każdy wiersz bedzie mial kolumne ze srednia na dany dep
select emp_no, department, salary, avg(salary) over(partition by department) as dept_avg
from employees

select emp_no, department, salary, COUNT(*) over (partition by department) as emp_amount
from employees

select emp_no, department, salary, sum(salary) over() as sum_total, sum(salary) over (partition by department) as payroll_dep
from employees

-- order by powoduje ze kazde kolejne salary jest dodawane w kolejnosci malejacej
select emp_no, department, salary, sum(salary) over (partition by department) as payroll_dep,
sum(salary) over(partition by department order by salary desc) as rolling_dep_sal
from employees

select emp_no, department, salary, min(salary) over (partition by department order by salary desc),
sum(salary) over(partition by department order by salary desc) as rolling_dep_sal
from employees

select emp_no, department, salary, rank() over (partition by department order by salary desc) as by_dep,
rank() over (order by salary desc) as overall
from employees
order by department, by_dep

