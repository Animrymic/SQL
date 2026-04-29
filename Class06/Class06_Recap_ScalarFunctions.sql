USE [SEDC]
GO

-- Scalar functions recap --

select * from [dbo].[Employees]
go
 
 select dbo.fn_EmployeeFullName(1) as 'Employee Full Name'
go

DECLARE @EmployeeFullName nvarchar(100)
SET @EmployeeFullName = dbo.fn_EmployeeFullName(1)
select @EmployeeFullName as 'Employee Name'
go

CREATE OR ALTER   FUNCTION [dbo].[fn_EmployeeFullName] (@EmployeeId int)
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)

	SELECT @Result = UPPER(CONCAT(FirstName, ' ' , LastName)) 
	FROM Employees
	WHERE Id = @EmployeeId

RETURN @Result
END
GO

CREATE OR ALTER FUNCTION dbo.InsertEmployee
(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
	@DateOfBirth DATE,
	@Gender NCHAR,
	@HireDate DATE,
	@NationalIdNumber NVARCHAR(20)
)
RETURNS INT
BEGIN
    INSERT INTO Employees (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
    VALUES (@FirstName, @LastName, @DateOfBirth, @HireDate, @Gender, @NationalIdNumber);

	RETURN SCOPE_IDENTITY();
END
GO

--select * from Employees
-- Example scope identity
--INSERT INTO dbo.Employees (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
-- ('Bob', 'Bobsky', GETDATE(), GETUTCDATE(), 'M', '111')
--SELECT SCOPE_IDENTITY() as LastAddedItemId



