CREATE TABLE [Payment]
(
	[BuyerID] INT NOT NULL , 
    [OrderID] INT NOT NULL, 
    PRIMARY KEY ([BuyerID],[OrderID])
)
