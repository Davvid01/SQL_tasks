--drop table cats;
CREATE TABLE cats (
    cat_id INT identity(1,1),
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
select * from cats 
where cat_id=age;

update employees set last_name='roosterbeard'--each row will be the same

update employees set current_status='laid-off', last_name='cares'

update cats set age=14
where name='Misty'
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

select * from cats
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
UPDATE cats SET name='Jack' WHERE name='Jackson'; 

delete from cats where name='Egg';
delete from employees; -- deletes all rows in a single column

delete from cats where age=4;
delete from cats where age=cat_id;
delete from cats; -- empty it out;

create database shirts_db;

use shirts_db;

create table shirts (
shirt_id int identity(1,1) primary key,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(5),
    last_worn INT
);

insert into shirts (article, color, shirt_size, last_worn)
values 	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);

	insert into shirts (article, color, shirt_size, last_worn)
	values ('polo shirt', 'purple', 'M', 50);

	select * from shirts
	where shirt_size='M'

	update shirts 
	set shirt_size='L'
	where article='polo shirt'

	update shirts 
	set last_worn=0
	where last_worn=15

	update shirts 
	set shirt_size='XS', color='off white'
	where color='white' 

	delete from shirts 
	where last_worn=200

		delete from shirts 
	where article='tank tops'

	delete from shirts
	drop table shirts