--zad3 highlight + F5
select id_pracownika, imie, pensja, pensja * 1.1234,
round(pensja * 1.1234,1) as [pensja +12%],
round(pensja*1.1234,-2)
from Pracownicy;

--zad5
select *
from Departments
where len(name)>2;
--zad6
select id_pracownika, imie, nazwisko, imie + nazwisko,
CONCAT(imie, ' ', nazwisko)
from Pracownicy;
--zad7
select imie, nazwisko, 
CONCAT(left(imie, 1),'.', nazwisko)
from Pracownicy
where left(nazwisko,1) in ('B', 'G', 'K', 'T')	--The LEFT() function extracts a number of characters from a string (starting from left).
--zad8
select *,pensja+isnull(cast(dodatek as nvarchar),0) as 'pensja i bonus'
from pracownicy
--zad9
select *,pensja+dodatek as 'pensja i bonus', isnull(cast(dodatek as nvarchar),'---')
from pracownicy
--zad10
select *,
case 
when plec='K' then 60
when plec='M' then 65
else NULL
end 'wiek emerytalny'
from Pracownicy
--zad11
select *, 
case 
when pensja> 8000 then pensja*0.3
when pensja between 6000 and 8000 then 0.5*pensja
when pensja between 4000 and 6000 then 0.8*pensja
else pensja
end 'dodatek do pensji'
from Pracownicy

case
        when salary > 8000 then 0.3
        when salary >6000  then 0.5
        when salary > 4000  then 0.8 -- mozna to skroic bo program leci od góry w dół wiec zapamietuje powyzszer widelki/bariere
        else 1.0
        end * salary as 'dodatek na Boze narodzenie'
        from employees;
--zad12
SELECT CURRENT_TIMESTAMP
--zad13
select*, YEAR(data_zatrudnienia), MONTH(data_zatrudnienia), DAY(data_zatrudnienia)
from Pracownicy
where id_department=3
--zad14
select*, YEAR(data_zatrudnienia) as rok, MONTH(data_zatrudnienia), DAY(data_zatrudnienia), year(CURRENT_TIMESTAMP)-YEAR(data_zatrudnienia) as 'staż w fimie'
from Pracownicy
--zad15
select *, DATEADD(year, 10,data_zatrudnienia) as 'jubileusz'
from Pracownicy
where year(CURRENT_TIMESTAMP)-YEAR(data_zatrudnienia)<9
--zad16
select *
from Pracownicy
where DATEDIFF(DAY,data_zatrudnienia, EOMONTH(data_zatrudnienia)) <15
