CREATE PROCEDURE [dbo].ETL_HubCustomer_Load(@LoadDate datetime)
AS
	SET NOCOUNT ON;

	
	MERGE dbo.HubCustomer AS target
	USING
	(
		SELECT
			 dbo.DeriveOrderHashKey('AW', c.SourceCustomerID) AS HashKey,
			 @LoadDate as LoadDate,
			 'AW' AS SystemSource,
			 Convert(nvarchar(100),c.SourceCustomerID) AS CustomerId
		FROM [$(AdventureWorksStaging)].dbo.Customers c
	) AS SOURCE(HashKey, LoadDate, SourceSystem, CustomerId)
	ON target.CustomerHashKey = source.HashKey  
		WHEN MATCHED
		THEN UPDATE SET
					LastSeenDate = source.LoadDate
		WHEN NOT MATCHED
		THEN
			INSERT(CustomerHashKey,
				LoadDate,
				LastSeenDate,
				SourceSystem,
				CustomerId)
			VALUES
				(source.HashKey,
					source.LoadDate,
					source.LoadDate,
					source.SourceSystem,
					source.CustomerId
				);
RETURN 0
