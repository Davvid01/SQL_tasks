use debere_edu;

-- zad 3
create table teachers 
(
	tea_id int auto_increment primary key, -- autoamcztyczne nadawanie wartosci
    first_name varchar(30) not null, -- typ znakowy variable characters, może byc rozmiar znaku maksymalnie 30 - jezeli jan to zajeste 3 bity na dysku , maksymilian 11
    last_name varchar(40) not null, -- klucz podstawowy oznacza że nie bedzie wartosci pustych
    office varchar(20), -- moze miec wartosci puste
   --  primary key(tea_id),teachers -- mowi brak wartosci pustch i to wartosci unikalne, 
    unique key uk_tea_full_name (first_name, last_name) -- jeżeli klucz opeira na jednej kolumnie to można go przypisac przy definicjji kolumn
    
);

desc teachers;
show full columns from teachers;
show create table teachers;

-- zad4
insert into teachers (/*tea_id*/ first_name, last_name, office)
values
(/*0*/'Ewa','Minge','2.3 CEUE');-- można pominac autoamatyczne uzupelnianie

select * from teachers;
-- zad5
INSERT INTO `debere_edu`.`teachers`
(`tea_id`,
`first_name`,
`last_name`,
`office`)
VALUES
(0,
'Arnold',
'Boczek',
'pokoj 318 A');
INSERT INTO `debere_edu`.`teachers`
(`tea_id`,
`first_name`,
`last_name`,
`office`)
VALUES
(0,
'Helga',
'Krupa',null
);
-- zad5
insert into teachers (first_name, last_name, office)
values
('Helga', 'Krupa', '20 B');
-- zad6
alter table teachers
drop key uk_tea_full_name;
-- zad7
alter table teachers
	add constraint chk_tea_last_name check(length(last_name) > 2);

insert into teachers (first_name, last_name)
values
('Yuping', 'Zhu');

insert into teachers (first_name, last_name)
values
('huang', 'Li');

-- zad8
alter table teachers
	add middle_name varchar(30) after first_name,
    add phone varchar(20)  not null default '---';

-- zad9
create table courses
(
cou_id int auto_increment primary key,
name varchar(100) not null unique key,
ects int(3),
tea_id int,
foreign key (tea_id) references teachers(tea_id) -- czy potrzebne jest nazwanzie klucza? constraint fk_cou_tea_id foreign key (tea_id) references teachers(tea_id)
);
-- zad10
insert into courses (cou_id,name,ects,tea_id)
values
-- (0,'Bazy danych',6,(select tea_id from  teachers where last_name='Minge')),
(0,'Mikroekonomia',5,2),
(0,'Matematyka',7,3);
-- zad11
delete from teachers 
where tea_id=1;

update courses
set tea_id = null
where tea_id = (select tea_id
				from teachers
                where (first_name, last_name) = ('Ewa', 'Minge')
                );
                
select * from courses;




