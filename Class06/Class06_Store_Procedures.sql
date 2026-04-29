-- Stored procedures -- 

-- Return all employees -- 

--select * from Employees
--go

-- Get all employees --
create or alter procedure usp_GetAllEmployees
as
begin
	select *
	from Employees
end
go

EXECUTE [dbo].[usp_GetAllEmployees]
go

-- Get employee by Id -- 
create or alter procedure usp_GetEmplyeeById 
	@EmployeeId int
as 
begin
	select * from dbo.Employees e
	where @EmployeeId = e.Id;	
end
go

-- Calling the procedure --
EXEC [dbo].[usp_GetEmplyeeById] 10
EXEC [dbo].[usp_GetEmplyeeById] @EmployeeId = 20
go
--EXEC [dbo].[usp_GetEmplyeeById] @EmployeeId = 20, 300 --ERROR TOO MANY ARGUMENTS

-- Insert new Employee -- 
create or alter procedure dbo.usp_InsertEmployee
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@DateOfBirth date, 
	@Gender nchar,
	@HireDate date,
	@NationalIdNumber nvarchar(20)
as
begin
	insert into dbo.Employees (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
	values(@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)
end
go

exec [dbo].[usp_InsertEmployee]
	@FirstName = 'John',
	@LastName = 'Doe', 
	@NationalIdNumber = '111111',
	@Gender = 'F',
	@HireDate = '2020-12-5',
	@DateOfBirth = '1990-10-10'
go

select * from Employees
order by Id desc
go

-- 
