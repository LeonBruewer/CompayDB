CREATE VIEW [dbo].[viAddress]
	AS SELECT
			A.Id,
			A.PostalCode 'Postal Code',
			C.City,
			Street
		FROM
			[Address] A
		LEFT JOIN
			[City] C
		ON
			A.PostalCode = C.PostalCode
		WHERE
			A.DeleteTime is null
