CREATE PROCEDURE [dbo].[spAddOrUpdateAddress]
	@Id int = NULL,
	@PostalCode int = NULL,
	@Street nvarchar(256) = NULL
AS
BEGIN
	IF (@Id is null)
		INSERT INTO Address(
					PostalCode,
					Street)
			VALUES(
					@PostalCode,
					@Street)
	ELSE
		UPDATE Address
			SET PostalCode = case when @PostalCode is null then PostalCode else @PostalCode end,
				Street = case when @Street is null then Street else @Street end
		WHERE Id = @Id
	RETURN 0
END