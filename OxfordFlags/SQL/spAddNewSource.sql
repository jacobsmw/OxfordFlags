CREATE PROCEDURE [dbo].[spAddNewSource]
	@SourceName nvarchar(50)

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Source](SourceName)
		VALUES (@SourceName)
	END