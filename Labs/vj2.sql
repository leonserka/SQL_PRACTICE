--1

SELECT * FROM Employees

--2

SELECT ContactName,CompanyName,ContactTitle,Phone FROM Customers 


--3

SELECT CategoryName,Description FROM Categories ORDER BY CategoryName

--4

SELECT CompanyName, Fax, Phone, HomePage, Country FROM Suppliers ORDER BY Country DESC, CompanyName ASC;

--5

SELECT ContactName FROM Customers WHERE City = 'Buenos Aires'

--6

SELECT ProductName, UnitPrice, QuantityPerUnit FROM Products WHERE UnitsInStock = 0

--7

SELECT FirstName, LastName FROM Employees WHERE Country != 'USA'

--8

SELECT City, CompanyName, ContactName FROM Customers WHERE City Like 'A%' OR City Like 'B%'

--9

SELECT * FROM Orders WHERE Freight > 500.00

--10

SELECT CompanyName, ContactName, Fax FROM Customers WHERE Fax IS NOT NULL

--11

SELECT FirstName, LastName FROM Employees WHERE ReportsTo IS NULL

--12

SELECT FirstName, LastName, BirthDate FROM Employees WHERE year(BirthDate) BETWEEN 1950 AND 1959

--13

SELECT ProductName, SupplierID FROM Products 
WHERE SupplierID IN(
SELECT SupplierID FROM Suppliers 
WHERE CompanyName IN ('Exotic Liquids', 'Grandma Kelly''sHomestead', 'Tokyo Traders'))

--14

SELECT ShipPostalCode,OrderID,OrderDate FROM Orders WHERE ShipPostalCode lIKE '02389%'

--15

SELECT ContactName, ContactTitle, CompanyName FROM Customers WHERE ContactTitle NOT LIKE '%Sales%'

--16

SELECT FirstName, LastName, City FROM Employees WHERE City != 'Seattle'