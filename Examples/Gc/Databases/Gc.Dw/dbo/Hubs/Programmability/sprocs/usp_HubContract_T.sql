CREATE PROCEDURE dbo.usp_HubContract_T (@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.HubContract AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+isnull(CONVERT(NVARCHAR(MAX), result.ContractId), '')) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.ContractId
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.SourceId AS ContractId
    FROM [$(GcRaw)].dbo.Contract c
) AS result
) AS source(HashKey, LoadDate, SystemSource, ContractId)
	ON target.ContractHashKey = source.HashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT(ContractHashKey,
			   LoadDate,
			   SystemSource,
			   ContractId)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.ContractId
);
	RETURN 0;
