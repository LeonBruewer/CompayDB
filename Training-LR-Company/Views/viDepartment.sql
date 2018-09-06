CREATE VIEW [dbo].[viDepartment]
	AS SELECT Id, DepartmentName, CompanyId, CreationTime, DeleteTime, ManagerId
	FROM [Department]
	WHERE DeleteTime = null
