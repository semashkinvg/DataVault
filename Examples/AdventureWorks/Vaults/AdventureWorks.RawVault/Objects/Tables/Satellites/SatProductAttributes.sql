CREATE TABLE [dbo].SatProductAttributes
(
	[ProductHashKey] VARBINARY(20) NOT NULL,
	LoadDate DATETIME NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	[MakeFlag]              BIT     NOT NULL,
    [FinishedGoodsFlag]     BIT     NOT NULL,
    [Color]                 NVARCHAR (15)    NULL,
    [DaysToManufacture]     INT              NOT NULL,
    [ProductLine]           NCHAR (2)        NULL,
    [Class]                 NCHAR (2)        NULL,
    [Style]                 NCHAR (2)        NULL,
    [ProductSubcategoryID]  INT              NULL,
    [ProductModelID]        INT              NULL,
    [ModifiedDate]          DATETIME         NOT NULL,
	CONSTRAINT PK_SatProductAttributes_ProductHashKey_LoadDate PRIMARY KEY (ProductHashKey,LoadDate)
)
