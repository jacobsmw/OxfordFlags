CREATE TABLE [Order]
(
	[OrderID] INT NOT NULL PRIMARY KEY, 
    [OrderDate] DATE NOT NULL, 
    [Source] VARCHAR(50) NULL, 
    [SubYear] INT NOT NULL, 
    [BasePrice] SMALLMONEY NOT NULL, 
    [DiscountID] INT NULL, 
    [Type] VARCHAR(10) NOT NULL, 
    [ConfirmationDate] DATE NULL, 
    [FirstHoliday] VARCHAR(12) NOT NULL
)
