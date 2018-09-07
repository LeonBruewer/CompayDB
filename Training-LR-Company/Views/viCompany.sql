CREATE VIEW [dbo].[viCompany]
	AS SELECT
			CompanyName 'Name',
			A.[Postal Code] 'Postal Code',
			A.City,
			A.Street
		FROM
			[Company] C
		LEFT JOIN
			[viAddress] A
		ON
			C.AddressId = A.Id
		WHERE
			C.DeleteTime is null
