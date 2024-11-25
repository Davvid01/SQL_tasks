use omega;
 
 -- zad 10 
 select emp_id, first_name, last_name, salary, allowance, salary+ifnull(allowance, 0) 'całkowite wynagrodzenie' from employees where dep_id=20;
 
 -- zad 11
 select emp_id, first_name, last_name, salary, allowance, salary+ifnull(allowance, 0),
	if (salary+ifnull(allowance, 0)>6156.25, '😎','😢') 

    from employees;
 -- zad 12
 select emp_id, first_name, last_name, pos_id, salary, 
 case
 when pos_id = 1 then 'brak'
 when pos_id = 2 then 'brak'
 when salary<4000 then 3000
 when salary<7000 then 2000
 when salary>7000 then 1000
 
 end as 'wczasy pod gruszą'
 from employees;
 
 -- zad 13
 select * from employees where year(hire_date)=2001; 
 -- zad 14
 select emp_id, first_name, hire_date from employees where month(hire_date) between 5 and 8 order by hire_date;
 -- zad 15
 select emp_id, first_name, hire_date, last_day(hire_date)-hire_date+1 from employees ;
 -- zad 16
 select emp_id, last_name, hire_date,timestampdiff(year, hire_date,current_date())  from employees
 where allowance is null;
 -- zad 17
 select emp_id, first_name, last_name, hire_date,  date_add(hire_date, interval 25 year) from employees				-- date_add określa jak czas minął miedzy datą i czasem, który określam
 where timestampdiff(year, hire_date, current_date) between 23 and 25 order by date_add(hire_date, interval 25 year);
 
 -- zad 18
 select emp_id, first_name, last_name, birth_date, timestampdiff(year, birth_date, current_date) from employees where timestampdiff(year, birth_date, current_date)%2=0;
 
 -- zad 19
 select emp_id, first_name, last_name, birth_date, timestampdiff(year, birth_date, hire_date) 'wiek' from employees where timestampdiff(year, birth_date, hire_date) between 25 and 30;
 
 -- zad 20
 select emp_id, first_name, last_name, birth_date, gender,
 case
 when gender = 'M' then date_add(birth_date, interval 65 year)
 when gender like 'F' then date_add(birth_date, interval 60 year) 
 end  'data osiagniecia wieku emerytalnego'
 from employees;
 
 -- Zad21
 select emp_id, first_name, last_name, hire_date, birth_date, gender,
  case
 when gender = 'M' then timestampdiff(year, current_date, date_add(birth_date, interval 65 year))
 when gender = 'F' then timestampdiff(year, current_date, date_add(birth_date, interval 60 year)) 
 end  'data_osiagniecia_wieku_emerytalnego'
 from employees;