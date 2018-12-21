CREATE TABLE [dbo].[HubProduct]
(
	[ProductHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	Code VARCHAR(100) NOT NULL
)
