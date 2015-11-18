CREATE PROCEDURE [dbo].[spAddNewSleeve]
	@Active bit,
	@OrderID int,
	@PropertyOwnerID int,
	@LocationDescription nvarchar,
	@Latitude float,
	@Longitude float,
	@Photo nvarchar,
	@OupsID int,
	@InstalledDate date,
	@ChangeDate date,
	@Public bit,
	@Deliver bit,
	@ExpiredDate date

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Sleeve](Active, OrderID, PropertyOwnerID, LocationDescription, Latitude, Longitude, Photo, OupsID, InstalledDate, ChangeDate, "Public", Deliver, ExpiredDate)
		VALUES ('1', @OrderID, @PropertyOwnerID, @LocationDescription, @Latitude, @Longitude, @Photo, @OupsID, @InstalledDate, @ChangeDate, @Public, @Deliver, @ExpiredDate)
	END