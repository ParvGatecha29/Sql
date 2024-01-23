/* 2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
Employee Sales by Country */CREATE PROCEDURE RetrieveEmployeeSalesByCountry
AS
BEGIN
    SELECT e.Country, e.LastName, e.FirstName, SUM(od.UnitPrice * od.Quantity) as Sales
    FROM [Order Details] od
    JOIN Ordersn o ON od.OrderID = o.OrderID
    JOIN Employees e ON o.EmployeeID = e.EmployeeID
    GROUP BY e.Country, e.LastName, e.FirstName
END