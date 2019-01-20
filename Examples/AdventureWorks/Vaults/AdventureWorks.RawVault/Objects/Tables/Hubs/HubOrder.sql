CREATE TABLE [dbo].[HubOrder]
(
	[OrderHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime NOT NULL,
	LastSeenDate datetime NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	OrderNumber VARCHAR(100) NOT NULL
)
GO
CREATE NONCLUSTERED INDEX IX_HubOrder_OrderNumber ON dbo.HubOrder(OrderNumber);
