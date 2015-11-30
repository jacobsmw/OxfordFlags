CREATE PROCEDURE [dbo].[spAddNewSleeve]
	@Active bit,
	@OrderID int,
	@PropertyOwnerID int,
	@LocationDescription nvarchar(2000),
	@Latitude float,
	@Longitude float,
	@Photo nvarchar(50),
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