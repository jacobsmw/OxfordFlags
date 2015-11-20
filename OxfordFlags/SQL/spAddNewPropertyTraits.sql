CREATE PROCEDURE [dbo].[spAddNewPropertyTraits]
	@PropertyOwnerID int,
	@TraitID int

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[PropertyTraits](PropertyOwnerID, TraitID)
		VALUES (@PropertyOwnerID, @TraitID)
	END