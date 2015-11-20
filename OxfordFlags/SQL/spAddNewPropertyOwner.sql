CREATE PROCEDURE [dbo].[spAddNewPropertyOwner]
	@LastName nvarchar(25),
	@FirstName nvarchar(25),
	@StreetAddress nvarchar(50),
	@City nvarchar(25),
	@State nvarchar(2),
	@Zip nvarchar(5),
	@Email nvarchar(200),
	@Phone nvarchar(15),
	@RotaryMember bit

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[PropertyOwner](LastName, FirstName, StreetAddress, City, State, Zip, Email, Phone, RotaryMember)
		VALUES (@LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @RotaryMember)
	END