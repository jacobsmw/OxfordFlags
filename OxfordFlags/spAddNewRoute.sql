CREATE PROCEDURE [dbo].[spAddNewRoute]
	@PropertyOwnerID int,
	@RouteColor nvarchar(15),
	@SortOrder int

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Route](PropertyOwnerID, RouteColor, SortOrder)
		VALUES (@PropertyOwnerID, @RouteColor, @SortOrder)
	END