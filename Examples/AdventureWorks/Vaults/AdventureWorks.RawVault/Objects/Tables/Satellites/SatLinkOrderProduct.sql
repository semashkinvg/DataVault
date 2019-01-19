CREATE TABLE [dbo].SatLinkOrderProduct
(
	[LinkOrderProductHashKey] VARBINARY(20) NOT NULL,
	LoadDate DATETIME NOT NULL,
	SourceSystem varchar(10) NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25)    NULL,
    [OrderQty]              SMALLINT         NULL,
    [ProductID]             INT              NULL,
    [SpecialOfferID]        INT              NULL,
    [UnitPrice]             MONEY            NULL,
    [UnitPriceDiscount]     MONEY            NULL,
    [LineTotal]             MONEY			NULL,
    [ModifiedDate]          DATETIME         NULL
	CONSTRAINT PK_SatLinkOrderProduct_ProductHashKey_LoadDate PRIMARY KEY CLUSTERED ([LinkOrderProductHashKey],LoadDate)
)
