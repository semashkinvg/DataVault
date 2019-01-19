/*
note:
same  table as LinkOrderProduct but Order and product hash keys covered with clustered index
*/
CREATE TABLE [dbo].LinkOrderProduct2
(
	LinkOrderProductHashKey VARBINARY(20) NOT NULL  PRIMARY KEY NONCLUSTERED,
	LoadDate datetime NOT NULL,
	OrderHashKey VARBINARY(20) NOT NULL,
	ProductHashKey VARBINARY(20) NOT NULL,
	LineNumber_ChildDependantKey INT NOT NULL,
	INDEX IX_LinkOrderProduct2_OrderHashKey_ProductHashKey CLUSTERED (OrderHashKey,ProductHashKey) 
)
