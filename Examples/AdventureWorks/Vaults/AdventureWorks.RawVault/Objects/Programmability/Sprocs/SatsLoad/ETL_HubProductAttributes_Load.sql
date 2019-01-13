CREATE PROCEDURE [dbo].ETL_HubProductAttributes_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.HubProduct AS target
	USING
	(
		SELECT
			 dbo.DeriveProductHashKey('AW', c.ProductNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			 c.ProductNumber AS ProductNumber
		FROM [$(AdventureWorksStaging)].dbo.[Products] c
	) AS SOURCE(HashKey, LoadDate, SourceSystem, ProductNumber)
	ON target.ProductHashKey = source.HashKey  
		WHEN NOT MATCHED
		THEN
			INSERT(ProductHashKey,
				LoadDate,
				LastSeenDate,
				SourceSystem,
				Code)
			VALUES
				(source.HashKey,
					source.LoadDate,
					source.LoadDate,
					source.SourceSystem,
					source.ProductNumber
				);
RETURN 0
