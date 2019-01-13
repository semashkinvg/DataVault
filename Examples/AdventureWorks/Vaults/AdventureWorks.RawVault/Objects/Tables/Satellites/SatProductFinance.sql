CREATE TABLE [dbo].SatProductFinance
(
	[ProductHashKey] VARBINARY(20) NOT NULL,
	LoadDate DATETIME NOT NULL,
	SourceSystem varchar(10) NOT NULL,
    [ReorderPoint]          SMALLINT         NOT NULL,
    [StandardCost]          MONEY            NOT NULL,
    [ListPrice]             MONEY            NOT NULL,
    [SellStartDate]         DATETIME         NOT NULL,
    [SellEndDate]           DATETIME         NULL,
    [DiscontinuedDate]      DATETIME         NULL,
	CONSTRAINT PK_SatProductFinance_ProductHashKey_LoadDate PRIMARY KEY (ProductHashKey,LoadDate)
)
