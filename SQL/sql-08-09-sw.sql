use debere_edu;

-- zzad3 
create table students 
(
stu_id int auto_increment,
first_name varchar(30) not null,
middle_name varchar(30),
last_name varchar(40) not null,
album_number varchar(9) not null,
primary key(stu_id),
unique key uk_stu_id_album_number (stu_id, album_number)
);

select* from  students;
-- zad4
insert into students (/*tea_id*/ first_name, middle_name, last_name, album_number)
values
(/*0*/'Marta','Urszula','Biała',98675),(/*0*/'urszula','','Nieprószewska',10487)
;-- można pominac autoamatyczne uzupelnianie
delete from students
where stu_id=2;
-- zad5
create table course_enrollments
(
ce_id int auto_increment,
cou_id int not null,
stu_id int not null,
enroll_date date not null,
    primary key (ce_id),
    unique key uk_stu_cou (ce_id),
    constraint fk_stu_id foreign key (stu_id) references students(stu_id),
    constraint fk_cou_id foreign key (cou_id) references courses(cou_id)
);
SELECT 
    *
FROM
    course_enrollments;
-- zad6
INSERT INTO `debere_edu`.`teachers`
(`tea_id`,
`first_name`,
`last_name`,
`office`)
VALUES
(0,
'Anna',
'Jeziorak',
'pokoj 313 B');
INSERT INTO `debere_edu`.`courses`
(`cou_id`,
`name`,
`ects`,
`tea_id`)
VALUES
(0,
'Statystyka',
6,
(select tea_id from teachers where (first_name,last_name)=('Anna','Jeziorak')));
-- zad7
insert into course_enrollments (ce_id,cou_id,stu_id,enroll_date)
values
/*(0,1,1,current_date()),
(0,8,1,current_date())*/
(0,9,3,current_date()),
(0,10,3,current_date()),
(0,1,3,current_date()),
(0,1,4,current_date());
-- zad8
delete from	courses
where name='Mikroekonomia';
-- zad 9
alter table courses
drop foreign key fk_cou_id;-- brak zdefiniowanego klucza

show create table courses



