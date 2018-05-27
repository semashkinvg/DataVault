CREATE TABLE [dbo].[SatOkpdDescr]
(
	[OkpdHashKey] VARBINARY(20) NOT NULL,
	LoadDate datetime,
	SystemSource varchar(100),
	Descr NVARCHAR(MAX) NOT NULL,
    CONSTRAINT PK_SatOkpdDescr_OkpdHashKey_LoadDate PRIMARY KEY (OkpdHashKey,LoadDate)
)
