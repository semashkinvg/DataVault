CREATE PROCEDURE dbo.usp_LinkProductOkpd_T (@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.LinkProductOkpd AS target
	USING
(
    SELECT 
		 HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')+isnull(result.ProductOKPDCode, '')) as LinkHashKey,
		 @loadDate AS LoadDate,
              result.SystemSource,
              HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductOKPDCode), '')) as OkpdHashKey,
              HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) as ProductHashKey
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.ProductOKPDCode AS ProductOKPDCode,
         c.ProductSid AS ProductId
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductOKPDCode IS NOT NULL AND c.ProductSid IS NOT NULL
) AS result
) AS source(LinkHashKey, LoadDate, SystemSource, OkpdHashKey,ProductHashKey)
	ON target.[LinkProductOkpdHashKey] = source.LinkHashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT([LinkProductOkpdHashKey],
		 LoadDate,
SystemSource,
[OkpdHashKey],
[ProductHashKey])
		 VALUES
(source.LinkHashKey,
 source.LoadDate,
 source.SystemSource,
 source.OkpdHashKey,
 source.ProductHashKey
);
	RETURN 0;
