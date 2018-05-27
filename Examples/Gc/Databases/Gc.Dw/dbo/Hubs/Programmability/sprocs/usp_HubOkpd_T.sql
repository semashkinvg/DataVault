CREATE PROCEDURE dbo.usp_HubOkpd_T(@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.HubOkpd AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductOKPDCode), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.ProductOKPDCode
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.ProductOKPDCode AS ProductOKPDCode
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductOKPDCode IS NOT NULL
) AS result
) AS source(HashKey, LoadDate, SystemSource, ProductOKPDCode)
	ON target.OkpdHashKey = source.HashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT(OkpdHashKey,
			   LoadDate,
			   SystemSource,
			   OkpdId)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.ProductOKPDCode
);
	RETURN 0;
