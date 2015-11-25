CREATE TABLE [Route]
(
	[PropertyOwnerID] INT NOT NULL PRIMARY KEY, 
    [RouteColor] VARCHAR(15) NOT NULL, 
    [PreviousPropertyOwnerID] INT NULL
)
