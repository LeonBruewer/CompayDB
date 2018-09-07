CREATE PROCEDURE [dbo].[spAddOrUpdateEmployee]
	@Id int = NULL,
	@FirstName nvarchar(256) = NULL,
	@LastName nvarchar(256) = NULL,
	@BirthDate datetime2(7) = NULL,
	@Gender int = NULL,
	@PhoneNumber nvarchar(16) = NULL,
	@DepartmentId int = NULL,
	@AddressId int = NULL
AS
BEGIN
	IF (@Id is null)
		INSERT INTO Employee(
					FirstName, 
					LastName, 
					BirthDate, 
					Gender, 
					PhoneNumber, 
					DepartmentId, 
					AddressId)
			VALUES(
					@FirstName, 
					@LastName, 
					@BirthDate, 
					@Gender, 
					@PhoneNumber, 
					@DepartmentId, 
					@AddressId)
	ELSE
		UPDATE Employee
		SET FirstName = case when @FirstName is null then FirstName else @FirstName end, 
			LastName = case when @LastName is null then LastName else @LastName end, 
			BirthDate = case when @BirthDate is null then BirthDate else @BirthDate end, 
			Gender = case when @Gender is null then Gender else @Gender end, 
			PhoneNumber = case when @PhoneNumber is null then PhoneNumber else @PhoneNumber end, 
			DepartmentId = case when @DepartmentId is null then DepartmentId else @DepartmentId end, 
			AddressId = case when @AddressId is null then AddressId else @AddressId end
		WHERE Id = @Id
	RETURN 0
END
