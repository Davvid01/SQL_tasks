--zad3
select id_department, avg(pensja)
from Pracownicy
group by id_department
--zad4
select id_stanowiska, min(pensja), max(pensja), avg(pensja)
from Pracownicy
group by id_stanowiska
--zad5
select id_stanowiska, min(pensja), max(pensja), avg(pensja), MIN(DATEDIFF(YEAR, data_zatrudnienia, CURRENT_TIMESTAMP))
from Pracownicy
group by id_stanowiska
--zad6
select min(pensja), max(pensja),  max(pensja)-min(pensja)
from Pracownicy
where year(data_zatrudnienia) = 2022
 --min i max powoduje ze oautomatycznie program szukam najwiekszej i najnzieszj wartosci w ty zbiorze
 --zad7
 select min(pensja), max(pensja),  max(pensja)-min(pensja)
from Pracownicy
where id_stanowiska in (3,4)
--zad8
select sum(pensja), SUM(pensja+isnull(cast(dodatek as nvarchar),0))
from Pracownicy
--zad9
select min(data_zatrudnienia)
from Pracownicy
--zad10
select count(id_pracownika)
from Pracownicy
--zad11
select id_grupy, count(id_pracownika)
from Pracownicy
group by id_grupy
--zad12
select year(data_zatrudnienia), count(id_pracownika)
from Pracownicy
group by year(data_zatrudnienia) 
order by year(data_zatrudnienia) DESC
--zad13
select id_stanowiska, count(id_pracownika), count(dodatek)
from Pracownicy
group by id_stanowiska
--zad14
select len(nazwisko), avg(pensja), count(id_pracownika)
from Pracownicy
group by len(nazwisko)
--zad15
select count(dodatek)
from Pracownicy
--zad16
select id_department, count(distinct id_grupy)
from Pracownicy
group by id_department
--zad19
select 
case 
when pensja <4000 then 'Grupa A'
when pensja <8000 then 'Grupa B'
else 'Grupa C'
end 'grupy_placowe',
count(id_pracownika)
from Pracownicy
group by
    CASE 
        WHEN pensja < 4000 THEN 'Grupa A'
        WHEN pensja < 8000 THEN 'Grupa B'
        ELSE 'Grupa C'
    END;
--zad 20
select avg(pensja)
from Pracownicy
group by id_stanowiska
--zad 21
select id_department, count(id_pracownika), min(data_zatrudnienia)
from Pracownicy
where id_stanowiska in (2,4)
group by id_department
having min(year(data_zatrudnienia))<2016
--zad22
select id_stanowiska, COUNT(id_pracownika), min(pensja), max(pensja), sum(pensja)
from Pracownicy
where dodatek is null or dodatek <1000

group by id_stanowiska
having sum(pensja)<30000

--zad 14 na zajeciach
select substring(nazwisko,1,1) as pierwsza_litera, count(substring(nazwisko,1,1)) from Pracownicy
group by substring(nazwisko,1,1)

--zad16
select p.id_department, avg(pensja)
from Departments d
join Pracownicy p on p.id_department=d.id_department
group by p.id_department

select * from Positions

--zad17
select d.id_department, name, COUNT(pensja), sum(pensja)  from Departments d
join Pracownicy p on p.id_department=d.id_department
where pensja>8000
group by d.id_department, name
having MAX(pensja)>10000
