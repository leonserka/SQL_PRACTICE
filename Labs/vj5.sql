--1 PRIMJER vraća samo 1 rezultat

SELECT CustomerId, CompanyName 
FROM Customers 
WHERE CustomerID = (SELECT CustomerID 
FROM Orders WHERE OrderID = 10290)


--2 PRIMJER ako vraćamo više rezultata onda ide sa IN ili NOT

SELECT CustomerId, CompanyName FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID 
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31')

--3 PRIMJER podupit u listi atributa

SELECT TOP 1 OrderId,
 OrderDate AS Last_Paris_Order,
 (SELECT MAX(OrderDate) FROM Northwind.dbo.Orders) Last_OrderDate,
 DATEDIFF(dd,OrderDate,(SELECT MAX(OrderDate) FROM
Northwind.dbo.Orders)) Day_Diff
 FROM Northwind.dbo.Orders
 WHERE ShipCity = 'Paris'
 ORDER BY OrderDate DESC

 --4 PRIMJER podupit u from izrazu

 SELECT OrderId, OrderDate, FirstName, LastName
 FROM (SELECT EmployeeID, FirstName, LastName 
 FROM Employees 
 WHERE City = 'London')e
 JOIN Orders o
 ON o.EmployeeID = e.EmployeeID


 --5 

SELECT DISTINCT OrderId
 FROM "Order Details" od
WHERE Quantity > (SELECT AVG(Quantity) * .1
 FROM "Order Details"
 WHERE od.ProductID = ProductID)
ORDER BY OrderId--6 primjer korelirani podupitSELECT OrderID, CustomerID
FROM Orders o
WHERE 20 < (SELECT Quantity
 FROM [Order Details] od
 WHERE o.OrderID = od.OrderID AND od.ProductID = 23) --7 korelirani podupit sa exist i nonexist SELECT LastName, EmployeeID
FROM Employees e
WHERE EXISTS (SELECT * FROM Orders
 WHERE e.EmployeeID = Orders.EmployeeID
 AND OrderDate = '9/5/97')--8 zadatak 1 podupit u lista atributa SELECT 
    OrderID,
    Quantity,
    (SELECT MAX(Quantity) FROM "Order Details") AS MaxQuantity
FROM 
    "Order Details" 
WHERE 
    ProductID = 23;--9 zadatak SELECT	ProductId, ProductName, SupplierId FROM ProductsWHERE SupplierID IN (SELECT SupplierID FROM SuppliersWHERE CompanyName = 'Exotic Liquids' OR CompanyName = 'Tokyo Traders')--10 zadatakSELECT ProductId, ProductName FROM Products WHERE UnitPrice = (SELECT UnitPrice FROM Products WHERE ProductName = 'Longlife Tofu')--11 zadatakSELECT DISTINCT 
    C.CustomerID,
    C.CompanyName
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    O.OrderDate = (
        SELECT MAX(OrderDate) 
        FROM Orders
    );


--12 zadatak

SELECT ProductId, ProductName FROM Products 
WHERE ProductId NOT IN (SELECT ProductId FROM [Order Details] )

--13 korelirani podupiti

SELECT 
    O.CustomerID,
    O.OrderID
FROM 
    Orders O
WHERE 
    (
        SELECT 
            SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount))
        FROM 
            "Order Details" OD
        WHERE 
            OD.OrderID = O.OrderID
    ) > 10000;


--14 korelirani podupiti

SELECT 
    C.CustomerID,
    C.CompanyName
FROM 
    Customers C
WHERE 
    EXISTS (
        SELECT 1
        FROM Orders O
        WHERE O.CustomerID = C.CustomerID
          AND O.ShipCountry = 'France'
    );




