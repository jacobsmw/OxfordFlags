CREATE PROCEDURE [dbo].[spAddNewPayment]
	@BuyerID int,
	@OrderID int,
	@AmountPaid float,
	@PaymentDate date

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Payment] (BuyerID, OrderID, AmountPaid, PaymentDate)
		VALUES (@BuyerID, @OrderID, @AmountPaid, @PaymentDate)
	END