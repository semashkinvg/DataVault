CREATE FUNCTION [dbo].[DeriveProductHashKey]
(
	@SystemSource varchar(10),
	@ProductNumber NVARCHAR(MAX)
)
RETURNS VARBINARY(20)
AS
BEGIN
	RETURN  HASHBYTES('SHA1', @SystemSource+@ProductNumber) 
END
