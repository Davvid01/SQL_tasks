use omega;

-- zad 3
select * from employees e1
where salary>(select avg(salary)
				from employees e2
				where  e1.pos_id=e2.pos_id) order by pos_id;
-- zad 4
select * from employees e1
where salary =(select min(salary)
				from employees e2
				where e1.jg_id=e2.jg_id) order by jg_id;
-- zad 5
select * from employees e
where salary >(select salary 
				from employees m
                where m.emp_id=e.manager_id)*1.2;
-- zad6
select * from employees e
where (allowance is not null) and (salary+ifnull(allowance,0))<(select salary
							from employees m
                            where e.manager_id=m.emp_id);
-- zad7
select * from employees e1 where hire_date= (select max(hire_date)
											from employees e2
											where e1.pos_id=e2.pos_id) order by pos_id;
SELECT e.*
FROM employees e
WHERE DATEDIFF(CURDATE(), e.hire_date) = (
    SELECT MIN(DATEDIFF(CURDATE(), e2.hire_date))
    FROM employees e2
    WHERE e.pos_id = e2.pos_id
) order by pos_id;
-- zad 8
select * from employees e
where allowance =(select max(allowance)
					from employees e2
					where e.dep_id=e2.dep_id) order by dep_id;
-- zad 9
select name, pos_id from positions p
where (select count(emp_id)
					from employees p2
					where p.pos_id=p2.pos_id)=4 order by pos_id;
-- zad10
select * from departments d join employees e on (d.dep_id=e.dep_id)
where hire_date =(select min(e2.hire_date)
					from employees e2
                    where e2.dep_id=d.dep_id) order by d.name; -- nie e?
-- zad11
select * from positions pos join employees e on (pos.pos_id=e.pos_id)
where salary=(select max(salary)
				from employees e2
                where e2.pos_id=pos.pos_id) order by pos.seq;
-- zad12
select last_name, (select name from positions pos where pos.pos_id=e.pos_id)
from employees e order by e.last_name;
-- zad13
select name, dep_id, (select count(emp_id) -- dlaczego dziala gwiazdka/emp_id
					from employees e
                    where e.dep_id=d.dep_id)
from departments d;
-- zad14
select * from employees e where
exists (select 	*
		from customers c
        where c.account_manager_id=e.emp_id);
-- zad 15
select * from job_grades jg where exists (select 'X' 
from employees e join positions p on (e.pos_id=p.pos_id and p.name='Specjalista')
where jg.jg_id=e.jg_id);
-- zad16
select * from job_grades jg where jg_id not in (select *
												from employees
                                                where jg_id is not null);






