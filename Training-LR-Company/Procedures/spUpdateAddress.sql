CREATE PROCEDURE [dbo].[spUpdateAddress]
	@Id int,
	@PostalCode int,
	@City nvarchar(256),
	@Street nvarchar(256)
AS
	UPDATE Address
	SET PostalCode = @PostalCode, City = @City, Street = @Street
	WHERE Id = @Id
RETURN 0