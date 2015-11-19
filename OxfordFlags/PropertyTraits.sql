CREATE TABLE [dbo].[PropertyTraits] (
    [PropertyOwnerID] INT NOT NULL,
    [TraitID]         INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PropertyOwnerID] ASC, [TraitID] ASC),
    CONSTRAINT [PropertyID] FOREIGN KEY ([PropertyOwnerID]) REFERENCES [dbo].[PropertyOwner] ([PropertyOwnerID]), 
    CONSTRAINT [TraitID] FOREIGN KEY ([TraitID]) REFERENCES [dbo].[Trait]([TraitID])
);

