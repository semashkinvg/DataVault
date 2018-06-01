CREATE TABLE [dbo].[Contract]
(
	[Id] INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED
	,SourceId BIGINT
  ,ExternalId                   NVARCHAR(MAX)
  ,PublishDate                  DATETIME2
  ,VersionNumber                INTEGER 
  ,CustomerRegNum               NVARCHAR(MAX) 
  ,CustomerFullName             NVARCHAR(MAX)
  ,CustomerInn                  NVARCHAR(MAX) 
  ,CustomerKpp                  NVARCHAR(MAX) 
  ,ProtocolDate                 DATETIME2
  ,DocumentCode                 NVARCHAR(MAX)
  ,SignDate                     DATETIME2 
  ,RegistrationNumber           NVARCHAR(MAX) 
  ,Number                       NVARCHAR(MAX)
  ,PriceInfoPrice               DECIMAL(30, 5)
  ,Price                        DECIMAL(30,5)
  ,ProductSid                   BIGINT 
  ,ProductOKPDCode              NVARCHAR(MAX)
  ,ProductOKPDName              NVARCHAR(MAX)
  ,ProductOKPD2Code             NVARCHAR(MAX)
  ,ProductOKPD2Name             NVARCHAR(MAX)
  ,ProductName                  NVARCHAR(MAX)
  ,ProductOKEICode              NVARCHAR(MAX) 
  ,ProductOKEINationalCode      NVARCHAR(MAX)
  ,ProductPrice                 DECIMAL(30,5)
  ,ProductQuantity              DECIMAL(30,5)
  ,ProductSum                   DECIMAL(30,5)
  ,FoundationNotificationNumber NVARCHAR(MAX) 
  ,FoundationLotNumber          NVARCHAR(MAX) 
  ,FoundationPlacing            INTEGER 
  ,CurrencyCode                 NVARCHAR(MAX)
  ,CurrencyName                 NVARCHAR(MAX)
  ,ExecutionDateMonth           INTEGER 
  ,ExecutionDateYear            INTEGER 
  ,FinancesFinanceSource        NVARCHAR(MAX)
  ,FinancesBudgetLevel          INTEGER 
	,SupplierParticipantType        NVARCHAR(MAX)
	,SupplierInn        NVARCHAR(MAX)
	,SupplierKpp        NVARCHAR(MAX)
	,SupplierCountryCode        NVARCHAR(MAX)
	,SupplierCountryFullName        NVARCHAR(MAX)
	,SupplierFactualAddress        NVARCHAR(MAX)
	,SupplierPostAddress        NVARCHAR(MAX)
	,SupplierContactInfoLastName        NVARCHAR(MAX)
	,SupplierContactInfoFirstName        NVARCHAR(MAX)
	,SupplierContactInfoMiddleName        NVARCHAR(MAX)
	,SupplierContactPhone        NVARCHAR(MAX)
	,SupplierLegalFormCode        NVARCHAR(MAX)
	,SupplierLegalFormSingularName        NVARCHAR(MAX)
	,SupplierOrganizationName        NVARCHAR(MAX)
  ,BudgetaryMonth               INTEGER 
  ,BudgetaryYear                INTEGER 
  ,BudgetarySubstageMonth       INTEGER 
  ,BudgetarySubstageYear        INTEGER 
  ,BudgetaryKBK                 NVARCHAR(MAX) 
  ,BudgetaryPrice               DECIMAL(30,5)
  ,BudgetaryComment             NVARCHAR(MAX)
  ,BudgetCode                   NVARCHAR(MAX) 
  ,BudgetName                   NVARCHAR(MAX)
  ,Region                       NVARCHAR(MAX)
)

GO