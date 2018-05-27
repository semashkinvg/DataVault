CREATE TABLE [dbo].[HubOkpd]
(
	[OkpdHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	OkpdId varchar(100)
)
