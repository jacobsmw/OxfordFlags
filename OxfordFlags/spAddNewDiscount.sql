CREATE PROCEDURE [dbo].[spAddNewDiscount]
	@DiscountReason nvarchar,
	@DiscountAmount float,
	@Active bit

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Discount(Active, DiscountReason, DiscountAmount)
		VALUES ('1', @DiscountReason, @DiscountAmount)
	END