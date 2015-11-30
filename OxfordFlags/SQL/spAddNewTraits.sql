CREATE PROCEDURE [dbo].[spAddNewTraits]
	@TraitDescription nvarchar(50)

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Traits](TraitDescription)
		VALUES (@TraitDescription)
	END