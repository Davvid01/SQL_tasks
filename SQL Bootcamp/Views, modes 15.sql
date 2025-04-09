-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
 
-- WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;

create view ordered_series as
select top 100 percent * from series order by released_year 

select * from ordered_series

insert into ordered_series (title, released_year, genre)
values ('The great', 2009,'Animation') -- added to just the View 
-- it is added to main table
--Co gdybyś chciał, żeby dane nie wpływały na series?
--Wtedy nie używaj widoku — zamiast tego stwórz np. nową tabelę lub widok tylko do odczytu, np. z złożoną logiką (wtedy SQL Server nie pozwoli na INSERT).
select * from series

create or replace view ordered_series as -- w TSQL należy usunąć VIew i stworzyc dopiero nowy
select * from series order by released_year desc

drop view ordered_series

create view ordered_series
select top 100 percent *
from series
order by released_year DESC

select AVG(rating) from full_reviews
select title, avg(rating) from full_reviews group by title with rollup
--ROLLUP na koncu komorka ze srednia wszystkich wierszy powyzej

select released_year, genre, avg(rating)
from full_reviews
group by released_year, genre with rollup
-- wiersze z null to srednia CAŁEGO ROKu bez znaczenia genre

select @@global.sql_mode

set session sql_mode='ONLY_FULL_GROUP_BY'