CREATE PROCEDURE [dbo].[spAddOrUpdateCompany]
	@Id int null,
	@CompanyName nvarchar(256),
	@AddressId int
AS
IF @Id = null
	INSERT INTO Company(CompanyName, AddressId)
	VALUES(@CompanyName, @AddressId)
ELSE
	Update Company
	SET CompanyName = @CompanyName, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
