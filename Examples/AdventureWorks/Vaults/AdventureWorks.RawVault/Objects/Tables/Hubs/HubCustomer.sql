CREATE TABLE [dbo].[HubCustomer]
(
	[CustomerHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime NOT NULL,
	LastSeenDate datetime NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	CustomerId VARCHAR(50) NOT NULL
)
