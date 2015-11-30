CREATE PROCEDURE [dbo].[spAddNewTrait]
	@TraitDescription nvarchar(50)

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Trait](TraitDescription)
		VALUES (@TraitDescription)
	END