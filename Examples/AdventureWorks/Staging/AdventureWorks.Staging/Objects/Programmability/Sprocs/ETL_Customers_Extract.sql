CREATE PROCEDURE [dbo].[ETL_Customers_Extract] 
AS
	SET NOCOUNT ON
	TRUNCATE TABLE dbo.Customers

	INSERT INTO dbo.Customers(SourceCustomerID, PersonID, StoreID, TerritoryID, AccountNumber, rowguid, ModifiedDate)
	SELECT CustomerID, PersonID, StoreID, TerritoryID, AccountNumber, rowguid, ModifiedDate
	FROM [$(AdventureWorksSourceSystem)].[Sales].Customer
RETURN 0
