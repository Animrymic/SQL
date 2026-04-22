
CREATE VIEW [Total amount of orders per business entity] as
select be.Name, sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.Name 

select * from [Total amount of orders per business entity]