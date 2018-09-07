CREATE PROCEDURE [dbo].[spAddOrUpdateDepartment]
	@Id int null,
	@DepartmentName nvarchar(256),
	@CompanyId int,
	@ManagerId int
AS
IF @Id = null
	INSERT INTO Department(DepartmentName, CompanyId, ManagerId)
	VALUES (@DepartmentName, @CompanyId, @ManagerId)
ELSE
	UPDATE Department
	SET DepartmentName = @DepartmentName, CompanyId = @CompanyId, ManagerId = @ManagerId
	WHERE Id = @Id
RETURN 0
