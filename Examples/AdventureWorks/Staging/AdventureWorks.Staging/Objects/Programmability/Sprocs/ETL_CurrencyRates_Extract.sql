CREATE PROCEDURE [dbo].ETL_CurrencyRates_Extract (@hwmCurrencyRateID bigint)
AS
	SET NOCOUNT ON
	TRUNCATE TABLE dbo.Customers

	INSERT INTO dbo.CurrencyRates([SourceCurrencyRateID], [CurrencyRateDate] ,[FromCurrencyCode],[ToCurrencyCode],[AverageRate] ,[EndOfDayRate],[ModifiedDate])
	SELECT [CurrencyRateID], [CurrencyRateDate] ,[FromCurrencyCode],[ToCurrencyCode],[AverageRate] ,[EndOfDayRate],[ModifiedDate]
	FROM [$(AdventureWorksSourceSystem)].[Sales].CurrencyRate where CurrencyRateID > @hwmCurrencyRateID
RETURN 0
