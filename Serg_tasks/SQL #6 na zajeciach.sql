--podazpytania nieskorelowane SQL #6 na zajeciach
--zad3 jednowierszowe
select * from Pracownicy
where id_department=(select id_department from Departments where name='IT')

--zad7
select * from Pracownicy
where pensja> (select AVG(pensja) from Pracownicy
				where id_department=2
				group by id_department
				)
--zad 8
select * from Pracownicy
where pensja = (select max(pensja) from Pracownicy)

--zad9
select d.id_department, min(pensja), name from Departments d
join Pracownicy p on p.id_department=d.id_department
group by d.id_department, name
having min(pensja)>(select AVG(pensja) from Pracownicy
						where id_stanowiska=1)

--zad10
with cte_max_min
as(
select id_department, max(pensja+dodatek)as max, min(pensja+dodatek) as min
from Pracownicy
group by id_department
)
select d.name,* from cte_max_min
join Departments d on d.id_department=cte_max_min.id_department
--zad11
with cte_pensja
as (
select id_stanowiska,AVG(pensja) as srednia_stanowisko from Pracownicy 
group by id_stanowiska
),
cte_pensja_dzial
as (
select id_department, AVG(pensja) as srednia_dzial from Pracownicy
group by id_department
)
select p.*,srednia_stanowisko,
case 
when p.pensja>srednia_dzial then 'wiecej'
else 'gorzej'
end porownanie
from Pracownicy p
join cte_pensja on cte_pensja.id_stanowiska=p.id_stanowiska
join cte_pensja_dzial on cte_pensja_dzial.id_department=p.id_department

--zad16
select * from Pracownicy
where YEAR(data_zatrudnienia)=(select year(data_zatrudnienia) from Pracownicy where id_pracownika=7) 
		and 
		id_grupy=(select id_grupy from Pracownicy where id_pracownika=7)
