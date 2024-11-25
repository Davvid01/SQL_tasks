SELECT * FROM schedule;
SELECT * FROM courses;
INSERT INTO courses (course_id,name)
VALUES ('2','Bazy danych');
INSERT INTO `debere_er_4_1`.`courses`
(`course_id`,
`name`)
VALUES
(4,
'Rachunek prawdopodobienstwa');
SELECT * FROM classrooms;
INSERT INTO `debere_er_4_1`.`classrooms`
(
`name/no_room`)
VALUES
(
'407');

DELETE FROM `debere_er_4_1`.`classrooms`
WHERE classroom_id=2;


SELECT * FROM schedule;
INSERT INTO `debere_er_4_1`.`schedule`
(`activity_id`,
`course_id`,
`classroom_id`,
`time`,
`weekday`)
VALUES
(3,
9,
7,
'10:00',
'Czwartek');



