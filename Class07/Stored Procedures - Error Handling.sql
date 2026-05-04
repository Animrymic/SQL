-- Example 1 -- 
create or alter procedure usp_GetEmployeesByGender
(
	@Gender NCHAR = 'M',
	@GenderCount INT OUT
)
AS
BEGIN
	select * from Employees
	where Gender = @Gender

	select @GenderCount = COUNT(Id)
	from Employees 
	where Gender = @Gender
END
GO

DECLARE @GenderCountResult INT
EXECUTE usp_GetEmployeesByGender @Gender = 'F', @GenderCount = @GenderCountResult OUT
SELECT @GenderCountResult

-- Example 2 --
select * from Products
select * from OrderDetails
go

create or alter procedure usp_ProductDetails
(
	@ProductName NVARCHAR(100),
	@ProductPrice DECIMAL(18, 2) OUT,
	@TotalQuantity INT OUT
)
AS
BEGIN
		-- Select product details -- 
	SELECT 
		p.[Name] as ProductName,
		p.[Description] as ProductDescrption,
		p.Price as ProductPrice
	FROM Products p
	WHERE p.[Name] = @ProductName

		-- Set ProductPrice output

	SELECT 
		@ProductPrice = p.Price
	FROM Products p
	WHERE p.Name = @ProductName

		-- Set Product Quantity output

	SELECT @TotalQuantity = SUM(od.Quantity) FROM Products p 
	JOIN OrderDetails od ON p.Id = od.ProductId
	WHERE p.Name = @ProductName

END
GO

DECLARE @ProductPrice DECIMAL(18, 2), @TotalQuantityResult INT, @TotalPrice DECIMAL(18, 2)
EXEC usp_ProductDetails 'Crunchy', @ProductPrice OUTPUT, @TotalQuantityResult OUT
SELECT @ProductPrice as 'Product Price', @TotalQuantityResult as 'Total Quantity'

SET @TotalPrice = @ProductPrice * @TotalQuantityResult
SELECT @TotalPrice as 'Total Price'
GO




--================================== Exercise 1 ==================================--

CREATE OR ALTER PROCEDURE usp_CreateOrder
(
    @CustomerId INT,
    @BusinessEntityId INT
)	
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Orders (CustomerId, BusinessEntityId, OrderDate)
    VALUES (@CustomerId, @BusinessEntityId, GETDATE());

    -- Result set 1
    SELECT COUNT(*) AS TotalOrders
    FROM Orders
    WHERE CustomerId = @CustomerId;

    -- Result set 2
    SELECT 
        ISNULL(SUM(od.Quantity * od.Price), 0) AS TotalAmount
    FROM Orders o
    LEFT JOIN OrderDetails od 
        ON o.Id = od.OrderId
    WHERE o.CustomerId = @CustomerId
      AND o.BusinessEntityId = @BusinessEntityId;
END;
GO

EXEC usp_CreateOrder @CustomerId = 2, @BusinessEntityId = 3;
SELECT * FROM Orders WHERE CustomerId = 2;		

SELECT * FROM Orders	


-- ============================= ERROR HANDLING ========================== --

SELECT 1/0 AS Result

BEGIN TRY
	SELECT 1/0 AS Result
	PRINT 'Yey, we divided by zero!'
END TRY
BEGIN CATCH
	PRINT 'An error occured'
END CATCH
GO