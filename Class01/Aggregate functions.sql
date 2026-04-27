-- COUNT
select COUNT(*) as TotalNumberOfCustomers 
from Customers

select COUNT(Id) as TotalNumberOfOrders
from Orders

select COUNT(Comment) as TotalNumberOfOrders
from Orders

-- SUM
select SUM(TotalPrice) as TotalPrice
from Orders

-- MIN & MAX
select MAX(TotalPrice) as GreatestOrder
from Orders

select MIN(TotalPrice) as LowestOrder
from Orders

select be.Name, MAX(o.TotalPrice) as BiggestOrder, min(o.TotalPrice) as LowestOrder
from BusinessEntities be
inner join Orders o
on be.Id = o.BusinessEntityId
group by be.Name

-- AVERAGE
select AVG(DISTINCT Quantity) as AverageQuantity
from OrderDetails

-- STRING_AGG
select STRING_AGG(Name, ', ') as AllCustomers
from Customers
