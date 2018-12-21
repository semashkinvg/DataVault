CREATE TABLE dbo.[Customers] (
	Id int identity(1,1) PRIMARY KEY NOT NULL,
    [SourceCustomerID]    INT              NOT NULL,
    [PersonID]      INT              NULL,
    [StoreID]       INT              NULL,
    [TerritoryID]   INT              NULL,
    [AccountNumber] nvarchar(max)		null,
    [rowguid]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]  DATETIME         NULL
);

