CREATE PROCEDURE [dbo].[spInsertEmployee]
	@FirstName nvarchar(256),
	@Surname nvarchar(256),
	@BirthDate datetime2(7),
	@Gender nvarchar(8),
	@PhoneNumber nvarchar(16),
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	INSERT INTO Employee(FirstName, Surname, BirthDate, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId)
	VALUES(@FirstName, @Surname, @BirthDate, @Gender, @PhoneNumber, @DepartmentId, @CompanyId, @AddressId)
RETURN 0
