CREATE PROCEDURE [dbo].ETL_HubProduct_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.HubOrder AS target
	USING
	(
		SELECT
			 dbo.DeriveOrderHashKey('AW', c.SalesOrderNumber) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			 c.SalesOrderNumber AS OrderNumber
		FROM [$(AdventureWorksStaging)].dbo.[Orders] c
	) AS SOURCE(HashKey, LoadDate, SourceSystem, OrderNumber)
	ON target.OrderHashKey = source.HashKey  
		WHEN NOT MATCHED
		THEN
			INSERT(OrderHashKey,
				LoadDate,
				LastSeenDate,
				SourceSystem,
				OrderNumber)
			VALUES
				(source.HashKey,
					source.LoadDate,
					source.LoadDate,
					source.SourceSystem,
					source.OrderNumber
				);
RETURN 0
