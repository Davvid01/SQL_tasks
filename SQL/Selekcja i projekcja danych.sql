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
select * from employees where first_name=Jerzy;

