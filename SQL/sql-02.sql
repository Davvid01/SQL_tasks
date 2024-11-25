use omega;
select* from employees;

-- zad 1
-- zad 2

-- zad 3
select emp_id, first_name, last_name, salary, 
round(salary*1.123,2) as 'pensja po podwyżce',          
round(salary*1.123,-2)  'pensja po podwyżce 2'			 -- drugi argument, do ilu miejsc po przecinku zaokrąglic , f. jednowierszowa - przetwarza dane z  1 wiersza
from employees;
-- zad 4
select emp_id, first_name, last_name, lower(first_name), upper(last_name)
from employees;

-- zad 5
select* -- length(name)
from departments where length(name)>10;

-- zad 6  
select emp_id, first_name, last_name, 
first_name + last_name,
	concat(first_name, ' ' ,last_name)		-- łaczy znaki
from employees;

-- zad 7 
select emp_id, first_name, last_name, -- left(first_name, 1), 
concat(left(first_name, 1), '. ' , last_name)
from employees
where left(last_name, 1) in ('B', 'G', 'K', 'T');

-- zad 8 
select emp_id, first_name, last_name,
salary, allowance, salary+allowance, 
salary +				ifnull(allowance, 0) from employees;						-- jezeli kulumna zawiera wartosci puste/null to wykorzystamy te funckje

-- zad 9 
select emp_id, first_name, last_name, salary, ifnull(allowance, '----') from employees;

-- zad 10 
select emp_id, first_name, last_name, gender,
-- if (gender = 'F',60,65) from employees;  -- działa gdy mamy tlyko 2 warunki 
case
when gender = 'F' then 60
when gender = 'M' then 65
else null
end 'wiek emerytalny'
from employees;

-- zad 11
select emp_id, first_name, last_name, salary,
		case
        when salary > 8000 then 0.3*salary
        when salary between 6000 and 8000 then 0.5*salary
        when salary between 4000 and 6000 then 0.8* salary -- mozna to skroic jak poniżej
        when salary < 8000 then 1.0*salary
        end as 'dodatek na Boze narodzenie'
        from employees;
        
  select emp_id, first_name, last_name, salary,      
case
        when salary > 8000 then 0.3
        when salary >6000  then 0.5
        when salary > 4000  then 0.8 -- mozna to skroic bo program leci od góry w dół wiec zapamietuje powyzszer widelki/bariere
        else 1.0
        end * salary as 'dodatek na Boze narodzenie'
        from employees;        
-- zad 12
select now();
select curdate();
select curtime();

select now(), curdate(), curtime();

select now(), curdate(), curtime()
from departments;

select now(), curdate(), curtime()
from dual;


-- zad 13
select emp_id, first_name, last_name, hire_date, 
		year (hire_date), month(hire_date), day(hire_date), dayname(hire_date)
        from employees where dep_id=30;
        
-- zad 14
select emp_id, first_name, last_name, birth_date,
	year(curdate()) - year(birth_date),
    timestampdiff(year, birth_date, curdate()),  -- rocznikowo ale z uwzględnieniem miesięcy
    timestampdiff(month, birth_date, curdate())/12
    
    from employees;

-- zad 15
select emp_id, first_name, last_name, hire_date,
date_add(hire_date, interval 10 year)		-- dodaje okreslona jednostke czasu
from employees
where timestampdiff(year, hire_date, curdate()) <9;  -- oblicza roznice miedzy 2 punktami

-- zad 16
select emp_id, first_name, last_name, hire_date -- last_day (hire_date) -- ostatni dzien miesiaca w korym zostalo sie zatrudnionym
from employees
where date_add(hire_date, interval 15 day) =last_date(hire_date);











