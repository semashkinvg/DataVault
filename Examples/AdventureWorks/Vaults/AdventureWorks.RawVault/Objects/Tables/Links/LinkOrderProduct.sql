CREATE TABLE [dbo].[LinkOrderProduct]
(
	LinkOrderProductHashKey VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime NOT NULL,
	LastSeenDate datetime NOT NULL,
	OrderHashKey VARBINARY(20) NOT NULL,
	ProductHashKey VARBINARY(20) NOT NULL,
	LineNumber_ChildDependantKey INT NOT NULL,
)
GO
CREATE NONCLUSTERED INDEX IX_LinkOrderProduct_OrderHashKey_ProductHashKey 
		ON [dbo].[LinkOrderProduct](OrderHashKey,ProductHashKey) INCLUDE (LineNumber_ChildDependantKey)
