INSERT INTO courses (course_id,name)
VALUES
('1','Makroekonomia'),
('2','Bazy danych'),
('3','Finanse przedsiębiorstw'),
('4','Rachunek prawdopodobieństwa');


SELECT * FROM courses;
DELETE FROM `debere_er_4_1`.`classrooms`;

SELECT * FROM classrooms;
insert into classrooms (nameno_room) 
values
('028'),
('301'),
('311'),
('407');

SELECT * FROM schedule;


insert into schedule(activity_id, classroom_id, course_id, time, weekday)
values

((1),(select classroom_id from classrooms where nameno_room = '028'), (select course_id from courses where name = 'Makroekonomia'), '8:00','poniedziałek'),
((2),(select classroom_id from classrooms where nameno_room = '301'), (select course_id from courses where name = 'Makroekonomia'), '8:00','poniedziałek'),
((3),(select classroom_id from classrooms where nameno_room = '407'), (select course_id from courses where name = 'Makroekonomia'), '10:00','poniedziałek'),
((4),(select classroom_id from classrooms where nameno_room = '028'), (select course_id from courses where name = 'Makroekonomia'), '8:00','czwartek'),
((5),(select classroom_id from classrooms where nameno_room = '028'), (select course_id from courses where name = 'Makroekonomia'), '10:00', 'poniedziałek'),
((6),(select classroom_id from classrooms where nameno_room = '311'), (select course_id from courses where name = 'Makroekonomia'), '12:00', 'piątek'),
((7),(select classroom_id from classrooms where nameno_room = '311'), (select course_id from courses where name = 'Bazy danych'), '8:00','poniedziałek');

