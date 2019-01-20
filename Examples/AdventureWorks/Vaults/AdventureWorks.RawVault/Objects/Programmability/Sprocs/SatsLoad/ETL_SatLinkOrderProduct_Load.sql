CREATE PROCEDURE [dbo].ETL_SatLinkOrderProduct_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;
	
	MERGE dbo.[SatLinkOrderProduct] AS target
	USING
	(
		SELECT
			 dbo.DeriveLinkOrderProductHashKey('AW', o.SalesOrderNumber, p.ProductNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' as SourceSystem,
			ol.[CarrierTrackingNumber],
			ol.[OrderQty],
			ol.[ProductID],
			ol.[SpecialOfferID],
			ol.[UnitPrice],
			ol.[UnitPriceDiscount],
			ol.[LineTotal],
			ol.[ModifiedDate]
		FROM [$(AdventureWorksStaging)].dbo.OrderLines ol
		inner join [$(AdventureWorksStaging)].dbo.Orders o on ol.[SourceSalesOrderID]  = o.[SourceSalesOrderID]
		inner join [$(AdventureWorksStaging)].dbo.Products p on ol.ProductId  = p.[SourceProductID]
	) AS SOURCE(HashKey, LoadDate,SourceSystem,
				[CarrierTrackingNumber],
				[OrderQty],
				[ProductID],
				[SpecialOfferID],
				[UnitPrice],
				[UnitPriceDiscount],
				[LineTotal],
				[ModifiedDate])
	ON target.LinkOrderProductHashKey = source.HashKey AND target.LoadDate = source.LoadDate  
		WHEN NOT MATCHED
		THEN
			INSERT(LinkOrderProductHashKey,
				LoadDate,
				SourceSystem,
				[CarrierTrackingNumber],
				[OrderQty],
				[ProductID],
				[SpecialOfferID],
				[UnitPrice],
				[UnitPriceDiscount],
				[LineTotal],
				[ModifiedDate])
			VALUES
				(source.HashKey,
				source.LoadDate,
				source.SourceSystem,
				source.[CarrierTrackingNumber],
				source.[OrderQty],
				source.[ProductID],
				source.[SpecialOfferID],
				source.[UnitPrice],
				source.[UnitPriceDiscount],
				source.[LineTotal],
				source.[ModifiedDate]
				);
RETURN 0
