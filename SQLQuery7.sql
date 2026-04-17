create table Products_Test (
	[Id] int identity(1,1) not null,
	[Code] nvarchar(50) null, 
	[Name] nvarchar(100) null, 
	[Description] nvarchar(max) null, 
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null constraint [DFT_Products_Price] DEFAULT(0),
	[Cost] decimal(18,2) null,
constraint [PK_Product_Test] primary key (Id),
)

insert into Products_Test (Code, Name, Description, Weight, Cost)
values
('P001', 'Product 1', 'Description for product 1', 1.5, 5.00)



-- UNIQUE CONSTRAINT for column Code 
alter table Products_Test WITH CHECK 
ADD CONSTRAINT Products_test_Code_Unique UNIQUE (Code) 

insert into Products_Test (Code, Name, Description, Weight, Cost)
values
('P001', 'Product 1', 'Description for product 1', 1.5, 5.00)


-- DEFAULT CONSTRAINT for Weight

alter table Products_Test 
ADD CONSTRAINT DF_ProductTest_Weight
DEFAULT 100 FOR [Weight]

insert into Products_Test (Code, Name, Description, Cost)
values
('P002', 'Product 2', 'Description for product 2', 5.00)


select * from Products_Test



