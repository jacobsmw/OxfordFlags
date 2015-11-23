CREATE PROCEDURE [dbo].[spAddNewOrder]
	@OrderDate date,
	@SourceID int,
	@SubYear int,
	@BasePrice float,
	@DiscountID int,
	@Type nvarchar,
	@ConfirmationDate date,
	@FirstOccasionID int

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Order] (OrderDate, SourceID, SubYear, BasePrice, DiscountID, Type, ConfirmationDate, FirstOccasionID)
		VALUES (@OrderDate, @SourceID, @SubYear, @BasePrice, @DiscountID, @Type, @ConfirmationDate, @FirstOccasionID)
	END