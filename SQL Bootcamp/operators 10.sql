select title from books where title not like '% %';

select title, author_fname, author_lname from books where author_fname not like 'da%';

select title, author_fname, author_lname from books where author_fname not like '%e%';

select * from books where author_fname='Dave' and released_year>2010
and title like '%novel%';

select 3>1;

select title from books where len(title)> 30 and pages >500

select title, released_year from books where released_year between 2004 and 2015

select title, released_year from books where pages not between 200 and 300

select * from people where birthdate < '2005-01-01' 

select * from people where year(birthdate) < 2005

select * from people where birthtime <'12:00:00'

select * from people where hour(birthtime) <12


--**CAST transform some data type to the other


select cast ('09:00:00' as time) 
select *from people where birthtime 
between cast('12:00:00' as time) and cast('16:00:00' as time)

select * from pepole where hour(birthtime) between 12 and 16

select title, author_lname from books 
where author_lname in ('Carver', 'Lahiri', 'Smith')

select title, author_lname from books 
where author_lname not in ('Carver', 'Lahiri', 'Smith')

-- MODULO %

select title, released_year from books where released_year>=2000
and released_year%2=1 -- even years only

 select * from books where pages is null

 select * from books where author_fname like 'C%' or author_fname like 'S%'
  select * from books where substr(author_fname,1,1) in ('C%','S%')


 select title, author_fname,
 case
 when title like '%stories%' then 'short stories'
  when title = 'just kids' then 'memoir'
 else 'novel'
 end as type
 
 from books 

 SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

