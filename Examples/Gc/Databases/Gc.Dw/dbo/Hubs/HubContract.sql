CREATE TABLE [dbo].[HubContract]
(
	[ContractHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	ContractId bigint
)
