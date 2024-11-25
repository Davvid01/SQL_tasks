use omega;

-- zad 3
select  emp_id,first_name, salary,  dep_id from employees; -- czy domyślnie segreguje rosnąco po emp_id? dlaczego?
-- zad 4
select name, min_salary, max_salary, max_salary - min_salary AS widełki from job_grades; --na jakiej zasadzie posortowało kolejność
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
select* from employees where hire_date not Between '1999-01-01' AND '2015-12-31' OR last_name LIKE '_o%r';
-- zad 14
empl	


