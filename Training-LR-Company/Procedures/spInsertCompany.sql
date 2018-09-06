CREATE PROCEDURE [dbo].[spInsertCompany]
	@CompanyName nvarchar(256),
	@AddressId int
AS
	INSERT INTO Company(CompanyName, AddressId)
	VALUES(@CompanyName, @AddressId)
RETURN 0
