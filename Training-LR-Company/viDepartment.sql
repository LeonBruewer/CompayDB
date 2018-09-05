CREATE VIEW [dbo].[viDepartment]
	AS SELECT Id, Name, CompanyId, CreationTime, DeleteTime, ManagerId
	FROM [Department]
	WHERE DeleteTime = null
