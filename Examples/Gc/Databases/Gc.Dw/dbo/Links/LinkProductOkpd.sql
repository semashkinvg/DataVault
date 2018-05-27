CREATE TABLE [dbo].[LinkProductOkpd]
(
	[LinkProductOkpdHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	[OkpdHashKey] VARBINARY(20) NOT NULL,
	[ProductHashKey] VARBINARY(20) NOT NULL
)
