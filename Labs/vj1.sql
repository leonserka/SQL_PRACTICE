--1

INSERT INTO Employees
(LastName, FirstName, Title, TitleOfCourtesy,
BirthDate, HireDate, Address, City, Region,
PostalCode, Country, HomePhone, Extension)
VALUES ('Dunn','Nat','Sales Representative','Mr.','19-Feb-1970',
'15-Jan-2004','4933 Jamesville Rd.','Jamesville','NY',
'13078','USA','315-555-5555','130');

SELECT * FROM Employees

--2 izrada kopije naruđbe za orderid = 10248

INSERT INTO Orders
SELECT
  CustomerID
 ,EmployeeID
 ,OrderDate
 ,RequiredDate
 ,ShippedDate
 ,ShipVia
 ,Freight
 ,ShipName
 ,ShipAddress
 ,ShipCity
 ,ShipRegion
 ,ShipPostalCode
 ,ShipCountry
FROM Orders
WHERE ORDERID = 10248

SELECT * FROM Orders


--3

INSERT Region (RegionID, RegionDescription) VALUES (5, 'NorthWestern')

SELECT * FROM Region

--4

UPDATE Employees
SET FirstName = 'Nathaniel'
WHERE FirstName = 'Nat';SELECT * FROM Employees--5UPDATE Customers
SET ContactName = 'Ann Smith',
ContactTitle = 'Marketing manager'
WHERE CustomerID = 'ALFKI'

SELECT * FROM Customers


--6

DELETE FROM Employees
WHERE FirstName = 'Nathaniel';SELECT * FROM Employees--7-- Izbrišite sve narudžbe ostvarene 1995 godine
DELETE FROM [Order Details]
WHERE OrderID IN
(SELECT OrderID FROM [Orders]
WHERE YEAR(OrderDate) = 1995)

DELETE FROM [Orders]
WHERE YEAR(OrderDate) = 1995SELECT * FROM Orders
--8

INSERT INTO Orders 
(CustomerID, EmployeeID, Freight, OrderDate,RequiredDate, ShipAddress, ShipCity, ShipCountry, ShipName, ShippedDate, ShipPostalCode, ShipRegion, ShipVia)
VALUES ('ALFKI', 11, 12, '2010-01-01', '2010-01-03', 'Cali', 'Split', 'Croatia', 'BROD', '2010-01-10', 21000, 'rEGIJA', 1)

SELECT * FROM Orders

--9
SELECT * FROM Employees

UPDATE Employees
SET EmployeeID = 999
WHERE EmployeeID = (
SELECT EmployeeID FROM Employees WHERE FirstName = 'Nat' AND LastName = 'Dunn');

UPDATE Orders
SET EmployeeID = 999
WHERE EmployeeID = (
SELECT EmployeeID FROM Employees WHERE FirstName = 'Nat' AND LastName = 'Dunn');

UPDATE [Order Details]
SET OrderID = (
SELECT OrderID FROM Orders WHERE EmployeeID = 999)
WHERE OrderID IN (
SELECT OrderID FROM Orders WHERE EmployeeID = (
SELECT EmployeeID FROM Employees WHERE FirstName = 'Nat' AND LastName = 'Dunn'));

--10 

DELETE FROM Orders
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Employees
    WHERE LastName = 'Novak' AND FirstName = 'Ivan'
);

DELETE FROM EmployeeTerritories
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Employees
    WHERE LastName = 'Novak' AND FirstName = 'Ivan'
);

DELETE FROM Employees
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Employees
    WHERE LastName = 'Novak' AND FirstName = 'Ivan'
);
