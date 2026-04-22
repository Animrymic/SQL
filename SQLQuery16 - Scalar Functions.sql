declare 
	@FirstName nvarchar(100),
	@LastName nvarchar(100)

set @FirstName = 'Dragan'
set @LastName = 'Trojanovikj'

select @FirstName as FirstName, @LastName as LastName


declare @FullName nvarchar(100)

set @FullName = @FirstName + ' ' + @LastName

select @FullName as FullName

select @FirstName = 'Viktor', @LastName = 'Stojanovski'

select *
from Employees 
where FirstName = @FirstName and LastName = @LastName

select @FirstName = 'Ana'

if(len(@FirstName) > 3)
	select 'Correct Name'
else 
select 'Name too short!'

	