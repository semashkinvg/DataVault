CREATE PROCEDURE dbo.usp_HubProduct_T (@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.HubProduct AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.ProductId
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.ProductSid AS ProductId
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductSid IS NOT NULL
) AS result
) AS source(HashKey, LoadDate, SystemSource, ProductId)
	ON target.ProductHashKey = source.HashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT(ProductHashKey,
			   LoadDate,
			   SystemSource,
			   ProductId)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.ProductId
);
	RETURN 0;
