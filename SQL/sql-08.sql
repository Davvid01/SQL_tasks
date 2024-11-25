use debere_omega;

-- zad3
select * from departments;

insert into departments (dep_id, name, location)
values (100,'Zamówienia','Pokój 225');

select * from departments;
-- zad4
INSERT INTO `debere_omega`.`employees`
(`emp_id`,
`first_name`,
`last_name`,
`hire_date`,
`salary`,
`allowance`,
`pos_id`,
`jg_id`,
`manager_id`,
`dep_id`)
VALUES
(0,'Dawid','Debere',curdate(), -- 13-12-2023 -- 0 wygeneruje w sposob automatyczny koloejna wartość
9500, null,
2,
4,
103,
(select dep_id from departments where name = 'Zamówienia') -- musi zwrócic tylko 1 wartość!!!!!!!!!~!!!!!! 	
);
select* from employees;
select last_insert_id();

select last_insert_id()
into @boss_id;

select @boss_id;

set @boos_id=128;
-- zad5
INSERT INTO `debere_omega`.`employees`
(`emp_id`,
`first_name`,
`last_name`,
`hire_date`,
`salary`,
`allowance`,
`pos_id`,
`jg_id`,
`manager_id`,
`dep_id`)
VALUES
(0,
'Zofia',
'Kowalska',
curdate(),
5500,
null,
(select pos_id from positions where name ='Specjalista'),
(select jg_id from job_grades where 5500 between min_salary and max_salary),
@boss_id, -- przypisujemy Zofii managera (mnie)
(select dep_id from departments where name = 'Zamówienia')
);
select * from employees;

select dep_id
into @marketing
from departments
where name = 'Marketing';
select @marketing; -- przypisujemy zmiennej @marketing wartośc zaciegnieta z dep_id dla "Marketing"

select *
from employees
where dep_id = @marketing;

-- zad6
select * 
from employees;

update employees
set last_name= 'Johnson'
where emp_id = 108;

select * from employees;

-- zad 7
select*
from employees
where salary between 5000 and 6000;

update employees
set salary = salary *1.1
where salary between 5000 and 6000;

-- zad8
update employees
set allowance=null
where dep_id=(select dep_id from departments where name ='Marketing');

select * from employees where dep_id=(select dep_id from departments where name ='Marketing');
-- zad9
delete from employees
where emp_id=110;
select * from employees;

