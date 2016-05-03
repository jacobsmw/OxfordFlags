CREATE PROCEDURE [dbo].[spSearchAddressResults]
	@PROPERTYID int
AS
	SET NOCOUNT ON
	IF (NOT EXISTS(SELECT [PropertyTraits].PropertyOwnerID FROM [dbo].[PropertyOwner] WHERE [PropertyTraits].PropertyOwnerID = @PROPERTYID))
	BEGIN
		SELECT [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].StreetAddress, [PropertyOwner].City, [PropertyOwner].State, [PropertyOwner].Zip, [PropertyOwner].Email, [PropertyOwner].Phone, [PropertyOwner].RotaryMember, 
		[Sleeve].SleeveName, [Sleeve].Active, [Sleeve].LocationDescription, [Sleeve].Latitude, [Sleeve].Longitude, [Sleeve].InstalledDate, [Sleeve].ChangeDate, [Sleeve].ExpiredDate, [Sleeve].Deliver,
		[Oups].OupsTicketNumber, [Oups].OupsNotifiedDate, [Oups].OupsCheckedDate
		FROM [PropertyOwner] 
		JOIN [Sleeve] ON [PropertyOwner].PropertyOwnerID = [Sleeve].PropertyOwnerID 
		JOIN [Oups] ON [Sleeve].OupsID = [Oups].OupsID
	END
	ELSE
	BEGIN
		SELECT [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].StreetAddress, [PropertyOwner].City, [PropertyOwner].State, [PropertyOwner].Zip, [PropertyOwner].Email, [PropertyOwner].Phone, [PropertyOwner].RotaryMember, 
		[Sleeve].SleeveName, [Sleeve].Active, [Sleeve].LocationDescription, [Sleeve].Latitude, [Sleeve].Longitude, [Sleeve].InstalledDate, [Sleeve].ChangeDate, [Sleeve].ExpiredDate, [Sleeve].Deliver,
		[Oups].OupsTicketNumber, [Oups].OupsNotifiedDate, [Oups].OupsCheckedDate,
		[Trait].TraitDescription
		FROM [PropertyOwner] 
		JOIN [Sleeve] ON [PropertyOwner].PropertyOwnerID = [Sleeve].PropertyOwnerID 
		JOIN [Oups] ON [Sleeve].OupsID = [Oups].OupsID
		JOIN [PropertyTraits] ON [PropertyOwner].PropertyOwnerID = [PropertyTraits].PropertyOwnerID 
		JOIN [Trait] ON [PropertyTraits].TraitID = [Trait].TraitID
		WHERE [PropertyOwner].PropertyOwnerID = @PROPERTYID;
	END
RETURN

