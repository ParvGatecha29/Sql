/* write a SQL query to Create Stored procedure in the Northwind database to update 
Customer Order Details */

CREATE PROCEDURE UpdateCustomerOrderDetails
	@orderID int,
	@productID int,
	@unitPrice money,
	@quantity int,
	@discount real
AS
BEGIN
	UPDATE [Order Details]
	SET UnitPrice = @unitPrice, Quantity = @quantity, Discount = @discount
	WHERE OrderID = @orderID AND ProductID = @productID
END