CREATE TABLE [dbo].[SatOrderFinance]
(
	[OrderHashKey] VARBINARY(20) NOT NULL,
	LoadDate datetime NOT NULL,
	SourceSystem varchar(10) NOT NULL,
	CurrencyRate money NOT NULL,
	Amount money NOT NULL,
	CONSTRAINT PK_SatOrderFinance_OrderHashKey_LoadDate PRIMARY KEY (OrderHashKey,LoadDate)
)
