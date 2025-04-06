select title from books where title not like '% %';

select title, author_fname, author_lname from books where author_fname not like 'da%';

select title, author_fname, author_lname from books where author_fname not like '%e%';

select * from books where author_fname='Dave' and released_year>2010
and title like '%novel%';

select 3>1;

select title from books where len(title)> 30 and pages >500

select title, released_year from books where released_year between 2004 and 2015

select title, released_year from books where pages not between 200 and 300


