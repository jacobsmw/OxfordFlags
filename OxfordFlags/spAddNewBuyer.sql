﻿CREATE PROCEDURE [dbo].[spAddNewBuyer]
	@LastName nvarchar,
	@FirstName nvarchar,
	@StreetAddress nvarchar,
	@City nvarchar,
	@State nvarchar,
	@Zip nvarchar,
	@Email nvarchar,
	@Phone nvarchar,
	@BillType nvarchar,
	@RotaryMember bit
AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Buyer(Active, LastName, FirstName, StreetAddress, City, State, Zip, Email, Phone, BillType, RotaryMember)
		VALUES ('1', @LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @BillType, @RotaryMember)
	END
