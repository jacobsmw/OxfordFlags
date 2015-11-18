CREATE PROCEDURE [dbo].[spAddNewOccasion]
	@OccasionName nvarchar
AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Occasion(OccasionName)
		VALUES (@OccasionName)
	END