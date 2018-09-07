CREATE PROCEDURE [dbo].[spAddOrUpdateCity]
	@PostalCode int = 0,
	@City int
AS
	IF ((SELECT COUNT(PostalCode) FROM City) <= 0)
		INSERT INTO City(PostalCode, City)
		VALUES(@PostalCode, @City)
	ELSE
		UPDATE City
		SET City = @City
		WHERE PostalCode = @PostalCode
RETURN 0
