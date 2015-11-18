CREATE PROCEDURE [dbo].[spAddNewTraits]
	@TraitDescription nvarchar

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Traits](TraitDescription)
		VALUES (@TraitDescription)
	END