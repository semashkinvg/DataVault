CREATE PROCEDURE dbo.usp_SatContractProductPrice_T(@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.SatContractProductPrice AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ContractId), '')+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.Price,
		 result.Quantity
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.ProductPrice as Price,
		 c.ProductQuantity as Quantity,
		 c.SourceId AS ContractId,
		 c.ProductSid as ProductId
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductSid IS NOT NULL
) AS result
) AS source(HashKey, LoadDate,SystemSource,Price,Quantity)
	ON target.ContractProductHashKey = source.HashKey  
			-- it's up to us how to handle updates of the name, we might insert a new raw or update existing
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate,
					Price = source.Price,
					Quantity = source.Quantity
	    WHEN NOT MATCHED
	    THEN
		 INSERT(ContractProductHashKey,
			   LoadDate,
			   SystemSource,Price,Quantity)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.Price,
 source.Quantity
);
	RETURN 0;
