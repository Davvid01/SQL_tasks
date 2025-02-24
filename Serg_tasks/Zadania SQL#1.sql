///--zad1
select id_pracownika, imie, nazwisko, pensja, id_department
from Pracownicy
--zad2///
select grp.id_grupy, grp.name, min(p.pensja),max(p.pensja), (max(p.pensja)-MIN(p.pensja)) as roznica
from Grupy_Zaszeregowan grp
join Pracownicy p on p.id_grupy=grp.id_grupy
group by grp.name, grp.id_grupy