insert into [Orders] (OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
values((select '2019-05-05' as OrderDate), 0, 100, 1, 1, 1000, 'test comment');

delete from Orders where BusinessEntityId = 100

select * from Orders

-- create FK constraint
alter table OrderDetails add constraint [FK_OrderDetails_Orders] FOREIGN KEY (OrderId) REFERENCES Orders(Id)
alter table Orders add constraint [FK_Orders_BusinessEntity] FOREIGN KEY (BusinessEntityId)  REFERENCES BusinessEntities(Id)
alter table Orders add constraint [FK_Orders_Customer] FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
alter table Orders add constraint [FK_Orders_Employee] FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
alter table OrderDetails add constraint [FK_OrderDetails_Product] FOREIGN KEY (ProductId) REFERENCES Products(Id)

-- left join 
select * 
from Orders o left join BusinessEntities be 
on o.BusinessEntityId = be.Id

-- inner join
select * 
from Orders o inner join BusinessEntities be 
on o.BusinessEntityId = be.Id

-- right join
select * 
from Orders o right join BusinessEntities be 
on o.BusinessEntityId = be.Id

select be.Name, be.Size, o.TotalPrice, o.OrderDate
from BusinessEntities be
inner join Orders o 
on be.Id = o.BusinessEntityId


