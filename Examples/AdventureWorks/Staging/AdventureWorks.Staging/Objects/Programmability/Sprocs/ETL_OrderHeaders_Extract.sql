CREATE PROCEDURE [dbo].[ETL_OrderHeaders_Extract] (@hwmSalesOrderID bigint = 0)
AS
	SET NOCOUNT ON
	TRUNCATE TABLE dbo.Orders

	INSERT INTO dbo.Orders(SourceSalesOrderID, RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, TerritoryID, BillToAddressID, ShipToAddressID, ShipMethodID, CreditCardID, CreditCardApprovalCode, CurrencyRateID)
	SELECT SalesOrderID, RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, TerritoryID, BillToAddressID, ShipToAddressID, ShipMethodID, CreditCardID, CreditCardApprovalCode, CurrencyRateID
	FROM [$(AdventureWorksSourceSystem)].[Sales].[SalesOrderHeader] where SalesOrderID > @hwmSalesOrderID
RETURN 0
