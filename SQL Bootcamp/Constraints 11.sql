CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
insert into companies (name, address)
values ('blackbird auto', '123 spruce')

create table houses (
purchase_price int not null,
sale_price int not null,
constraint sprice_gt_pprice check (purchase_price<= sale_price) )

insert into houses (purchase_price, sale_price) values (100,200)

insert into houses (purchase_price, sale_price) values (300,250) --CHECK nie przepusci tych wrtosci

--ALTER TABLE

alter table companies
add  phone varchar(15)

select * from companies

alter table companies
add  employee_count int not null default 1;  -- it must have at least defalut number in case not null 0 1 etc

alter table companies
drop column phone

use [SQL Bootcamp]

--RENAME TABLE
--rename table companies to suppliers

alter table companies 
rename  to suppliers -- dziala w postgresql

exec sp_rename 'companies', 'suppliers' --TSQL tak w SQL

 select * from suppliers

alter table companies
rename column name to company_name -- dziala w postgresql

exec sp_rename 'suppliers', 'companies' -- zmienia nazwe tabeli

exec sp_rename 'companies.name', 'company_name', 'COLUMN' -- zmienia nazwe kolumny

EXEC sp_help 'companies'; -- sprawdzenie własciwoci kolumny

alter table companies
add constraint df_companies_comp_name default 'unknown' for company_name

alter table companies
alter column company_name varchar(100)

select* from houses

alter table houses
add constraint positive_pprice check(purchase_price>=0) -- nie podaje sie apostrofów

EXEC sp_help 'houses';

insert into houses (purchase_price, sale_price) values (-23,56)

alter table houses
drop constraint positive_pprice