/* write a SQL query to Create Stored procedure in the Northwind database to retrieve 
Ten Most Expensive Products*/


CREATE PROCEDURE RetrieveTenMostExpensive
AS
BEGIN
    SELECT TOP 10 ProductName,UnitPrice
	FROM Products
	ORDER BY UnitPrice DESC
END
