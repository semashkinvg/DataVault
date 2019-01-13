CREATE TABLE [dbo].SatProductDelivery
(
	[ProductHashKey] VARBINARY(20) NOT NULL,
	LoadDate DATETIME NOT NULL,
	SourceSystem varchar(10) NOT NULL,
    [SafetyStockLevel]      SMALLINT         NOT NULL,
    [Size]                  NVARCHAR (5)     NULL,
    [SizeUnitMeasureCode]   NCHAR (3)        NULL,
    [WeightUnitMeasureCode] NCHAR (3)        NULL,
    [Weight]                DECIMAL(8, 2)   NULL,
    [DaysToManufacture]     INT              NOT NULL,
	CONSTRAINT PK_SatProductDelivery_ProductHashKey_LoadDate PRIMARY KEY (ProductHashKey,LoadDate)
)
