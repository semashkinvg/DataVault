CREATE TABLE [dbo].[HubOrganization]
(
	[OrganizationHashKey] VARBINARY(20) NOT NULL PRIMARY KEY,
	LoadDate datetime default GETUTCDATE(),
	SystemSource varchar(100),
	Inn varchar(15),
	Kpp varchar(15)
)
