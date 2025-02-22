/*Create table Departments (
id_department INT Identity(1,1) PRIMARY KEY,
name NVARCHAR(255) NOT NULL,
location NVARCHAR(255)
);

CREATE TABLE Positions (
    id_stanowiska INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    bonus DECIMAL(10,2) NULL
);
CREATE TABLE Grupy_Zaszeregowan (
    id_grupy INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL
);
CREATE TABLE Pracownicy (
    id_pracownika INT IDENTITY(1,1) PRIMARY KEY,
    imie NVARCHAR(100) NOT NULL,
    nazwisko NVARCHAR(100) NOT NULL,
    plec CHAR(1) CHECK (plec IN ('K', 'M')) NOT NULL,
    data_zatrudnienia DATE NOT NULL,
    pensja DECIMAL(10,2) NOT NULL,
    dodatek DECIMAL(10,2) NULL,
    id_stanowiska INT NULL,
    id_department INT NULL,
    id_grupy INT NULL,
	foreign key (id_stanowiska) references Positions(id_stanowiska),
	foreign key (id_department) references Departments(id_department),
	foreign key (id_grupy) references Grupy_Zaszeregowan(id_grupy)
	);

	
CREATE TABLE Projekty (
    id_projekt INT IDENTITY(1,1) PRIMARY KEY,
    nazwa NVARCHAR(255) NOT NULL
);
Create table Pracownicy_Projekty (
id_pracownika int,
id_projekt int,
foreign key (id_pracownika) references Pracownicy(id_pracownika),
foreign key (id_projekt) references Projekty(id_projekt)
);

Create table Urzadzenia (
id_urzedzenie INT IDENTITY(1,1), --the id column will start from 1 and increase by 1 for each new row.
nazwa NVARCHAR(255) not null,
id_department int null,
foreign key (id_department) references Departments(id_department)
);

Insert into Departments (name, location) 
values 
('IT', 'Warszawa'),
('HR', 'Kraków'),
('Finance', 'Gdańsk');

insert into positions (name, salary, bonus) values
('Software Developer', 9000, 1000),
('HR Specialist', 7000, 500),
('Financial Analyst', 8000, NULL),
('Project Manager', 11000, 2000);
 
insert into Grupy_Zaszeregowan (name) values
('Junior'),
('Mid'),
('Senior'),
('Lead');

insert into Pracownicy (imie, nazwisko, plec, data_zatrudnienia, pensja, dodatek, id_stanowiska, id_department, id_grupy) 
values ('Adam', 'Kowalczyk', 'M', '2019-02-14', 8800, 600, 1, 1, 2),
('Ewa', 'Jankowska', 'K', '2015-05-21', 9700, 800, 3, 3, 3),
('Łukasz', 'Lewandowski', 'M', '2018-07-10', 12500, 2000, 4, 2, 4),
('Magdalena', 'Zielińska', 'K', '2022-01-05', 7500, NULL, 2, 2, 1),
('Paweł', 'Szymański', 'M', '2016-11-15', 10800, 1300, 4, 1, 4),
('Katarzyna', 'Wójcik', 'K', '2020-09-08', 8200, 500, 1, 1, 2),
('Piotr', 'Kamiński', 'M', '2019-06-30', 9400, 700, 3, 3, 3),
('Agnieszka', 'Dudek', 'K', '2017-04-19', 11300, 1800, 4, 2, 4),
('Marek', 'Nowicki', 'M', '2021-12-11', 7300, NULL, 2, 2, 1),
('Joanna', 'Lis', 'K', '2018-02-28', 9900, 1100, 4, 1, 4),
('Tomasz', 'Kaczmarek', 'M', '2017-10-23', 10200, 1200, 4, 1, 4),
('Sylwia', 'Mazur', 'K', '2016-09-17', 8700, 600, 1, 1, 2),
('Krzysztof', 'Pawlak', 'M', '2020-03-12', 9100, 650, 3, 3, 3),
('Natalia', 'Czarnecka', 'K', '2019-05-07', 11800, 1900, 4, 2, 4),
('Bartosz', 'Górski', 'M', '2022-08-15', 7400, NULL, 2, 2, 1),
('Karolina', 'Adamska', 'K', '2015-06-30', 10400, 1400, 4, 1, 4),
('Michał', 'Sikora', 'M', '2019-07-21', 9200, 700, 3, 3, 3),
('Dominika', 'Kubiak', 'K', '2020-04-15', 11500, 2000, 4, 2, 4),
('Rafał', 'Baran', 'M', '2021-01-09', 7600, NULL, 2, 2, 1),
('Aleksandra', 'Witkowska', 'K', '2018-11-25', 10000, 1000, 4, 1, 4),
('Wojciech', 'Malinowski', 'M', '2017-03-18', 9800, 900, 3, 3, 3),
('Emilia', 'Ostrowska', 'K', '2019-08-05', 11600, 2100, 4, 2, 4),
('Patryk', 'Zawadzki', 'M', '2022-06-14', 7800, NULL, 2, 2, 1),
('Zofia', 'Piotrowska', 'K', '2016-12-02', 10600, 1500, 4, 1, 4);

INSERT INTO Urzadzenia (nazwa, id_department) VALUES 
('Laptop Lenovo ThinkPad', 1),
('Monitor Dell 27"', 1),
('Telefon Samsung Galaxy', 2),
('Tablet iPad Air', 2),
('Drukarka HP LaserJet', 3),
('Projektor Epson', 3),
('Laptop MacBook Air', 1),
('Serwer Dell PowerEdge', 1),
('Telefon iPhone 14', 2),
('Laptop ASUS ZenBook', 3),
('Komputer stacjonarny HP', 1),
('Monitor LG UltraFine', 1),
('Router Cisco', 1),
('Dysk sieciowy Synology', 1),
('Klawiatura mechaniczna Logitech', 2),
('Skaner Canon', 3),
('Laptop Acer Predator', 1),
('Monitor Samsung Curved', 1),
('Stacja dokująca Dell', 1),
('Laptop HP EliteBook', 1),
('Tablet Samsung Galaxy Tab', 2),
('Telefon Google Pixel', 2),
('Serwer IBM', 1),
('Laptop Huawei MateBook', 3),
('Monitor BenQ', 1),
('Komputer Apple Mac Mini', 1),
('Drukarka Brother', 3),
('Switch Netgear', 1),
('Laptop MSI Creator', 1),
('Monitor Philips 32"', 1);

insert into Projekty (nazwa) values
('System CRM dla firmy X'),
('Aplikacja mobilna do zarządzania finansami'),
('Platforma e-learningowa dla szkół'),
('System ERP dla sektora medycznego'),
('Automatyzacja procesów HR'),
('Analiza danych sprzedażowych'),
('Migracja systemów do chmury'),
('Aplikacja IoT do monitorowania temperatury'),
('Strona internetowa dla e-commerce'),
('System zarządzania flotą pojazdów'),
('Integracja API dla bankowości'),
('Rozwój sztucznej inteligencji w analityce'),
('System rezerwacji online'),
('Chatbot obsługi klienta'),
('Optymalizacja procesów logistycznych'),
('Rozwój bazy danych klientów'),
('System rozliczeń księgowych'),
('Tworzenie aplikacji fitness'),
('Rozbudowa systemu raportowego'),
('Projektowanie UX/UI dla nowego produktu');



INSERT INTO Pracownicy_Projekty (id_pracownika, id_projekt) VALUES
(1, 1), (1, 3), (1, 5),
(2, 2), (2, 4), (2, 6),
(3, 1), (3, 7), (3, 9),
(4, 2), (4, 8), (4, 10),
(5, 3), (5, 5), (5, 11),
(6, 4), (6, 6), (6, 12),
(7, 1), (7, 7), (7, 13),
(8, 2), (8, 9), (8, 14),
(9, 3), (9, 10), (9, 15),
(10, 4), (10, 8), (10, 16),
(11, 5), (11, 17), (11, 19),
(12, 6), (12, 11), (12, 20),
(13, 7), (13, 9), (13, 18),
(14, 8), (14, 12), (14, 14),
(15, 9), (15, 13), (15, 15),
(16, 10), (16, 11), (16, 17),
(17, 1), (17, 5), (17, 16),
(18, 2), (18, 3), (18, 20),
(19, 3), (19, 7), (19, 14),
(20, 4), (20, 10), (20, 12),
(21, 5), (21, 6), (21, 15),
(22, 6), (22, 8), (22, 19),
(23, 7), (23, 9), (23, 11),
(24, 8), (24, 10), (24, 13);
*/
select id_pracownika, id_projekt from Pracownicy_Projekty;