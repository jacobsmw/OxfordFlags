CREATE TABLE [PropertyOwner]
(
	[PropertyOwnerID] INT NOT NULL PRIMARY KEY, 
    [LastName] VARCHAR(25) NULL, 
    [FirstName] VARCHAR(25) NULL, 
    [StreetAddress] VARCHAR(50) NOT NULL, 
    [City] VARCHAR(25) NOT NULL, 
    [State] CHAR(2) NOT NULL, 
    [Zip] INT NULL, 
    [Email] VARCHAR(30) NULL, 
    [Phone] CHAR(10) NULL, 
    [New] BIT NOT NULL, 
    [Sprinkler] BIT NOT NULL, 
    [Fence] BIT NOT NULL
)
