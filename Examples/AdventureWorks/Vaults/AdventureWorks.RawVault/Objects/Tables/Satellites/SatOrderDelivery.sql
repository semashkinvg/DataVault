CREATE TABLE [dbo].[SatOrderDelivery]
(
	[OrderHashKey] VARBINARY(20) NOT NULL,
	LoadDate DATETIME NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	DeliveryDate DATETIME NOT NULL,
	[TerritoryID]            INT                   NULL,
    [BillToAddressID]        INT                   NULL,
    [ShipToAddressID]        INT                   NULL,
    [ShipMethodID]           INT                   NULL,
	CONSTRAINT PK_SatOrderDelivery_OrderHashKey_LoadDate PRIMARY KEY (OrderHashKey,LoadDate)
)
