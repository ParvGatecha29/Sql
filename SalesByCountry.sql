/* 2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
Employee Sales by Country */
ALTER PROCEDURE RetrieveEmployeeSalesByCountry
AS
BEGIN
    SELECT o.ShipCountry, e.LastName, e.FirstName, SUM(od.UnitPrice * od.Quantity) as Sales, COUNT(e.EmployeeID)
    FROM [Order Details] od
    JOIN Ordersn o ON od.OrderID = o.OrderID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
    GROUP BY o.ShipCountry, e.LastName, e.FirstName
	ORDER BY SUM(od.UnitPrice * od.Quantity) DESC
END