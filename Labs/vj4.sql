--1

SELECT o.OrderID, e.LastName, e.FirstName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.ShippedDate > o.RequiredDate

--2

SELECT o.ProductID, p.ProductName, SUM(o.Quantity) AS Total  
FROM [Order Details] o 
INNER JOIN Products p 
ON o.ProductID = p.ProductID
GROUP  BY o.ProductID, p.ProductName
HAVING SUM (o.Quantity) < 200
ORDER BY p.ProductName ASC


--3

SELECT o.OrderID, o.OrderDate, e.FirstName, e.LastName, c.CustomerID, c.CompanyName, c.ContactName
FROM Orders o 
INNER JOIN Employees e 
ON o.EmployeeID = e.EmployeeID
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate

--4

SELECT p.ProductID, p.ProductName, COUNT(o.orderID) AS Total
FROM Products p 
LEFT JOIN [Order Details] o 
ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductName

--5

SELECT o.ShipCountry, COUNT(DISTINCT o.OrderID) as TotalOrders, COUNT(DISTINCT e.EmployeeID) AS TotalEmployees
FROM Orders o 
LEFT JOIN Employees e
ON o.ShipCountry = e.Country
GROUP BY o.ShipCountry

--6

SELECT CompanyName, ContactName, Address, City, Country, Phone 
FROM Suppliers
UNION 
SELECT CompanyName, ContactName, Address, City, Country, Phone 
FROM CUSTOMERS

--7

SELECT e.EmployeeId, e.FirstName, e.LastName
FROM Employees e
INNER JOIN Orders o 
ON e.EmployeeID = o.EmployeeID
WHERE o.CustomerId = 'ALFKI'
INTERSECT 
SELECT e.EmployeeId, e.FirstName, e.LastName
FROM Employees e
INNER JOIN Orders o 
ON e.EmployeeID = o.EmployeeID
WHERE o.CustomerId = 'ROMEY' 

--8
SELECT o.ShipCity 
FROM Orders o 
INTERSECT 
SELECT s.City 
FROM Suppliers s

--8 alternativa

SELECT DISTINCT o.ShipCity 
FROM Orders o
INNER JOIN Suppliers s
ON o.ShipCity = s.City
