select CURRENT_TIMESTAMP

SELECT CAST(GETDATE() AS DATE) AS current_date_;

select GETDATE ( ),GETUTCDATE ( )

select DAY(CURRENT_TIMESTAMP)
select year(CURRENT_TIMESTAMP)
select month(CURRENT_TIMESTAMP)

--select DAYofweek(CURRENT_TIMESTAMP)
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-12-25', '9:00:19', '1985-12-25 9:00:19');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '2021-12-25', '10:00:19', '2021-12-25 10:00:19');

select name, birthtime, date(birthtime) from people

'April 11 1985'

--ALL ABOUT DATES (not time)
select concat(MONTH(birthdate),'%b') from people
select format(birthdate,'BORN ON: MMM dd yyyy') as month_abbr from people --zmieniam miesiac na nazwe slowna 
--https://learn.microsoft.com/en-us/sql/t-sql/functions/datename-transact-sql?view=sql-server-ver16
--DATEDIFF(interval, date1, date2)
select birthdate, datediff(day, birthdate, GETDATE()) from people

select birthdate, datediff(hour, birthtime, CURRENT_TIMESTAMP) from people --does not work

select dateadd(year,1, getdate())

select birthdate, dateadd(month, -9, birthdate) from people --subtracting

------------TIME----------
select datediff(hour,GETDATE() as time, '7:00:00') 
--Server traktuje to jako '1900-01-01 07:00:00', czyli domyślną datę z czasem.
-- W SQL Server nie możesz nadać aliasu (AS time) wewnątrz funkcji

select getdate(), cast(cast(getdate() as date) as datetime)+ '3:00:00'
select datediff(hour,GETDATE(), cast(cast(getdate() as date) as datetime)+ '7:00:00')

select year(dateadd(year,-18, getdate())) as year_maturity_legal

select getdate() -- TIMESTAMP --it is just a format less space than datetime but only 1970-2038

create table captions2(
text varchar(150),
created_at datetime default getdate(), --tak w kursie:timestamp default current_timestamp,
updated_at datetime
)

--excercies
select FORMAT(current_timestamp, 'curr_time MMM/dd/yyyy')

create table tweets(
content varchar(180),
username varchar(50),
created_at datetime default current_timestamp
)
--CHAR IS good for fixed strings which are the same in size. lenghth
--varchar is generally more efficient


