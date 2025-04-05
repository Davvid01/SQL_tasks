insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages)
values ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

select distinct CONCAT(author_fname, ' ',author_fname) from books; -- WORKS but below better

select distinct author_fname, author_lname from books;-- it also selects combinations disticnt of both colimns

select distinct author_fname, author_lname, released_year from books;

select top 5 title, pages from books order by released_year desc; -- we can sort by column we didnt select

select top 5 title, pages from books order by released_year desc; -- most recent

select title, pages from books order by released_year desc OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY; -- offsert skips first 3 rows, fetch goes through subsequnt 5 rows

select title, author_fname, author_lname from books where author_fname like '%da%' --gdziekolwiek w wyrazie bedzie da

select title, author_fname, author_lname from books where author_fname like 'da%' -- na samym poczatku tylko

select title, author_fname, author_lname from books where author_fname like '____' --wyraz musi miec 4 znaki

select title, author_fname, author_lname from books where author_fname like '_a_' --wyraz musi miec 3 znaki, drugi to a

select title, author_fname, author_lname from books where author_fname like '%n' -- na samym końcu tylko musi byc n, przed dowolnie

select title from books where title like '%\%%' escape '\'

select title from books where title like '%\_%' escape '\' -- we are looking for exaact underscore charecter in wword

select title from books where title like '%stories%'

select top 1 title, pages from books order by pages desc

select top 3 concat(title, ' ',released_year) as summary from books order by released_year desc

select title from books order by released_year desc offset 0 rows fetch next 3 rows only -- od drugiego 5 weirszy

select title, author_lname from books where author_lname like '% %'

select concat('my fav author is', ' ',upper(author_fname),  upper(author_lname)) as yell from books