CREATE PROCEDURE [dbo].[spInsertDepartment]
	@DepartmentName nvarchar(256),
	@CompanyId int,
	@ManagerId int
AS
	INSERT INTO Department(DepartmentName, CompanyId, ManagerId)
	VALUES (@DepartmentName, @CompanyId, @ManagerId)
RETURN 0
