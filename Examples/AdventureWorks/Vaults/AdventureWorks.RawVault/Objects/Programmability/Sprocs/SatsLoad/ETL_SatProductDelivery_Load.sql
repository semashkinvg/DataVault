CREATE PROCEDURE [dbo].ETL_SatProductDelivery_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.SatProductDelivery AS target
	USING
	(
		SELECT
			 dbo.DeriveProductHashKey('AW', c.ProductNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			[SafetyStockLevel],
			[Size],
			[SizeUnitMeasureCode],
			[WeightUnitMeasureCode],
			[Weight],
			[DaysToManufacture]
		FROM [$(AdventureWorksStaging)].dbo.[Products] c
	) AS SOURCE(HashKey, LoadDate, SourceSystem,
			[SafetyStockLevel],
			[Size],
			[SizeUnitMeasureCode],
			[WeightUnitMeasureCode],
			[Weight],
			[DaysToManufacture])
	ON target.ProductHashKey = source.HashKey AND target.LoadDate = source.LoadDate  
		WHEN NOT MATCHED
		THEN
			INSERT(ProductHashKey,
				LoadDate,
				SourceSystem,
				[SafetyStockLevel],
				[Size],
				[SizeUnitMeasureCode],
				[WeightUnitMeasureCode],
				[Weight],
				[DaysToManufacture])
			VALUES
				(source.HashKey,
				source.LoadDate,
				source.SourceSystem,
				source.[SafetyStockLevel],
				source.[Size],
				source.[SizeUnitMeasureCode],
				source.[WeightUnitMeasureCode],
				source.[Weight],
				source.[DaysToManufacture]
				);
RETURN 0
