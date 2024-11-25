use omega;

-- zad 3
select  emp_id,first_name, salary,  dep_id from employees; -- czy domyślnie segreguje rosnąco po emp_id? dlaczego?
-- zad 4
select name, min_salary, max_salary, max_salary - min_salary AS widełki from job_grades; -- na jakiej zasadzie posortowało kolejność
desc job_grades;
-- zad 5
select * from employees
where jg_id=5;
-- zad 6
select * from employees where first_name='Jerzy';
-- Zad7
select * from employees where manager_id=100;
-- Zad 8
select * from employees where salary<=5000;
-- Zad 9 
select * from employees where hire_date>'2003-07-01' and dep_id=30;		-- daty to +1 od 1970
-- zad 10 
select* from employees where hire_date>'1999-02-01' and hire_date<'2001-08-31';
select* from employees where hire_date between '1999-02-01' and '2001-08-31';
-- zad 11
select* from employees where hire_date between '2000-01-01' and '2002-12-31';
-- zad 12
select * from employees where first_name LIKE '_a%'; -- _ tzn że przed a, może stać dowolny 1 znak, % oznacza że po a mogą być dowolne ZNAKI, bez % program szukałby imienia dwuliterowego 
-- zad 13
select* from employees where hire_date not Between '1999-01-01' AND '2015-12-31' OR last_name LIKE '_o%r%';
-- zad 14
select * from job_grades where max_salary-min_salary between 1500 and  3000;
-- select max_salary-min_salary between 1500 and  3000 from job_grades;
-- zad 15
select * from employees order by jg_id;
-- zad 16
select* from employees order by dep_id DESC;
-- zad 17
select * from employees order by jg_id, salary DESC;
-- zad 18
select last_name, hire_date from employees where  hire_date between '2010-01-01' and '2015-12-31' order by hire_date;
-- zad 19
select * from employees where pos_id in (3, 4, 6) order by pos_id;
-- zad 20
select * from employees where dep_id not in (30, 40)  and pos_id not in (1,9);
-- zad 21
select* from employees where manager_id is null;
-- zad 22
select* from employees where dep_id  is not null and allowance is null; 
-- zad 23
select* from employees where jg_id in (2, 5,9) and allowance is null;
-- zad 24
select distinct first_name from employees  order by first_name;
-- zad 25
select distinct salary from employees order by salary desc;
-- zad 26
select dep_id, first_name, last_name, hire_date from employees order by hire_date limit 1;
-- zad 27
select dep_id, first_name, last_name, salary from employees order by salary DESC limit 1;
-- zad 28
select dep_id, first_name, last_name, hire_date from employees order by hire_date DESC limit 1;
-- zad 29
select name from positions order by seq limit 3;
-- zad 30
select name,max_salary - min_salary AS widełki  from job_grades order by max_salary - min_salary limit 1;







