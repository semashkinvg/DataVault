CREATE TABLE dbo.[CurrencyRates] (
	Id int identity(1,1) PRIMARY KEY not null,
    [SourceCurrencyRateID]   INT       NULL,
    [CurrencyRateDate] DATETIME  NULL,
    [FromCurrencyCode] NCHAR (3) NULL,
    [ToCurrencyCode]   NCHAR (3) NULL,
    [AverageRate]      MONEY     NULL,
    [EndOfDayRate]     MONEY     NULL,
    [ModifiedDate]     DATETIME  NULL
)

