USE AdventureWorks2019

/*Question 1:
Write a SQL Statement that will give you a count of each object type in the Adventure Works database. Order by count descending

Hint:
Use the sys.objects table
Select type_desc, count(*) as CNT
from sys.objects 
group by type_desc
order by 2 desc;

Q2

Select Count(Distinct sys.schemas.name) as SchemaName,
		Count(Distinct sys.tables.name) as TableName,
		Count(Distinct sys.columns.name) as COlumnsName
		from sys.tables
		inner join sys.columns
		on sys.tables.object_id = sys.columns.object_id
		inner join sys.schemas
		on sys.tables.schema_id = sys.schemas.schema_id /* laczy dwie tabele, lacznikiem jest schema_id*/

Select * from sys.tables

Select * from INFORMATION_SCHEMA.columns
where TABLE_NAME not in (Select TABLE_NAME
							from INFORMATION_SCHEMA.views)
--b
Select TABLE_SCHEMA,TABLE_NAME,Column_NAme from INFORMATION_SCHEMA.columns
where TABLE_NAME not in (Select TABLE_NAME
							from INFORMATION_SCHEMA.views)

--Q4/Q5
Select     O.name as FK_Name
    ,S1.name as SchemaName
    ,T1.name as TableName
    ,C1.name as ColumnName
    ,S2.name as ReferencedSchemaName
    ,T2.name as ReferencedTableName
    ,C2.name as ReferencedColumnName
	INTO Edited_AdventureWorks.dbo.Relationship
from sys.foreign_key_columns FKC
	INNER JOIN sys.objects O ON O.object_id = FKC.constraint_object_id
    INNER JOIN sys.tables T1 ON T1.object_id = FKC.parent_object_id
    INNER JOIN sys.tables T2 ON T2.object_id = FKC.referenced_object_id
    INNER JOIN sys.columns C1 ON C1.column_id = parent_column_id 
				AND C1.object_id = T1.object_id
    INNER JOIN sys.columns C2 ON C2.column_id = referenced_column_id 
				AND C2.object_id = T2.object_id
    INNER JOIN sys.schemas S1 ON T1.schema_id = S1.schema_id
    INNER JOIN sys.schemas S2 ON T2.schema_id = S2.schema_id
	-- where O.name = 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'

--Q5
-- Create Database Edited_AdventureWorks
USE AdventureWorks2019;

-- Select * from AdventureWorks2019.sys.tables
Select     O.name as FK_Name
    ,S1.name as SchemaName
    ,T1.name as TableName
    ,C1.name as ColumnName
    ,S2.name as ReferencedSchemaName
    ,T2.name as ReferencedTableName
    ,C2.name as ReferencedColumnName
	INTO Edited_AdventureWorks.dbo.Relationships2
from sys.foreign_key_columns FKC
	INNER JOIN sys.objects O ON O.object_id = FKC.constraint_object_id
    INNER JOIN sys.tables T1 ON T1.object_id = FKC.parent_object_id
    INNER JOIN sys.tables T2 ON T2.object_id = FKC.referenced_object_id
    INNER JOIN sys.columns C1 ON C1.column_id = parent_column_id 
				AND C1.object_id = T1.object_id
    INNER JOIN sys.columns C2 ON C2.column_id = referenced_column_id 
				AND C2.object_id = T2.object_id
    INNER JOIN sys.schemas S1 ON T1.schema_id = S1.schema_id
    INNER JOIN sys.schemas S2 ON T2.schema_id = S2.schema_id

	Select  FK_Name, count(*) as CNT from Edited_AdventureWorks.dbo.Relationships2
	group by FK_Name
	order by 2 desc

		Select  Count(*) from Edited_AdventureWorks.dbo.Relationships2
		where ColumnName='BusinessEntityID'
		or ReferencedColumnName = 'BusinessEntityID'

		Select  * from Edited_AdventureWorks.dbo.Relationships2
		where ColumnName='BusinessEntityID'
		or ReferencedColumnName = 'BusinessEntityID'
Q6
Select T.name  as TableName,
C.name  as ColumnName,
CONS.definition as DefaultDefinition
from sys.default_constraints CONS
inner join sys.columns C on CONS.parent_object_id = C.object_id
							and CONS.parent_column_id = C.column_id
inner join sys.tables T on CONS.parent_object_id = T.object_id
inner join sys.schemas S on CONS.schema_id=S.schema_id
Q7
Select 	T.name as TableName
	,C.name as ColumnName
	from sys.tables T
inner join sys.columns C on C.object_id=T.object_id
where T.name LIKE '%History%' or
C.name LIKE '%rate%'

Q8 
Select DATA_TYPE, count(*) as amount from information_schema.columns
group by DATA_TYPE
order by amount desc

Select 
CASE	
	WHEN CHARACTER_MAXIMUM_LENGTH is not null then 'Character'
	WHEN NUMERIC_PRECISION is not null then 'Numeric'
	WHEN DATETIME_PRECISION is not null then 'Date'
	Else 'Null'
	END as 'DataTypeGroup',count(*) as amount
	--Count(*) as DataTypeGroup
	from information_schema.columns
	group by CASE
	When CHARACTER_MAXIMUM_LENGTH is not null then 'Character'
	WHEN NUMERIC_PRECISION is not null then 'Numeric'
	WHEN DATETIME_PRECISION is not null then 'Date'
	Else 'Null'
	END
	order by amount desc

	Select Distinct DATA_TYPE from information_schema.columns
	Where CHARACTER_MAXIMUM_LENGTH is null 
	and NUMERIC_PRECISION is null 
	and DATETIME_PRECISION is null 

	Q9 
	Select VIEW_NAME, count( distinct TABLE_NAME)  from information_schema.view_column_usage
	group by VIEW_NAME

	Q10 - definitions
	Select T.name, C.name , E.value as Definition
	From sys.extended_properties E
	inner join sys.tables T on T.object_id=E.major_id
	inner join sys.columns C on C.object_id=E.major_id
							and C.column_id=E.minor_id
	where class=1 and T.name='Person'

	Q11 
	Select count(*) as 'Number of employees' from HumanREsources.EmployeeDepartmentHistory
--	where EndDate is null

	Select T.name, C.name , E.value as Definition
	From sys.extended_properties E
	inner join sys.tables T on T.object_id=E.major_id
	inner join sys.columns C on C.object_id=E.major_id
							and C.column_id=E.minor_id
							where class=1 and T.name='Employee'
	Select CurrentFlag, count(*) from HumanResources.Employee
	group by CurrentFlag

	Select count(distinct JobTitle) from HumanResources.Employee e
	INNER JOIN Person.Person p on p.BusinessEntityID = e.BusinessEntityID
	where PersonType='SP'

	Select JobTitle, count(JobTitle) from HumanResources.Employee e
	INNER JOIN Person.Person p on p.BusinessEntityID = e.BusinessEntityID
	where PersonType='SP'
	group by JobTitle

	Q12*/
	Select Concat(FirstName, ' ',LastName) as CEO,JobTitle, HireDate,OrganizationLevel from HumanResources.Employee E
	inner join Person.Person P on P.BusinessEntityID= E.BusinessEntityID
	where E.JobTitle = 'Chief Executive Officer' or E.OrganizationLevel='1'

		Select T.name, C.name , E.value as Definition
	From sys.extended_properties E
	inner join sys.tables T on T.object_id=E.major_id
	inner join sys.columns C on C.object_id=E.major_id
							and C.column_id=E.minor_id
	where T.name='Employee'