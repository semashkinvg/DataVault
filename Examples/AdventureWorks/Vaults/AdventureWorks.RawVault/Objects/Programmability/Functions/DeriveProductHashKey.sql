CREATE FUNCTION [dbo].DeriveLinkOrderProductHashKey
(
	@SystemSource varchar(10),
	@OrderNumber NVARCHAR(MAX),
	@ProductNumber NVARCHAR(MAX)
)
RETURNS VARBINARY(20)
AS
BEGIN
	RETURN  HASHBYTES('SHA1', @SystemSource+@OrderNumber+@ProductNumber) 
END
