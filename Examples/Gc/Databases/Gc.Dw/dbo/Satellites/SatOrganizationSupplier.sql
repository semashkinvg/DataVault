CREATE TABLE [dbo].[SatOrganizationSupplier]
(
	OrganizationSupplierHashKey VARBINARY(20) NOT NULL,
	LoadDate datetime,
	SystemSource varchar(100),
	CountryCode varchar(10),
	CountryFullName nvarchar(max),
	FactualAddress nvarchar(max),
	PostAddress nvarchar(max),
	LegalFormCode varchar(10),
	LegalFormSingularName nvarchar(max),
	OrganizationName nvarchar(max),
	HashDiff VARBINARY(20) NOT NULL,
    CONSTRAINT PK_SatOrganizationSupplier_OrganizationSupplierHashKey_LoadDate PRIMARY KEY (OrganizationSupplierHashKey,LoadDate)
)
