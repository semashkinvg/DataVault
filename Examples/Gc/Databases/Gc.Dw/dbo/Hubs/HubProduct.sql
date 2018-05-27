CREATE TABLE [dbo].[HubProduct]
(
	[ProductHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	ProductId bigint
)
