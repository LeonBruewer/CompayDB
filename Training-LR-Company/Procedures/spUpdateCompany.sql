CREATE PROCEDURE [dbo].[spUpdateCompany]
	@Id int,
	@CompanyName nvarchar(256),
	@AddressId int
AS
	Update Company
	SET CompanyName = @CompanyName, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
