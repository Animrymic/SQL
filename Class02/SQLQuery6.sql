select *
from Employees
where FirstName = 'Aleksandar'
order by LastName;

select *
from Employees
order by FirstName;

select *
from Employees
where	Gender = 'M'
order by HireDate desc;

--WORKSHOP 3 - UNION, UNION ALL, INTERSECT

select Name 
from BusinessEntities
UNION ALL 
select Name 
from Customers

select Region 
from BusinessEntities
UNION 
select RegionName
from Customers

select Region 
from BusinessEntities
EXCEPT
--intersect
select RegionName
from Customers

-- WORKSHOP 4 - CONSTRAINTS

create table Products_Test (
	[Id] int identity(1,1) not null,
	[Code] nvarchar(50) null, 
	[Name] nvarchar(100) null, 
	[Description] nvarchar(max) null, 
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null,
	[Cost] decimal(18,2) null,
constraint [PK_Product_Test] primary key (Id),
constraint [DFT_Products_Price] DEFAULT(0)
)

