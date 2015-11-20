CREATE PROCEDURE [dbo].[spAddNewBuyer]
	@LastName nvarchar(25),
	@FirstName nvarchar(25),
	@StreetAddress nvarchar(50),
	@City nvarchar(25),
	@State nvarchar(2),
	@Zip nvarchar(5),
	@Email nvarchar(200),
	@Phone nvarchar(15),
	@BillType nvarchar(10),
	@RotaryMember bit

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Buyer(Active, LastName, FirstName, StreetAddress, City, State, Zip, Email, Phone, BillType, RotaryMember)
		VALUES ('1', @LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @BillType, @RotaryMember)
	END