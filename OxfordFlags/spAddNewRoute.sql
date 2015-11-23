CREATE PROCEDURE [dbo].[spAddNewRoute]
	@PropertyOwnerID int,
	@RouteColor nvarchar,
	@SortOrder int

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Route](PropertyOwnerID, RouteColor, SortOrder)
		VALUES (@PropertyOwnerID, @RouteColor, @SortOrder)
	END