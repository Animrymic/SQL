-- Workshop 1 & 2 

select sum(TotalPrice) as TotalPrice 
from Orders
go

select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name 

select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o 
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.Name

select be.Name, max(o.TotalPrice) as MaximumTotalPrice, avg(distinct o.TotalPrice) as AverageTotalPrice
from Orders o 
join BusinessEntities be on o.BusinessEntityId = be.Id
group by be.Name

select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o 
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.Name
having sum(o.TotalPrice) < 100000

select 
be.Name, 
max(o.TotalPrice) as MaximumTotalPrice, 
avg(o.TotalPrice) as AverageTotalPrice
from Orders o 
join BusinessEntities be on o.BusinessEntityId = be.Id
group by be.Name
having sum(o.TotalPrice) > 4 * avg(o.TotalPrice)
