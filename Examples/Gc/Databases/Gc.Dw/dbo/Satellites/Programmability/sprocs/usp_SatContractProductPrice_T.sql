CREATE PROCEDURE dbo.usp_SatContractProductPrice_T(@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
if objecT_id('tempdb..#SatContractProductPrice') is not null drop table #SatContractProductPrice

SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ContractId), '')+isnull(CONVERT(NVARCHAR(MAX), result.ProductId), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.Price,
		 result.Quantity,
		 HASHBYTES('SHA1', isnull(CONVERT(NVARCHAR(MAX), result.Price), '')+isnull(CONVERT(NVARCHAR(MAX), result.Quantity), '')) AS HashDiff
		 INTO #SatContractProductPrice
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

CREATE UNIQUE CLUSTERED INDEX [UQ_#SatContractProductPrice_HashKey_LoadDate] ON #SatContractProductPrice(HashKey,LoadDate)

-- handles 
-- 1) WHEN
-- Key =
-- LoadDate = 
-- Diff <>
-- THEN Update
-- 2) WHEN
-- Key or LoadDate <> 
-- THEN Insert
-- 3) WHEN
-- Key =
-- Diff = 
-- LoadDate <>
-- THEN DO NOTHING

	MERGE dbo.SatContractProductPrice AS target
	USING
(
    SELECT 
	scpp.HashKey,
	scpp.LoadDate,
	scpp.SystemSource,
	scpp.Price,
	scpp.Quantity,
	scpp.HashDiff
	FROM #SatContractProductPrice scpp
) AS source(HashKey, LoadDate,SystemSource,Price,Quantity,HashDiff)
	ON target.ContractProductHashKey = source.HashKey AND target.LoadDate = source.LoadDate
	    WHEN MATCHED AND target.HashDiff <> source.HashDiff
	    THEN UPDATE SET
					Price = source.Price,
					Quantity = source.Quantity
	    WHEN NOT MATCHED
	    THEN
		 INSERT(ContractProductHashKey,
			   LoadDate,
			   SystemSource,Price,Quantity,HashDiff)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.Price,
 source.Quantity,
 source.HashDiff
);
	RETURN 0;
