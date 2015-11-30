CREATE PROCEDURE [dbo].[spAddNewDiscount]
	@DiscountReason nvarchar(20),
	@DiscountAmount float,
	@Active bit

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Discount(Active, DiscountReason, DiscountAmount)
		VALUES (@Active, @DiscountReason, @DiscountAmount)
	END