﻿CREATE PROCEDURE [dbo].[spAddNewSource]
	@SourceName nvarchar

AS
	SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[Source](SourceName)
		VALUES (@SourceName)
	END