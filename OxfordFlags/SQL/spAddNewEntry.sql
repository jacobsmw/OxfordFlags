CREATE PROCEDURE [dbo].[spAddNewEntry]
	@BuyerFirstName nvarchar,
	@BuyerLastName nvarchar,
	@BuyerAddress nvarchar,
	@BuyerCity nvarchar,
	@BuyerState nvarchar,
	@BuyerZipCode nvarchar,
	@BuyerEmail nvarchar,
	@BuyerPhone nvarchar,
	@BuyerRotaryMember int,
	@PaymentMethod nvarchar,
	@Date date,
	@Source nvarchar,
	@Discount float,
	@FirstHoliday nvarchar
AS
	EXEC dbo.spAddNewBuyer @BuyerLastName, @BuyerFirstName, @BuyerAddress, @BuyerCity, @BuyerState, @BuyerZipCode, @BuyerEmail, @BuyerPhone, 'placeholder', @BuyerRotaryMember

RETURN 0