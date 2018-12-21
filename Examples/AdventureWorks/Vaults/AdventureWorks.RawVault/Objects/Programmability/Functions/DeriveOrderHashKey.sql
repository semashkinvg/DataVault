CREATE FUNCTION [dbo].[DeriveOrderHashKey]
(
	@SystemSource varchar(10),
	@OrderNumber NVARCHAR(MAX)
)
RETURNS VARBINARY(20)
AS
BEGIN
	RETURN  HASHBYTES('SHA1', @SystemSource+@OrderNumber) 
END
