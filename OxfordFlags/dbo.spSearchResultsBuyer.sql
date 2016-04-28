CREATE PROCEDURE [dbo].[spSearchResultsBuyer]
	@BUYERID INT
AS
	SET NOCOUNT ON
	BEGIN
		SELECT [Buyer].BuyerID, [Buyer].FirstName, [Buyer].LastName, [Buyer].StreetAddress, [Buyer].City, [Buyer].State, [Buyer].Zip, [Buyer].Email, [Buyer].Phone, [Buyer].RotaryMember,
		[Order].OrderDate, [Order].SubYear, [Order].Cost, [Order].Type, [Order].ConfirmationDate,
		[Payment].Payment, [Payment].PaymentDate,
		[Sleeve].SleeveName
		FROM [dbo].[Buyer] RIGHT JOIN [dbo].[BuyerOrder]
		ON [Buyer].BuyerID = [BuyerOrder].BuyerID JOIN [dbo].[Order]
		ON [BuyerOrder].OrderID = [Order].OrderID JOIN [dbo].[Payment]
		ON [Order].OrderID = [Payment].OrderID JOIN [dbo].[Sleeve]
		ON [Order].OrderID = [Sleeve].OrderID
		WHERE [Buyer].BuyerID = @BUYERID
		GROUP BY [Buyer].FirstName;
	END
RETURN

--Still need source and discount