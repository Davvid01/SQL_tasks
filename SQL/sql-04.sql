use omega;

-- zad3
-- select e.*,'---', p.* 
select e.emp_id, e.first_name, e.last_name, p.pos_id, p.name
from employees e join positions p on (e.pos_id=p.pos_id);

select e.emp_id, e.first_name, e.last_name, p.pos_id, p.name
from employees e inner join positions p on (e.pos_id=p.pos_id);

select e.emp_id, e.first_name, e.last_name, p.pos_id, p.name
from employees e join positions p using (pos_id);

select e.emp_id, e.first_name, e.last_name, p.pos_id, p.name
from employees e natural join positions p;

-- zad4
select t.*, '---', e.*
from positions t join employees e on (t.pos_id=e.pos_id);

-- *******
-- zad3
-- select e.*,'---', p.* 
select e.emp_id, e.first_name, e.last_name, p.pos_id, p.name
from employees e join positions p on (e.pos_id=p.pos_id);

-- zad4
select t.*, '---', e.* -- nie ma znaczeznia kolejnosc łaczenia po 'from' ,ale sposob graficznej prezentacji jest wazny i zalezy od kolejnosci po  'select'
from positions t join employees e on (t.pos_id=e.pos_id);

-- zad5
-- select g.*, '---', t.*
-- select 
-- from customers g join employees t on (g.account_manager_id=t.emp_id);

-- zad6 
select e.*,'--', d.*
from employees e join departments d on(e.dep_id=d.dep_id and d.name = 'Marketing'); 

select e.*,'--'
from employees e join departments d on(e.dep_id=d.dep_id and d.name = 'Marketing'); -- filtrujemy po to zebty zrobic selekcje tylko po marketing

-- zad 7
select e.emp_id, e.first_name, e.last_name, e.hire_date, jg.name
from employees e join job_grades jg  on (e.jg_id=jg.jg_jd)
where month(e.hire_date) in (1,3,7,9);
-- zad 8
select e.emp_id, e.first_name,e.last_name, p.name,jg.name, d.name
from employees e join positions p on (e.pos_id=p.pos_id)
					join job_grades jg on (e.jg_id=jg.jg_id)
					join departments d on (e.dep_id=d.dep_id);
-- zad9
select e.*,'---', d.*
from employees e join departments d on(e.dep_id=d.dep_id);

select e.*,'---', d.*
from employees e  left join departments d on(e.dep_id=d.dep_id); -- left powoduje wyswieltenie NULL

-- 10
selectd.*, '--', e.*
from departments d left join employees e on (d.dep_id=e.dep_id); -- left wywsiwetlilo dział IT i przypiwsało im NULL, wczeniej go nie było
select e.*, '--',d.*
from employees e  right join departments d on(e.dep_id=d.dep_id);

-- 11
select e.*,'--', c.*
	from employees e join departments d on (e.dep_id=d.dep_id and d.name='Sprzedaz')
					left join customers c on (e.emp_id=c.account_manager_id) order by e.emp_id;

-- 12
select e.emp_id, e.first_name,e.last_name, e.manager_id, '--',
		m.emp_id, m.first_name,m.last_name
	from employees e join employees m on (e.manager_id=m.emp_id); -- tabele m=empl szuka mangagera i szuka w drugiej tavbeli employewes i przypisuj klucz do emp id
    
    -- zad13
    select e.emp_id, e.first_name, e.last_name, d.name,
			'--',
            m.emp_id,m.first_name,m.last_name, md.name
    from employees e join departments d on(e.dep_id=d.dep_id and e.dep_id in (20,40))
					join employees m on (e.manager_id=m.emp_id)
                    join departments md on (m.dep_id=m.dep_id);
	-- zad14
    select e.emp_id, e.first_name, e.last_name, e.pos_id, e.dep_id, '---',
			e2.emp_id, e2.first_name, e2.last_name, e2.pos_id, e2.dep_id
    from employees e join employees e2 on(e.pos_id=e2.pos_id and e2.dep_id=e.dep_id and e.emp_id<> e2.emp_id); --  po lewej jest dany pracownik, po prawej wymienieni sa wszyscy pracownicy z tym samym pos i 
																						-- nie potwarza tego samego pracownika
    -- zad 15
    select * from employees where year(birth_date)> 1980 and salary>6000;
    
    with emp_1980 as (
    select * from employees where year(birth_date)> 1980 and salary>6000
    )
    select* from emp_1980;
    
        with emp_1980 as (
    select * from employees where year(birth_date)> 1980 and salary>6000
    )
    select emp_id, first_name, last_name
    from emp_1980
    where salary > 6000;
    
    -- zad 16
    with emp_sales as (
		select e.*
        from employees e join departments d on (e.dep_id= d.dep_id and d.name='Sprzedaż')
    )
    select *
    from emp_sales
    where salary>6000;
-- zad 17
with emp_sales as (
		select e.*
        from employees e join departments d on (e.dep_id= d.dep_id and d.name='Sprzedaż')
    ),
    emp_sales_f as (
    select*
    from emp_sales
    where gender='F'
    ),
    emp_sales_f_80s as (
    select * 
    from emp_sales_f
    where year (birth_date) between 1980 and 1989
    )
    select*
    from emp_sales_f_80s;
    
    -- zad. 18
	select e.emp_id, e.first_name, e.last_name, d.name,
			'--',
            m.emp_id,m.first_name,m.last_name, md.name
    from employees e join departments d on(e.dep_id=d.dep_id )
					join employees m on (e.manager_id=m.emp_id)
                    join departments md on (m.dep_id=m.dep_id);
	with emp_dep as (
    select e.e*, d.name
    from employees e left join departments d on (e.dep_id=d.dep_id)
    )
    select*
    from emp_dep e join emp_dep m on (e.manager_id = m.emp_id);
    
    
    
    
    
    