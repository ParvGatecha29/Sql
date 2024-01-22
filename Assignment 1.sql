SELECT ProductID, ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice<20;

SELECT ProductID, ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 15 AND 25;

SELECT ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

SELECT TOP 10 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

SELECT COUNT(*) AS Records
FROM Products 
GROUP BY Discontinued;

SELECT ProductName, UnitsOnOrder, UnitsInStock 
FROM Products 
WHERE UnitsOnOrder>UnitsInStock;

