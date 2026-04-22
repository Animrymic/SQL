-- LEN()
select FirstName, LEN(LastName) as LastNameLength
from Employees

-- SUBSTRING()

select Code, SUBSTRING(Code, 1,3) as ShortCode 
from Products

-- REPLACE()
select FirstName, LastName, REPLACE(Gender,'M', 'Male') as GenderFullName
from Employees

-- GETDATE()
select GETDATE()

--UPPER() and LOWER()
select UPPER(FirstName) as FirstNameToUpperCase, LOWER(LastName) as LastNameToLowerCase
from Employees