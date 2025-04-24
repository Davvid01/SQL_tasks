--SQL5 ZAAWANSOWANE LACZENIE TABEL I GRUPOWANIE DANYCH
--zad11
select d.id_department, string_agg((left(p.imie,1)+'. '+p.nazwisko), ', ' ) within group (order by nazwisko)  from Departments d
join Pracownicy	p on p.id_department=d.id_department
group by d.id_department
--zad15

UNION
select*
from Pracownicy
where id_department not in (1)
UNION 
select*
from Pracownicy
where id_department=2
--zad16
select * from Pracownicy
where id_stanowiska=1
union
select * from Pracownicy
where id_department=3
--zad18 Returns only the common rows between two result sets
select * from Pracownicy
where year(data_zatrudnienia)>2017
intersect
select * from Pracownicy
where pensja>8500

select * from Pracownicy
where year(data_zatrudnienia)>2017 and pensja>8500

--zad 19
select * from Departments
except 
select d.* from Departments d join Pracownicy p on (d.id_department=p.id_department and id_grupy=4)


select * from Pracownicy
where id_grupy not in (4) --to usuwa tylko pracownikow, a ja chcialem usuniecie calej grupy
where id_grupy!=4