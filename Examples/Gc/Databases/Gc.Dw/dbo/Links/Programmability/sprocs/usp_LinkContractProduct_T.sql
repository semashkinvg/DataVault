CREATE PROCEDURE dbo.usp_LinkContractProduct_T (@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.[LinkContractProduct] AS target
	USING
(
    SELECT 
		 HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ContractId), '')+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) as LinkHashKey,
		 @loadDate AS LoadDate,
              result.SystemSource,
              HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ContractId), '')) as ContractHashKey,
              HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) as ProductHashKey
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.SourceId AS ContractId,
         c.ProductSid AS ProductId
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductSid IS NOT NULL
) AS result
) AS source(LinkHashKey, LoadDate, SystemSource, ContractHashKey,ProductHashKey)
	ON target.ContractProductHashKey = source.LinkHashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT(ContractProductHashKey,
		 LoadDate,
SystemSource,
ContractHashKey,
[ProductHashKey])
		 VALUES
(source.LinkHashKey,
 source.LoadDate,
 source.SystemSource,
 source.ContractHashKey,
 source.ProductHashKey
);
	RETURN 0;
