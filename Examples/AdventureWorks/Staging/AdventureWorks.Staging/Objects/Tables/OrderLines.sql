CREATE TABLE [dbo].[OrderLines]
(
	[Id] INT identity(1,1) NOT NULL PRIMARY KEY,
	[SourceSalesOrderID]          INT              NULL,
    [SourceSalesOrderDetailID]    INT              NULL,
    [CarrierTrackingNumber] NVARCHAR (25)    NULL,
    [OrderQty]              SMALLINT         NULL,
    [ProductID]             INT              NULL,
    [SpecialOfferID]        INT              NULL,
    [UnitPrice]             MONEY            NULL,
    [UnitPriceDiscount]     MONEY            NULL,
    [LineTotal]             MONEY			NULL,
    [rowguid]               UNIQUEIDENTIFIER NULL,
    [ModifiedDate]          DATETIME         NULL
)
