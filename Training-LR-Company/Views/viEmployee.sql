CREATE VIEW [dbo].[viEmployee]
	AS SELECT Id, FirstName, Surname, BirthDate, CreationTime, DeleteTime, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId
	FROM [Employee]
	WHERE CreationTime = null