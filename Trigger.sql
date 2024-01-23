
CREATE TRIGGER CheckFreightLimit
ON Ordersn
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @AverageFreight money
    DECLARE @NewFreight money
    DECLARE @CustomerID nchar(5)

    SELECT @CustomerID = i.CustomerID, @NewFreight = i.Freight
    FROM inserted i

    EXEC CalculateAverageFreight @CustomerID, @AverageFreight OUTPUT

    IF @NewFreight > @AverageFreight
    BEGIN
        RAISERROR ('The freight value exceeds the average freight for this customer.', 16, 1)
        ROLLBACK TRANSACTION
    END
END