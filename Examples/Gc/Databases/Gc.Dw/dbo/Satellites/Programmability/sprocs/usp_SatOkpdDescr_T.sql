CREATE PROCEDURE dbo.usp_SatOkpdDescr_T(@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.SatOkpdDescr AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ProductOKPDCode), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.ProductOKPDName
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.ProductOKPDCode AS ProductOKPDCode,
		 isnull(c.ProductOKPDName,'unknown') as ProductOKPDName
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.ProductOKPDCode IS NOT NULL
) AS result
) AS source(HashKey, LoadDate, SystemSource, ProductOKPDName)
	ON target.OkpdHashKey = source.HashKey  
			-- it's up to us how to handle updates of the name, we might insert a new raw or update existing
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate,
					Descr = source.ProductOKPDName
	    WHEN NOT MATCHED
	    THEN
		 INSERT(OkpdHashKey,
			   LoadDate,
			   SystemSource,
			   Descr)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.ProductOKPDName
);
	RETURN 0;
