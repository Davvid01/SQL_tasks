Create table customers (
id int identity(1,1) primary key , --automatically generates an incrementing integer, starting at 1 and increasing by 1 for each new record.
first_name varchar(50),
last_name varchar(50),
email varchar(50) );

create table orders (
id int identity(1,1) primary key,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key (customer_id) references customers(id) on delete cascade -- usuwa zamowienia ktore byly przypisane do klucza foreign jesli usuniemy w tabeli customers daną osobę
);

insert into customers (first_name, last_name, email)
values ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

insert into orders (order_date, amount, customer_id)
values ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

select id from customers where last_name= 'George'
select * from orders where id=1

select * from orders where customer_id=(select id from customers where last_name= 'George')

select * from customers, orders -- błedne wyniki

-- inner join
select * from customers
join orders on orders.customer_id = customers.id

select first_name, last_name, SUM(amount) as total, count(orders.id) from orders
join customers on orders.customer_id = customers.id
group by first_name, last_name
order by total

--left join
select first_name, last_name, SUM(amount) as total, count(orders.id) from customers
left join orders on orders.customer_id = customers.id
group by first_name, last_name
order by total

--if null /isnull
select first_name, last_name, isnull(cast(sum(amount) as nvarchar),0) from customers
left join orders on orders.customer_id=customers.id
group by first_name, last_name

select first_name, last_name, isnull(cast(sum(amount) as nvarchar),0) from customers
right join orders on orders.customer_id=customers.id
group by first_name, last_name

drop table customers
delete from customers where last_name='George'

create table students (
id int
identity(1,1) primary key,
first_name varchar(50)
)
create table papers (
title varchar(50),
grade float,
student_id int,
foreign key (student_id) references students(id)
)

insert into students (first_name) values
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

insert into papers (student_id, title, grade) values
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students
join papers on papers.student_id=students.id

select * from students
left join papers on papers.student_id=students.id


select first_name, isnull(cast(title as nvarchar), 'missing') as title, isnull(cast(grade as nvarchar),0) as grade  from students
left join papers on papers.student_id=students.id

select first_name, AVG(isnull(grade,0)) as grade,
case
when AVG(isnull(grade,0))>60 then 'passing'
else 'failing'
end passing_status 
from students
left join papers on papers.student_id=students.id
group by first_name
order by grade desc

