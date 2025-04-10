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
--czyli w wyswitelna kolumna odwoluje sie do grupowania/ danej grupy, ale roznica jest taka ze wyswietla się ja w nomrlanym selectcie
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

select emp_no, department, salary, -- if values are the same -> consecutive number
row_number() over (partition by department order by salary desc) as dept_row_number, -- if values are the same -> same number
rank() over (partition by department order by salary desc) as by_dep,
rank() over (order by salary desc) as overall, --1,2,3,4,4,6
DENSE_RANK() over(order by salary desc) as overall_dense_rank -- if values are the same, same number. BUT subsequnt number is not skipped. 1,2,3,4,4,5
from employees
order by department, by_dep


-- KWARTYLE

select emp_no, department, salary, ntile(4) over(order by salary desc) as salary_quartile, -- jesli nie podamy partition by to znaczy że bedzie wzgledem kolumny w order by
ntile(4) over(partition by department order by salary desc) as dept_salary_quartile
--w departamencie ktos jest w 4 kwartyulu bo najnmniej zaraiba, ale overall w firmie już w drugim
from employees

-- FIRST VALUE

select emp_no, department, salary, 
FIRST_VALUE(emp_no) over(order by salary desc),
--divide all rows into one window
-- we have one massive window so for this window there is only 1 and first employee with highest salry
FIRST_VALUE(emp_no) over(partition by department order by salary desc) as highest_paid_dep
-- kazde okno to jeden department, sortujemy je, bierzemy pierwsza wartosc
from employees

--LEAD & LAG
-- LAG shows preceding value
-- LEAD shows subsequent


select emp_no, department, salary, 
lag(salary) over(order by salary desc),
salary - lag(salary) over(order by salary desc) as salary_diff,
salary - lead(salary) over(order by salary desc) as salary_diff_subseq
--within one window
from employees

select emp_no, department, salary, 
lag(salary) over(order by salary desc) as previous,
salary - lag(salary) over(partition by department order by salary desc) as salary_diff,
salary - lead(salary) over(order by salary desc) as salary_diff_subseq -- to cały czas wzgledem jednego duzego 'window'

from employees