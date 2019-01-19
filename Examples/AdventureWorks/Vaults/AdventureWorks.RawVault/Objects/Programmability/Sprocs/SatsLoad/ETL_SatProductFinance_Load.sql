CREATE PROCEDURE [dbo].ETL_SatProductFinance_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.SatProductFinance AS target
	USING
	(
		SELECT
			 dbo.DeriveProductHashKey('AW', c.ProductNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			[ReorderPoint],
			[StandardCost],
			[ListPrice],
			[SellStartDate],
			[SellEndDate],
			[DiscontinuedDate]
		FROM [$(AdventureWorksStaging)].dbo.[Products] c
	) AS SOURCE(HashKey, LoadDate, SourceSystem,
			[ReorderPoint],
			[StandardCost],
			[ListPrice],
			[SellStartDate],
			[SellEndDate],
			[DiscontinuedDate])
	ON target.ProductHashKey = source.HashKey AND target.LoadDate = source.LoadDate  
		WHEN NOT MATCHED
		THEN
			INSERT(ProductHashKey,
				LoadDate,
				SourceSystem,
				[ReorderPoint],
				[StandardCost],
				[ListPrice],
				[SellStartDate],
				[SellEndDate],
				[DiscontinuedDate])
			VALUES
				(source.HashKey,
				source.LoadDate,
				source.SourceSystem,
				source.[ReorderPoint],
				source.[StandardCost],
				source.[ListPrice],
				source.[SellStartDate],
				source.[SellEndDate],
				source.[DiscontinuedDate]
				);
RETURN 0
