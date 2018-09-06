CREATE PROCEDURE [dbo].[spUpdateDepartment]
	@Id int,
	@DepartmentName nvarchar(256),
	@CompanyId int,
	@ManagerId int
AS
	UPDATE Department
	SET DepartmentName = @DepartmentName, CompanyId = @CompanyId, ManagerId = @ManagerId
	WHERE Id = @Id
RETURN 0
