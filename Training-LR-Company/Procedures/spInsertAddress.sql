CREATE PROCEDURE [dbo].[spInsertAddress]
	@PostalCode int,
	@City nvarchar(256),
	@Street nvarchar(256)
AS
	INSERT INTO Address(PostalCode, Street)
	VALUES(@PostalCode, @City, @Street)
RETURN 0
