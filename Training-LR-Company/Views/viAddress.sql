CREATE VIEW [dbo].[viAddress]
	AS SELECT Id, PostalCode, City, Street, CreationTime, DeleteTime
	FROM [Address]
	WHERE DeleteTime = null
