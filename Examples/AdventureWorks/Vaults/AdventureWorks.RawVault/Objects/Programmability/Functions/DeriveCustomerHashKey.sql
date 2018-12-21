CREATE FUNCTION [dbo].DeriveCustomerHashKey
(
	@SystemSource varchar(10),
	@CustomerId NVARCHAR(MAX)
)
RETURNS VARBINARY(20)
AS
BEGIN
	RETURN  HASHBYTES('SHA1', @SystemSource+@CustomerId) 
END
