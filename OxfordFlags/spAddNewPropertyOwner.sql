CREATE PROCEDURE [dbo].[spAddNewPropertyOwner]
	@LastName nvarchar,
	@FirstName nvarchar,
	@StreetAddress nvarchar,
	@City nvarchar,
	@State nvarchar,
	@Zip nvarchar,
	@Email nvarchar,
	@Phone nvarchar,
	@RotaryMember bit

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[PropertyOwner](LastName, FirstName, StreetAddress, City, State, Zip, Email, Phone, RotaryMember)
		VALUES (@LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @RotaryMember)
	END