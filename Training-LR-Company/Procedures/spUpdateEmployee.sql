CREATE PROCEDURE [dbo].[spUpdateEmployee]
	@Id int,
	@FirstName nvarchar(256),
	@Surname nvarchar(256),
	@BirthDate datetime2(7),
	@Gender nvarchar(8),
	@PhoneNumber nvarchar(16),
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	UPDATE Employee
	SET FirstName = @FirstName, Surname = @Surname, BirthDate = @BirthDate, Gender = @Gender, PhoneNumber = @PhoneNumber, DepartmentId = @DepartmentId, CompanyId = @CompanyId, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
