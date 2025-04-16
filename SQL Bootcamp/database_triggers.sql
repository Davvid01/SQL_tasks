create database triggers

use triggers

create table users (
username varchar(100),
age int
)

delimiter $$ --zmieniam ; na dolary jako zaokczenie kwerendy
CREATE TRIGGER must_be_adult
ON Users
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE Age < 18
    )
    BEGIN
        RAISERROR('Must be an adult!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
$$
delimiter ; zmieniam spowrotem na ; jako zakonczenie
INSERT INTO users(username, age) VALUES ('Bobby', 23);
INSERT INTO users(username, age) VALUES ('Sally', 16);
INSERT INTO users(username, age) VALUES ('Sue', 54);
INSERT INTO users(username, age) VALUES ('Yang', 14);