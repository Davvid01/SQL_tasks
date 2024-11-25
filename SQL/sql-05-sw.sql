use omega;

-- zad 3
select e.emp_id, e.first_name,e.last_name
from projects p join project_participants pp on (p.proj_id=pp.proj_id and p.name='Wdrożenie modułu FK')
		join employees e on (e.emp_id=pp.emp_id);
-- zad4
select distinct p.name
from projects p join project_participants pp on (p.proj_id=pp.proj_id)
		join employees e on (e.emp_id=pp.emp_id)
        join positions po on (po.pos_id=e.pos_id and po.name='Specjalista' and salary>4200)
       order by p.name;
-- zad 5
select distinct d.name
from projects p join project_participants pp on (p.proj_id=pp.proj_id)
		join employees e on (e.emp_id=pp.emp_id)
        join departments d on (d.dep_id=e.dep_id)
        where year(p.start_date)=2023 and month(p.start_date)=03
        order by d.name;
-- zad 6
select d.name
from equipment e join dep_eq de on (e.eq_id=de.eq_id and e.name='smartfon')
		join departments d on (d.dep_id=de.dep_id);
        
-- zad 7!!!!???
select d.name,e.name, de.quantity
from equipment e join dep_eq de on (e.eq_id=de.eq_id)
		 join departments d on (d.dep_id=de.dep_id)
       left join employees emp on (d.dep_id=emp.dep_id )
		join positions p on (p.pos_id=emp.pos_id and p.name='Ekspert')
        having
        group by e.name, d.name  order by d.name, e.name;
-- having p.name='Ekspert'
-- zad 8
select p.name, count(*) as 'liczba prac'
from employees e join departments d on (e.dep_id=d.dep_id and d.name='Sprzedaż')
					join positions p on (p.pos_id=e.pos_id)
                    group by p.name order by count(*);
-- zad 9
-- select p.name, count(*) as 'liczba prac', count(case when e.gender='F' then 1 end), count(case when e.gender='M' then 1 end)
-- from employees e join departments d on (e.dep_id=d.dep_id and d.name='Marketing')
	-- join positions p on (p.pos_id=e.pos_id)
      --              group by p.name order by count(*);

select case when e.gender='F' then 'kobieta' else 'meżczyzna' end 'płeć', count(*) as 'liczba prac', count(case when e.gender='F' then 1 end), count(case when e.gender='M' then 1 end), max(salary)
from employees e join departments d on (e.dep_id=d.dep_id and d.name='Marketing')
					join positions p on (p.pos_id=e.pos_id)
                    group by e.gender order by count(*);
                    
-- zad 10
select d.name, count(e.emp_id), count(e.allowance>0)
from employees e join departments d on (e.dep_id=d.dep_id)
					join positions p on (p.pos_id=e.pos_id ) 
               where p.name in ('Specjalista', 'Starszy Specjalista')
               group by d.name;
-- zad 11
select p.name, year(hire_date), round(avg(e.salary),2), count(e.emp_id)
from employees e join positions p on (p.pos_id=e.pos_id ) 
               
               group by p.name, year(hire_date)
               order by p.name, year(hire_date);
-- zad 12 !!!
select e.emp_id,e.first_name, count(c.account_manager_id)
from employees e join customers c on (e.emp_id=c.account_manager_id)
	group by e.emp_id
    having count(c.account_manager_id)>=3;
-- zad13
select p.proj_id, p.name,count(e.emp_id)
from projects p join project_participants pp on (p.proj_id=pp.proj_id)
		join employees e on (e.emp_id=pp.emp_id)
        group by p.proj_id
        having count(e.emp_id)>=5;
 -- zad 14
 select e.name, count(de.dep_id)
 from equipment e join dep_eq de on (e.eq_id=de.eq_id)
 group by e.name
 having count(de.dep_id)>2 
 order by e.name;
 -- zad 15
 select e.emp_id, count(c.account_manager_id), group_concat(c.name separator ', ')
from employees e join customers c on (e.emp_id=c.account_manager_id)
	group by e.emp_id;
 -- zad 16 ???1!!
 select jg.jg_id, jg.name, group_concat(e.last_name, ' (',ifnull(d.name,'---'),') ' order by e.last_name separator ' - ' )
 from employees e right join job_grades jg on (e.jg_id=jg.jg_id)
					left join departments d on (e.dep_id=d.dep_id)
 group by jg.name
 order by jg.jg_id;
-- zad 17
select pr.name
from projects pr
except
select pr.name
from employees e join departments d on (d.dep_id=e.dep_id and d.name='Sprzedaż')
				join project_participants pp on (pp.emp_id=e.emp_id)
                join projects pr on (pr.proj_id=pp.proj_id);
-- zad 19
select d.name
from employees e join departments d on (d.dep_id=e.dep_id)
group by d.dep_id
having count(e.emp_id)=3 or count(e.emp_id)=10
intersect
select d.name
from departments d join dep_eq de on (d.dep_id=de.dep_id)
group by d.dep_id
having count(de.eq_id)=5;
                
-- zad 18 
select concat(e.last_name,' ',e.first_name ) as 'Nazwisko i ime pracownika', 
	if(e.gender = 'F', 'opiekunka klienta', 'opiekun klienta') as 'rodzaj zaangazowania',
	group_concat(c.name separator ', ') as 'szczegoly zaangzowania'
from employees e 
join customers c on (e.emp_id = c.account_manager_id)
group by c.account_manager_id
union all
select concat(e.last_name,' ',e.first_name ) , 'projekty', group_concat(pr.name separator ', ') 
from employees e 
join project_participants pp on (e.emp_id = pp.emp_id)
join projects pr on (pr.proj_id = pp.proj_id)
group by e.emp_id
order by 1;
