--WORKSHOP 4 

alter table Products
add constraint DF_Product_Price DEFAULT 0 FOR Price

select * from Products

alter table Products with check
add constraint UC_Product_Name UNIQUE (Name)