use omega;
--zad3
select * from projects;
select * from project_participantsproject_participants;

-- select pr.*,'--',pp.*,'--', e.*
select pr.proj_id, pr.name, e.emp_id, e.first_name, e.last_name
from projects pr join project_participants pp on (pr.proj_id=pp.proj_id)
				join employees e on (pp.emp_id= e.emp_id)
                order by pr.proj_id;
                
-- zad4
select distinct pr.name -- usuwa powtórzenia
from projects pr join project_participants pp on (pr.proj_id=pp.proj_id)	-- nie ma znaczenia kolejność
					join employees e on (pp.emp_id= e.emp_id)	
                    join departments d on (d.dep_id=e.dep_id and d.name='Sprzedaż');

-- zad5
select d.dep_id, d.name, eq.name, de.quantity
from departments d join dep_eq de on (d.dep_id=de.dep_id)
					join equipment eq on (de.eq_id=eq.eq_id)
order by dep_id;

-- zad 6
select d.dep_id, d.name, eq.name, de.quantity
from departments d join dep_eq de on (d.dep_id=de.dep_id)
					join equipment eq on (de.eq_id=eq.eq_id and eq.name='Skaner');
-- where eq.name ='skaner'                    
-- zad 7
select pos_id, count(*)
from employees
group by pos_id;

select p.pos_id, p.name, count(*)
from positions p join employees e on (p.pos_id= e.pos_id)
group by p.pos_id -- p.name
order by p.pos_id;

-- zad 8
select d.dep_id, d.name, count(e.emp_id), avg(e.salary) -- wyznacza liczbe wierszy dla danego wyrażenia/argumentu - e.emp_id
from departments d left join employees e on (d.dep_id = e.dep_id)
group by d.dep_id;

select d.dep_id, d.name, count(e.emp_id), avg(e.salary) 
from departments d left join employees e on (d.dep_id = e.dep_id)
group by d.dep_id;

-- zad9 
select d.dep_id, d.name, count(*), count(if (e.salary>5000, true, null))	-- count(*) zlicza liczbe wierszy/ zlicza liczbe wierszy dla danego arguekntu jak tutaj
from departments d join employees e on (d.dep_id= e.dep_id)
group by d.dep_id;

-- zad 10
select d.name, count(e.emp_id), count(distinct e.pos_id), count(distinct jg_id)
from departments d left join employees e on (d.dep_id=e.dep_id)
group by d.dep_id;

-- zad 12
select dep_id, group_concat(last_name
								order by last_name separator', ') 'lista pracownikow'
from employees
group by dep_id;

-- zad 13
select *
from departments d join employees e on (d.dep_id=e.dep_id)
group by d.dep_id;


-- zad 14
select m.emp_
from employees m join employees e on (m.emp_id=e.manager_id)
group by m.emp_id;

-- zad15
select*
from employees
where dep_id in (10,20,30)
UNION
select*
from employees
where dep_id=10
UNION
select*
from employees
where dep_id=20
UNION
select*
from employees
where dep_id=30;

-- zad16
select*
from employees
where dep_id= 20  or pos_id=6
UNION
	select*
    from employees
    where dep_id=20
UNION ALL -- nie likwiduje duplikatów
	select*
    from employees
    where pos_id=6;

-- zad17
select concat(last_name, ' ', first_name) as 'pozycja', 'praocwnik' as 'typ pozycji'
from employees
union -- likwiudje duplikaty
select name,'dział'
from departments
union
select name, 'klient'
from customers
order by 1;

-- zad 18
select *
from employees
where year(hire_date) > 2003 
intersect
select*
from employees
where salary> 6000;
-- zad 19
select * 
from departments d join employees e on (d.dep_id=e.dep_id);

--  where e.jg_id<>7 jest zle bo usunie pojedynczego pracownika a my chcemy usunac caly dzial jesli  jest w nim jg=7
select *
from departments
except
select d.*
from departments d join employees e on (d.dep_id=e.dep_id and e.jg_id=7)
                    
                    
                    
                    
                    