CREATE PROCEDURE [dbo].[ETL_LinkOrderProduct_Load](@LoadDate datetime)
AS
	SET NOCOUNT ON;
	
	MERGE dbo.[LinkOrderProduct] AS target
	USING
	(
		SELECT
			 dbo.DeriveLinkOrderProductHashKey('AW', o.SalesOrderNumber, p.ProductNumber) AS HashKey,
			 dbo.DeriveOrderHashKey('AW', o.SalesOrderNumber) AS OrderHashKey,
			 dbo.DeriveOrderHashKey('AW', p.ProductNumber) AS ProductHashKey,
			 @LoadDate as LoadDate
		FROM [$(AdventureWorksStaging)].dbo.OrderLines ol
		inner join [$(AdventureWorksStaging)].dbo.Orders o on ol.[SourceSalesOrderID]  = o.[SourceSalesOrderID]
		inner join [$(AdventureWorksStaging)].dbo.Products p on ol.ProductId  = p.[SourceProductID]
	) AS SOURCE(HashKey, OrderHashKey, ProductHashKey, LoadDate)
	ON target.LinkOrderProductHashKey = source.HashKey
		WHEN MATCHED
		THEN UPDATE SET
					LastSeenDate = source.LoadDate
		WHEN NOT MATCHED
		THEN
			INSERT(LinkOrderProductHashKey,
				LoadDate,
				LastSeenDate,
				OrderHashKey,
				ProductHashKey,
				LineNumber_ChildDependantKey)
			VALUES
				(source.HashKey,
				source.LoadDate,
				source.LoadDate,
				source.OrderHashKey,
				source.ProductHashKey,
				0
				);
RETURN 0
