use omega;

-- zad 3
select jg_id, avg(salary), min(salary), max(salary) from employees
group by jg_id;

-- zad 4
select dep_id, avg(salary), min(salary), max(salary) from employees where  dep_id in (10,30,50)
group by  dep_id;
-- zad 5
select pos_id, avg(salary), min(timestampdiff(year, hire_date, curdate())) from employees where dep_id in (30)
group by pos_id
order by pos_id;

-- zad 6
select emp_id, dep_id, min(salary), max(salary), max(salary)-min(salary) from employees where year(hire_date) = 2001;
-- min i max powoduje ze oautomatycznie program szukam najwiekszej i najnzieszj wartosci w ty zbiorze

-- zad 7
select  min(salary), max(salary) from employees where pos_id in (3,4,5); -- jeżeli potrzebuje min,max salary i nie potrzebuje inf w jakich działach to bez group by
-- zad 8
select sum(salary+ifnull(allowance,0)) from employees;

-- zad 9
select min(hire_date) from employees;

-- zad 10
select count(*) from customers;

-- zad 11
select jg_id, count(*) from employees
group by jg_id;

-- zad 12
select year(hire_date) 'rok zatrudnienia', count(*) 'liczba pracowników'from employees
group by year(hire_date) order by hire_date;

-- zad 13
select pos_id, count(*), count(allowance) from employees group by pos_id; -- jezeli dam ifnull to wtedy program widzi dodatek 0 jako dodatek ktory pracownik otrzymuje w wartosci 0 xd

-- zad 14
select  length(last_name), avg(salary), count(length(last_name)) from employees group by length(last_name)
order by length(last_name);

-- zad 15
select count(allowance) from employees;

-- zad 16
select dep_id, count(distinct jg_id) from employees group by dep_id; #W tym zapytaniu używamy DISTINCT, aby wybrać unikalne grupy zaszeregowania płacowego, a następnie używamy funkcji COUNT, aby obliczyć liczbę tych unikalnych grup. 

-- zad 17
select pos_id, count(distinct jg_id) from  employees  where pos_id<=4 group by pos_id; 
-- zad 18
select jg_id, dep_id,  count(emp_id), avg(salary) from employees 

group by jg_id, dep_id -- jak chce pogrupowac po dwoch kateogriach i znalezc ile znajde sie pracownikow dla kazdej kombinacji to daje z przecinkiem
order by jg_id, dep_id;

-- zad 19
select 
case
when salary<4000 then 'grupaA'
when salary<=8000 then 'grupaB'
when salary>8000 then 'grupaC'
end as 'zestawienie_placowe',
count(emp_id)
from employees
group by zestawienie_placowe
order by zestawienie_placowe; 

-- zad 20
select manager_id,round( avg(salary),2), count(emp_id) from employees 
group by manager_id
having count(emp_id)>5;

-- zadd21
select dep_id, hire_date, count(emp_id), min(hire_date)  from employees
where pos_id in(2,4,9)
 -- group by dep_id having year(hire_date)<1999; w tym przypadku filtruje po hire_date wysiweltonym na ekranie czyli 2001 dlatego odrzuyca dep 40
 
 group by dep_id having year(min(hire_date))<1999;

-- zad 22
select pos_id, count(emp_id), min(salary), max(salary), sum(salary), sum(ifnull(allowance,0)), sum(salary) + sum(ifnull(allowance,0)) , sum(salary+ ifnull(allowance, 0))  from employees 
 where ifnull(allowance,0) <1000 
 group by pos_id having sum(salary+ifnull(allowance,0))  <20000; -- zle
 
 -- zad 23
 select dep_id, count(emp_id),coalesce( count(salary>6000 )) from employees 
 group by dep_id ;
 
 -- zad 24
 select floor(year(hire_date)/10)*10, count(*) from employees group by hire_date;




