--podazpytania skorelowane SQL #7 na zajeciach
--zad8
with cte_ranking
as(
select *, rank() over(partition by id_department order by pensja desc) as ranking from Pracownicy
)
select * from cte_ranking
where ranking=1

select * from Pracownicy p1
where pensja=(select max(pensja) from Pracownicy p2 where p1.pensja=p2.pensja group by id_department)


select nazwisko from Pracownicy
where nazwisko like 'K%'

select CONCAT('pierwsza litera to: ', left(nazwisko,1)) from Pracownicy

select STRING_AGG(nazwisko, ',') from Pracownicy
group by id_grupy

--zad13
select id_department, count(id_pracownika) from Pracownicy
group by id_department

select name, id_department, (select count(id_pracownika) from Pracownicy p
								where p.id_department=d.id_department)
							from Departments d

update Pracownicy  set nazwisko='Johnson' where id_pracownika=108 
delete from Pracownicy where pensja is between (5000,6000)
update Pracownicy set pensja*10% where pensja is between 5000 and 6000 
delete from Pracownicy where id_pracownika=110