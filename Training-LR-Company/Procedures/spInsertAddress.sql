CREATE PROCEDURE [dbo].[spAddOrUpdateAddress]
	@PostalCode int,
	@Street nvarchar(256)
AS
	INSERT INTO Address(PostalCode, Street)
	VALUES(@PostalCode, @Street)
RETURN 0
