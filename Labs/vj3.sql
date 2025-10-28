--1
SELECT UnitPrice, Quantity, Discount, 
UnitPrice* Quantity * (1 - Discount) AS TotalPrice FROM "Order Details"

--2
SELECT FirstName + ' ' + LastName + ' can be reached at x' + Extension  FROM Employees

--3
SELECT CAST(DATEDIFF(DAY, BirthDate, HireDate) AS DECIMAL(10, 2)) / 365 
AS HireAgeAccurate,  YEAR(HireDate) - YEAR(BirthDate) AS HireAgeInacurate FROM Employees

--4
SELECT ProductName, UnitsInStock, UnitPrice,
(UnitsInStock * UnitPrice ) as TotalValue,
floor(UnitsInStock * UnitPrice ) as TotalValueF,
ceiling(UnitsInStock * UnitPrice ) as TotalValueC 
from Products
ORDER BY TotalValue desc


--5
SELECT COUNT(DISTINCT OrderID) AS TotalUniqueOrders
FROM [Order Details];

--6
SELECT OrderID, COUNT(*) AS TotalItems
FROM "Order Details"
GROUP BY OrderID


--7
SELECT SUM(Quantity) AS Total
FROM "Order Details"
WHERE ProductID = 11
  AND Quantity > 50

--8
SELECT ProductID, ProductName, AVG(UnitPrice) AS AvgPrice 
FROM Products 
GROUP BY ProductID, ProductName 
HAVING AVG(UnitPrice) > 70 
ORDER BY AvgPrice asc

--9
SELECT TOP 1 ProductID, SUM(Quantity)
from [Order Details]
GROUP BY ProductID
ORDER BY SUM(Quantity) desc


--10
SELECT ProductID, 
SUM(Quantity) aS Total,
SUM(Quantity * UnitPrice) as Iznos, 
MAX(UnitPrice) AS MaxCijena,
MIN(UnitPrice) AS MinCijena
From [Order Details]
Group by ProductID