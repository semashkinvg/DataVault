CREATE PROCEDURE [dbo].ETL_OrderDetails_Extract(@hwmSalesOrderID bigint = 0)
AS
	SET NOCOUNT ON
	TRUNCATE TABLE dbo.OrderLines
	
	INSERT INTO dbo.OrderLines
	(
		SourceSalesOrderID,
		SourceSalesOrderDetailID,
		CarrierTrackingNumber,
		OrderQty,
		ProductID,
		SpecialOfferID,
		UnitPrice,
		UnitPriceDiscount,
		LineTotal,
		rowguid,
		ModifiedDate
	)
	SELECT SalesOrderID,
		SalesOrderDetailID,
		CarrierTrackingNumber,
		OrderQty,
		ProductID,
		SpecialOfferID,
		UnitPrice,
		UnitPriceDiscount,
		LineTotal,
		rowguid,
		ModifiedDate
	FROM [$(AdventureWorksSourceSystem)].[Sales].SalesOrderDetail sod
RETURN 0
