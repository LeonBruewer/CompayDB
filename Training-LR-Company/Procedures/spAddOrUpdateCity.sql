CREATE PROCEDURE [dbo].[spAddOrUpdateCity]
	@PostalCode int = NULL,
	@City varchar(512) = NULL
AS
	IF ((SELECT COUNT(PostalCode) FROM City WHERE PostalCode = @PostalCode) <= 0)
		INSERT INTO City(PostalCode, City)
		VALUES(@PostalCode, @City)
	ELSE
		UPDATE City
			SET City = @City
		WHERE PostalCode = @PostalCode
RETURN 0
