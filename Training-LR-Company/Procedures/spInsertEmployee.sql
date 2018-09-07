CREATE PROCEDURE [dbo].[spAddOrUpdateEmployee]
	@Id int null,
	@FirstName nvarchar(256),
	@Surname nvarchar(256),
	@BirthDate datetime2(7),
	@Gender int,
	@PhoneNumber nvarchar(16),
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
IF @Id = null
	INSERT INTO Employee(FirstName, Surname, BirthDate, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId)
	VALUES(@FirstName, @Surname, @BirthDate, @Gender, @PhoneNumber, @DepartmentId, @CompanyId, @AddressId)
ELSE
	UPDATE Employee
	SET FirstName = @FirstName, Surname = @Surname, BirthDate = @BirthDate, Gender = @Gender, PhoneNumber = @PhoneNumber, DepartmentId = @DepartmentId, CompanyId = @CompanyId, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
