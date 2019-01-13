CREATE TABLE [dbo].[SatOrganizationCustomer]
(
	OrganizationCustomerHashKey VARBINARY(20) NOT NULL,
	LoadDate datetime,
	SystemSource varchar(100),
	FullName nvarchar(max),
	HashDiff VARBINARY(20) NOT NULL,
    CONSTRAINT PK_SatOrganizationCustomer_OrganizationCustomerHashKey_LoadDate PRIMARY KEY (OrganizationCustomerHashKey,LoadDate)
)
