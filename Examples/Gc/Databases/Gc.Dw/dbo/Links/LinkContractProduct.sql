CREATE TABLE [dbo].[LinkContractProduct]
(
	[ContractProductHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	[ContractHashKey] VARBINARY(20) NOT NULL,
	[ProductHashKey] VARBINARY(20) NOT NULL
)
