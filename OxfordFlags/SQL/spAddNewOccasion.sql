CREATE PROCEDURE [dbo].[spAddNewOccasion]
	@OccasionName nvarchar(50)
AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO dbo.Occasion(OccasionName)
		VALUES (@OccasionName)
	END