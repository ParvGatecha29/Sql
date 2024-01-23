/*write a SQL query to Create Stored procedure in the Northwind database to retrieve 
Sales By Category */

CREATE PROCEDURE RetrieveSalesByCategory
AS
BEGIN
    SELECT c.CategoryName, SUM(od.UnitPrice * od.Quantity) as Sales
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
END
