/*  write a SQL query to Create Stored procedure in the Northwind database to insert 
Customer Order Details */

CREATE PROCEDURE InsertCustomerOrderDetails
	@orderID int,
	@productID int,
	@unitPrice money,
	@quantity int,
	@discount real
AS
BEGIN
	INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
	VALUES (@orderID, @productID, @unitPrice, @quantity, @discount)
END