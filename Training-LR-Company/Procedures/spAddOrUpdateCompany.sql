CREATE PROCEDURE [dbo].[spAddOrUpdateCompany]
	@Id int = NULL,
	@CompanyName nvarchar(256) = NULL,
	@AddressId int = NULL
AS
BEGIN
	IF (@Id is null)
		INSERT INTO Company(
					CompanyName,
					AddressId)
			VALUES(
					@CompanyName,
					@AddressId)
	ELSE
		Update Company
			SET CompanyName = case when @CompanyName is null then CompanyName else @CompanyName end,
				AddressId = case when @AddressId is null then AddressId else @AddressId end
		WHERE Id = @Id
	RETURN 0
END