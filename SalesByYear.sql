 /*write a SQL query to Create Stored procedure in the Northwind database to retrieve 
Sales by Year*/

CREATE PROCEDURE RetrieveSalesByYear
AS
BEGIN
    SELECT YEAR(o.OrderDate) as Year, SUM(od.UnitPrice*od.Quantity) AS Sales
    FROM [Order Details] od
    JOIN Ordersn o ON od.OrderID = o.OrderID
    GROUP BY YEAR(o.OrderDate)
END