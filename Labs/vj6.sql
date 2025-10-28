--1 primjer

CREATE FUNCTION fnNeedToReorder (@nReorderLevel INT, @nUnitsInStock INT,
 @nUnitsOnOrder INT)
 RETURNS VARCHAR(3)
AS
BEGIN
 DECLARE @sReturnValue VARCHAR(3)
 IF ((@nUnitsInStock + @nUnitsOnOrder) - @nReorderLevel) < 0
	SET @sReturnValue = 'Yes'
 ELSE
	SET @sReturnValue = 'No'
 RETURN @sReturnValue
END
GO

SELECT ProductID,
 ReorderLevel,
 UnitsInStock,
 UnitsOnOrder,
 dbo.fnNeedToReorder(ReorderLevel, UnitsInStock, UnitsOnOrder) AS
needToReorder
 FROM Products
--2 primjer inline funkcije
/* Izraditi funkciju koja vraća sve zaposlenike iz određenog grada */

CREATE FUNCTION fnGetEmployeesByCity (@sCity VARCHAR(30))
 RETURNS TABLE
AS
RETURN
 (
 SELECT FirstName, LastName, Address
 FROM Employees
 WHERE City = @sCity
 )
GO
SELECT * FROM fnGetEmployeesByCity('Seattle') 

--3 primjer

CREATE FUNCTION fnGetEmployeesByCity3 (@sCity VARCHAR(30))
 RETURNS @tblMyEmployees TABLE
 (
 FirstName VARCHAR(20),
 LastName VARCHAR(40),
 Address VARCHAR(120)
 )
AS
BEGIN
 INSERT @tblMyEmployees
 SELECT FirstName, LastName, Address
 FROM Employees
 WHERE City = @sCity
 ORDER BY LastName
 IF NOT EXISTS (SELECT * FROM @tblMyEmployees)
 INSERT @tblMyEmployees (Address)
 VALUES ('Nije pronaðen niti jedan zaposlenik u danom gradu.')

 RETURN
END

SELECT * FROM fnGetEmployeesByCity3('Split')

--4 izmjena funkcije

ALTER FUNCTION fnNeedToReorder (@nReorderLevel INT, @nUnitsInStock INT,
 @nUnitsOnOrder INT)
 RETURNS VARCHAR(3)
AS
BEGIN
 DECLARE @sReturnValue VARCHAR(3)
 IF ((@nUnitsInStock + @nUnitsOnOrder) - @nReorderLevel) < 0
 SET @sReturnValue = 'Yes'
 ELSE
 SET @sReturnValue = 'No'
 RETURN @sReturnValue
END
GO

--brisanje funkcije
DROP FUNCTION fnNeedToReorder

--5

CREATE PROCEDURE [FindEmployee] ( @name VARCHAR(32) )
AS
SELECT *
FROM Employees
WHERE FirstName like '%' + @name + '%' OR LastName like '%' + @name + '%'--6CREATE PROCEDURE InsertEmployee
(@fname NVARCHAR(10), @lname NVARCHAR(20), @title NVARCHAR(30))
AS
INSERT INTO Employees (FirstName, LastName, Title)
VALUES (@fname, @lname, @title)
RETURN @@IDENTITY

--6 dalje
ALTER PROCEDURE InsertEmployee
(@fname NVARCHAR(10), @lname NVARCHAR(20),@title NVARCHAR(30),@country
NVARCHAR(15))
AS
INSERT INTO Employees (FirstName, LastName, Title, COUNTRY)
VALUES (@fname, @lname, @title, @country)
RETURN @@IDENTITY--7EXEC InsertEmployee 'Ann', 'Scott', 'Sales manager', 'Cro'SELECT * FROM EmployeesDROP PROCEDURE InsertEmployee--8 zadatakSELECT * FROM [Order Details]CREATE FUNCTION fnIznosStvake (@StavkaID INT)RETURNS DECIMAL(10,2)ASBEGIN	DECLARE @Iznos DECIMAL(10,2)	SELECT @Iznos = Quantity * UnitPrice * (1 - Discount)	FROM [Order Details]	WHERE ProductID = @StavkaID	RETURN @IznosENDSELECT *, dbo.fnIznosStvake(2) AS UkupanIznos FROM [Order Details]--9 zadatakCREATE FUNCTION fnIznosStavke2 (@MinIznos DECIMAL(10,2))RETURNS TABLEASRETURN(	SELECT *, UnitPrice * Quantity * (1- Discount) AS UkupanIznos FROM [Order Details]	WHERE UnitPrice * Quantity * (1- Discount) > @MinIznos)SELECT * FROM fnIznosStavke2(5000.00);DROP FUNCTION fnIznosStvakeDROP FUNCTION fnIznosStavke2--10 zadatak