

insert into TableA values (1), (2), (3)
insert into TableB values (2), (3), (4)

select * from TableA


-- Left join 
select * 
from TableA left join TableB 
on IdA = IdB

-- Right join
select * 
from TableA right join TableB
on IdA = IdB

-- Inner join
select *
from TableA inner join TableB
on IdA = IdB

-- Full join
select *
from TableA full join TableB
on IdA = IdB

-- Cross join 
select * 
from TableA cross join TableB
order by IdA, IdB




