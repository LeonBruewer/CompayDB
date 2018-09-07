CREATE VIEW [dbo].[viCity]
	AS SELECT PostalCode, City
	FROM [City]
	WHERE DeleteTime = null
