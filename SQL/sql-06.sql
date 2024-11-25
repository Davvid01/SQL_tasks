use omega;

-- zad3
select*
from employees e join departments d on (e.dep_id=d.dep_id and d.name='Marketing');

select*
from employees
where dep_id=(select dep_id
from departments
where name = 'Marketing'); -- 20 są niezależne od pytania głównego, wykonują się raz na poczatku, zgodnie z zasadą co w nawiasie to pierwsze

-- zad4
select*
from employees
where manager_id=(select emp_id
					from employees
                    where last_name = 'Anderczak'); -- 107 pytania jednowierszowe bo musi wyswietlic jeden wiersz

select e.*
from employees e join employees m on (e.manager_id = m.emp_id and m.last_name = 'Anderczak');

-- zad5
select *
from employees
where dep_id = (select dep_id
				from employees
                where last_name= 'Anderczak') -- 30
		and last_name<>'Anderczak';
        
-- zad6
select* 
from employees
where salary>(select avg(salary)
				from employees); -- 5696 nie mozna by użyc avg bez tych nawiasow bo odwolywalaby sie do grupowania
-- zad7
select*
from employees
where salary>(select avg(salary)
				from employees e join departments d on (e.dep_id=d.dep_id and d.name='Sprzedaż')); -- (lub wpisać bezpośrednio przy złączeniu)
                
select*
from employees
where salary>(select avg(salary)
				from employees
                where dep_id=(select dep_id
								from departments
                                where name='Sprzedaż')); 
-- zad 8
select*
from customers
order by discount desc
limit 1; -- jest zle bo zaklada ze 1 klient ma najwiekszy upust, a dwoch klientów ma najwiekszy upust

select*
from customers
where discount = (select max(discount)
					from customers);
                    
-- zad9
select d.dep_id, d.name, avg(e.salary)
from departments d join employees e on (d.dep_id=e.dep_id)
group by d.dep_id
having min(e.salary)> (select avg(salary)
						from employees
						where pos_id=4); -- 3750
-- zad 10
select *, salary + ifnull(allowance, 0) 'full_salary'
from employees;

-- koncepcja
select d.dep_id, avg('full_salary'), min('full_salary'), max('full_salary')
from employees
group by dep_id;
-- standardowe zapytanie
select d.dep_id, avg(salary + ifnull(allowance, 0)), 
				min(salary + ifnull(allowance, 0)), 
				max(salary + ifnull(allowance, 0))
from employees
group by dep_id;
-- podzapytanie w klauzuli FROM
select d.dep_id, avg('full_salary'), min('full_salary'), max('full_salary')
from (select *, salary + ifnull(allowance, 0) 'full_salary'
		from employees) employees_2
group by dep_id;

-- CTE
with employees_2 as (
		select *, salary + ifnull(allowance, 0) 'full_salary'
        from employees
)
select dep_id, avg(full_salary), min(full_salary), max(full_salary)
from employees_2
group by dep_id;

-- zad 11
select emp_id, first_name, last_name, dep_id
from employees;

select dep_id, avg(salary)
from employees
group by dep_id;

select e.emp_id, e.first_name, e.last_name, e.salary, dep_stat.dep_avg
		if(e.salary > dep_stat.dep_avg,  '↑','  ↓')
from employees e join (select dep_id, avg(salary) 'dep_avg'
						from employees
						group by dep_id) dep_stat
					on (e.dep_id=dep_stat.dep_id);
-- wersja z CTE
with dep_stat as (
	select dep_id, avg(salary) 'dep_avg'
    from employees
    group by dep_id
    )
select e.emp_id, e.first_name, e.last_name, e.salary, dep_stat.dep_avg
		if(e.salary > dep_stat.dep_avg,  '↑','  ↓')
from employees e join dep_stat
					on (e.dep_id=dep_stat.dep_id);
-- zad12
select*
from employees
where dep_id IN (select dep_id			-- jeżeli wiemy że zwrocimy jedną wartosc to '=', a jak wiele to IN
			from departments
			where name like '%e%');

select*
from employees
where dep_id =ANY (select dep_id			-- jeżeli wiemy że zwrocimy jedną wartosc to '=', a jak wiele to IN
			from departments
			where name like '%e%');
-- any --> alternatywa  all-->koniunkcja
-- zad 13
-- zad 14
select*
from customers
where discount = (select max(discount)
					from customers);
select*
from customers
where discount >=ALL (select discount
						from employees);
					-- (discount>=0.2) AND (discount >=0.15) AND (discount>=0.02) AND
					--                     (discount >=0.06) AND (discount>=0.03)
                    -- upraszcza sie do:
                    -- (discount >=0.2)
-- zad15
select d.dep_id, d.name, avg(e.salary)
from departments d join employees e on (d.dep_id=e.dep_id)
group by d.dep_id;
-- podejscie intuicyjne
select d.dep_id, d.name, MIN(avg(e.salary))
from departments d join employees e on (d.dep_id=e.dep_id)
group by d.dep_id;
-- rozwiazznie 1 - ALL w having
select d.dep_id, d.name, avg(e.salary)
from departments d join employees e on (d.dep_id=e.dep_id)
group by d.dep_id
having avg(e.salary)<=ALL(select dep_id, avg(salary) -- to jest metoda na obejcise min(avg)
						from employees
                        where dep_id is not null
                        group by dep_id);
-- (avg(e.salary) <=10500) and (avg(e.salary) <=5800) and (avg(e.salary) <= 4920) and
-- (avg(e.salary) <=4966) and (avg(e.salary) <= 5200)
-- upraszcza się do
-- (avg(e.salary)<4920)


-- rozwiązanie 2 - CTE
with dep_salary as (
		select d.dep_id, d.name, avg(e.salary) 'avg_salary'
		from departments d join employees e on (d.dep_id=e.dep_id)
		group by d.dep_id;
)
select*
from dep_salary
where avg_salary=(select min(avg_salary)
					from dep_salary);
-- rozwiazanie 3 - podzapytanie klauzuli FROM
select*
from (select d.dep_id, d.name, avg(e.salary) 'avg_salary'
		from departments d join employees e on (d.dep_id=e.dep_id)
		group by d.dep_id) as dep_salary
-- where avg_salary= (select min(avg_salary)
					-- from (select d.dep_id,d.name,avg(e.salary) 'avg_salary'
						-- from departments d join employees e on (d.dep_id= -- ze zdjęcia

                

-- zad 16
select *
from employees
where jg_id = (select jg_id
				from employees
                where emp_id=111)
		and 
        year (hire_date) = (select year (hire_date)
							from employees
                            where emp_id=111);
select*
from employees
where (jg_id, year(hire_date))=(select jg_id, year (hire_date)
								from employees
								where emp_id=111);



