CREATE TABLE [Sleeve]
(
	[SleeveID] INT NOT NULL PRIMARY KEY, 
    [Active] BIT NOT NULL, 
    [OrderID] INT NOT NULL, 
    [PropertyOwnerID] INT NOT NULL, 
    [LocationDescription] TEXT NULL, 
    [Latitude] DECIMAL(8, 6) NOT NULL, 
    [Longitude] DECIMAL(8, 6) NOT NULL, 
    [Photo] VARCHAR(50) NULL, 
    [OupsID] INT NULL, 
    [InstalledDate] DATE NULL, 
    [ChangeDate] DATE NULL, 
    [Public] BIT NULL, 
    [Deliver] BIT NULL 
)
