/*
Created: 04.02.2024
Modified: 04.02.2024
Model: MySQL 8.0
Database: MySQL 8.0
*/

DROP DATABASE IF EXISTS debere_er_4_1;
CREATE DATABASE debere_er_4_1;
USE debere_er_4_1;

-- Create tables section -------------------------------------------------

-- Table courses

CREATE TABLE `courses`
(
  `course_id` Int NOT NULL,
  `name` Varchar(100) NOT NULL
)
;

ALTER TABLE `courses` ADD PRIMARY KEY (`course_id`)
;

ALTER TABLE `courses` ADD UNIQUE `course_id` (`course_id`)
;

-- Table classrooms

CREATE TABLE `classrooms`
(
  `classroom_id` Int NOT NULL AUTO_INCREMENT,
  `name/no_room` Varchar(100) NOT NULL,
  `building` Varchar(100),
  PRIMARY KEY (`classroom_id`),
  UNIQUE `classroom_id` (`classroom_id`)
)
;

-- Table Entity3

CREATE TABLE `Entity3`
(
  `course_id` Int NOT NULL,
  `classroom_id` Int NOT NULL
)
;

ALTER TABLE `Entity3` ADD PRIMARY KEY (`course_id`, `classroom_id`)
;

-- Table Entity4

CREATE TABLE `Entity4`
(
  `course_id` Int NOT NULL,
  `classroom_id` Int NOT NULL
)
;

ALTER TABLE `Entity4` ADD PRIMARY KEY (`course_id`, `classroom_id`)
;

-- Table schedule

CREATE TABLE `schedule`
(
  `activity_id` Varchar(100) NOT NULL,
  `course_id` Int NOT NULL,
  `classroom_id` Int NOT NULL,
  `time` Time NOT NULL,
  `weekday` Varchar(100) NOT NULL
)
;

CREATE INDEX `IX_Relationship7` ON `schedule` (`classroom_id`)
;

CREATE INDEX `IX_Relationship6` ON `schedule` (`course_id`)
;

ALTER TABLE `schedule` ADD PRIMARY KEY (`activity_id`)
;

-- Table time

CREATE TABLE `time`
(
  `time` Time
)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Entity3` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entity3` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entity4` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entity4` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `schedule` ADD CONSTRAINT `Relationship6` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `schedule` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

