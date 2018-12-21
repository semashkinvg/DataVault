CREATE TABLE [dbo].[LinkOrderProduct]
(
	LinkOrderProductHashKey VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime NOT NULL,
	OrderHashKey VARBINARY(20) NOT NULL,
	ProductHashKey VARBINARY(20) NOT NULL,
	LineNumber_ChildDependantKey INT NOT NULL,
)
