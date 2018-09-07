CREATE VIEW [dbo].[viAddress]
	AS SELECT Id, PostalCode, Street, CreationTime, DeleteTime
	FROM [Address]
	WHERE DeleteTime = null
