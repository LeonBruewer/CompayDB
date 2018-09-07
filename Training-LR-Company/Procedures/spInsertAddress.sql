CREATE PROCEDURE [dbo].[spAddOrUpdateAddress]
	@Id int NULL,
	@PostalCode int,
	@Street nvarchar(256)
AS
IF @Id = null
	INSERT INTO Address(PostalCode, Street)
	VALUES(@PostalCode, @Street)
ELSE
	UPDATE Address
	SET PostalCode = @PostalCode, Street = @Street
	WHERE Id = @Id
RETURN 0
