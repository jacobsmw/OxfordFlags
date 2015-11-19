CREATE PROCEDURE [dbo].[spAddNewOups]
	@OupsTicketNumber nvarchar(50),
	@OupsNotifiedDate date,
	@OupsCheckedDate date

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Oups] (OupsTicketNumber, OupsNotifiedDate, OupsCheckedDate)
		VALUES (@OupsTicketNumber, @OupsNotifiedDate, @OupsCheckedDate)
	END