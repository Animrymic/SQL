CREATE FUNCTION fn_EmployeeFullName (@EmployeeId int)
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)

	SELECT @Result = FirstName + ' ' + LastName 
	FROM Employees
	WHERE Id = @EmployeeId

RETURN @Result
END


SELECT dbo.fn_EmployeeFullName(1) as FullName