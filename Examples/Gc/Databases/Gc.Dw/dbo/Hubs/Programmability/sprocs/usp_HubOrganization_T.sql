CREATE PROCEDURE dbo.usp_HubOrganization_T(@dataSource VARCHAR(100), @loadDate DATETIME)
AS
SET NOCOUNT ON;
	MERGE dbo.HubOrganization AS target
	USING
(
    SELECT HASHBYTES('SHA1', SystemSource+Inn+Kpp) AS HashKey,
		 @loadDate AS LoadDate,
		 result.SystemSource,
		 result.Inn,
		 result.Kpp
    FROM
(
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.CustomerInn AS Inn,
		 c.CustomerKpp AS Kpp
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.CustomerInn IS NOT NULL AND c.CustomerKpp IS NOT NULL
	UNION 
    SELECT DISTINCT
		 @dataSource AS SystemSource,
		 c.CustomerInn AS Inn,
		 c.CustomerKpp AS Kpp
    FROM [$(GcRaw)].dbo.Contract c
    WHERE c.SupplierInn IS NOT NULL AND c.SupplierKpp IS NOT NULL
) AS result
) AS source(HashKey, LoadDate, SystemSource, Inn, Kpp)
	ON target.OrganizationHashKey = source.HashKey  
			-- probably it doesn't make sense to update load date in this case
	    WHEN MATCHED
	    THEN UPDATE SET
					LoadDate = source.LoadDate
	    WHEN NOT MATCHED
	    THEN
		 INSERT(OrganizationHashKey,
			   LoadDate,
			   SystemSource,
			   Inn,
			   Kpp)
		 VALUES
(source.HashKey,
 source.LoadDate,
 source.SystemSource,
 source.Inn,
 source.Kpp
);
	RETURN 0;
