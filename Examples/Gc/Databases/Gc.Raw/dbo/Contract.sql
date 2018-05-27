CREATE TABLE [dbo].[Contract]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY NONCLUSTERED
	,SourceId BIGINT NOT NULL
	,ExternalId              NVARCHAR(max) NULL
	,PublishDate             DATETIME  NULL
	,VersionNumber           INTEGER  NULL
	,CustomerRegNum          NVARCHAR(max)   NULL
	,CustomerFullName        NVARCHAR(max) NULL
	,CustomerInn             NVARCHAR(max)   NULL
	,CustomerKpp             NVARCHAR(max)   NULL
	,ProtocolDate            DATETIME
	,DocumentCode            NVARCHAR(30)
	,SignDate                DATETIME NULL
	,RegistrationNumber      NVARCHAR(max)  NULL
	,Number                  NVARCHAR(max) NULL
	,Price                   decimal(30,5)
	,ProductSid              NVARCHAR(max)  NULL
	,ProductOKPDCode         NVARCHAR(max) NULL
	,ProductOKPDName         NVARCHAR(max)
	,ProductOKPD2Code        NVARCHAR(max)
	,ProductOKPD2Name        NVARCHAR(max)
	,ProductName             NVARCHAR(max)  NULL
	,ProductOKEICode         NVARCHAR(max)  NULL
	,ProductOKEINationalCode NVARCHAR(max) NULL
	,ProductPrice            decimal(30,5) NULL
	,ProductQuantity         decimal(30,5)  NULL
	,ProductSum              decimal(30,5) NULL
)

GO