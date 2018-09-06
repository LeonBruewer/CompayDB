CREATE VIEW [dbo].[viCompany]
	AS SELECT Id, CompanyName, CreationTime, DeleteTime, AddressId
	FROM [Company]
	WHERE DeleteTime = null
