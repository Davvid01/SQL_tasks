use omega;


-- zad3
select e.emp_id, e.dep_id, e.first_name, e.last_name, d.name from employees e join departments d on (e.dep_id=d.dep_id)
order by d.name, e.last_name;

-- zad4
select e.emp_id, e.pos_id, e.first_name, e.last_name, d.name, e.salary
from employees e join positions d on (e.pos_id=d.pos_id) 
where d.name in ('Ekspert', 'Specjalista', 'Kierownik')
order by d.name, salary;

-- zad5
select e.emp_id, e.pos_id, e.first_name, e.last_name, d.name, e.salary, e.allowance 'dodatek', p.name 'stanowisko'
from employees e join departments d on (e.dep_id=d.dep_id)
					join positions p on (e.pos_id=p.pos_id)
where e.salary>5000 and e.allowance>0
order by  salary DESC;
-- zad6
select e.emp_id, e.first_name, e.last_name, d.name, e.salary, jg.name
from employees e join departments d on  (e.dep_id=d.dep_id)
					join job_grades jg on (e.jg_id=jg.jg_id)
	where year(hire_date) in (1999,2001) and allowance is null;
-- zad7
select e.emp_id, e.first_name, e.last_name, d.name, d.location
from employees e join departments d on  (e.dep_id=d.dep_id)
where d.location like '%306' or d.location like '%205';
-- WHERE CAST(SUBSTRING(d.location, LENGTH('Pokój') + 1) AS INT) > 200;
-- ZAD8
select e.emp_id, e.first_name, e.last_name, d.name, jg.name
from employees e join departments d on  (e.dep_id=d.dep_id)
					join job_grades jg on (e.jg_id=jg.jg_id)
                    join positions p on (e.pos_id=p.pos_id)
where p.name like '%Starszy%'
order by e.emp_id;
-- zad 9 
select p.name, e.first_name, e.last_name
from employees e right outer join positions p on (e.pos_id=p.pos_id)
order by p.seq, e.last_name;
-- zad 10
select jg.name, e.first_name,e.last_name
from employees e right outer join job_grades jg on (e.jg_id=jg.jg_id)
order by jg.jg_id, e.last_name;
-- zad 11
select e.emp_id, e.first_name,e.last_name, e.hire_date, e.manager_id, '--',em.emp_id, em.first_name,em.last_name, em.hire_date, e.manager_id
from  employees e join employees em on  (e.manager_id=em.emp_id)
where e.hire_date<em.hire_date;
order by e.emp_id;
-- zad 12
select e.emp_id, e.first_name,e.last_name,e.dep_id, '--', em. dep_id, em.first_name,em.last_name
from employees e join employees em on (e.manager_id=em.emp_id)
where e.dep_id != em.dep_id;
-- zad 13
select e.*
from employees e left join customers  c on (e.emp_id=c.account_manager_id)  -- printuje tez pracownikow ktorzy nie maja zqadnego stanowiska
where e.dep_id=30 and c.cust_id is Null;
-- zad 14

select e.*, e.salary*1.13 'nowa pensja', jg.name
from employees e join job_grades jg on (e.jg_id=jg.jg_id);

update employees
set jg.id= salary *1.13;





