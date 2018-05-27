CREATE TABLE [dbo].SatContractProductPrice
(
	[ContractProductHashKey] VARBINARY(20) NOT NULL,
	LoadDate datetime,
	SystemSource varchar(100),
	Price decimal(30,5) NULL,
	Quantity decimal(30,5) NULL,
    CONSTRAINT PK_SatContractProductPrice_ContractProductHashKey_LoadDate PRIMARY KEY (ContractProductHashKey,LoadDate)
)
