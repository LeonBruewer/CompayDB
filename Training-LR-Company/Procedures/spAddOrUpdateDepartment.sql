CREATE PROCEDURE [dbo].[spAddOrUpdateDepartment]
	@Id int = null,
	@DepartmentName nvarchar(256) = NULL,
	@CompanyId int = NULL,
	@ManagerId int = NULL
AS
BEGIN
	IF (@Id is null)
		INSERT INTO Department(
					DepartmentName,
					CompanyId,
					ManagerId)
			VALUES (
					@DepartmentName,
					@CompanyId,
					@ManagerId)
	ELSE
		UPDATE Department
			SET DepartmentName = case when @DepartmentName is null then DepartmentName else @DepartmentName end,
				CompanyId = case when @CompanyId is null then CompanyId else @CompanyId end,
				ManagerId = case when @ManagerId is null then ManagerId else @ManagerId end
		WHERE Id = @Id
	RETURN 0
END