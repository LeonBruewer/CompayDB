CREATE VIEW [dbo].[viEmployees]
	AS SELECT Id, Name, Surname, BirthDate, CreationTime, DeleteTime, DepartmentId, CompanyId
	FROM [Employees]
	WHERE CreationTime = null
