CREATE PROCEDURE [dbo].ETL_SatProductAttributes_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.SatProductAttributes AS target
	USING
	(
		SELECT
			 dbo.DeriveProductHashKey('AW', c.ProductNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			 c.[MakeFlag],
			 c.[FinishedGoodsFlag],
			 c.[Color],
			 c.[DaysToManufacture],
			 c.[ProductLine],
			 c.[Class],
			 c.[Style],
			 c.[ProductSubcategoryID],
			 c.[ProductModelID],
			 c.[ModifiedDate]
		FROM [$(AdventureWorksStaging)].dbo.[Products] c
	) AS SOURCE(HashKey, LoadDate, SourceSystem,
				[MakeFlag],
				[FinishedGoodsFlag],
				[Color],
				[DaysToManufacture],
				[ProductLine],
				[Class],
				[Style],
				[ProductSubcategoryID],
				[ProductModelID],
				[ModifiedDate])
	ON target.ProductHashKey = source.HashKey AND target.LoadDate = source.LoadDate  
		WHEN NOT MATCHED
		THEN
			INSERT(ProductHashKey,
				LoadDate,
				SourceSystem,
				[MakeFlag],
				[FinishedGoodsFlag],
				[Color],
				[DaysToManufacture],
				[ProductLine],
				[Class],
				[Style],
				[ProductSubcategoryID],
				[ProductModelID],
				[ModifiedDate])
			VALUES
				(source.HashKey,
				source.LoadDate,
				source.SourceSystem,
				source.[MakeFlag],
				source.[FinishedGoodsFlag],
				source.[Color],
				source.[DaysToManufacture],
				source.[ProductLine],
				source.[Class],
				source.[Style],
				source.[ProductSubcategoryID],
				source.[ProductModelID],
				source.[ModifiedDate]
				);
RETURN 0
