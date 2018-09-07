CREATE VIEW [dbo].[viEmployee]
	AS SELECT
			FirstName 'First Name' ,
			LastName 'Last Name',
			BirthDate 'Date of birth',
			dbo.fnGender(Gender) Gender,
			PhoneNumber Phone,
			A.City,
			A.Street
		FROM
			[Employee] E
		LEFT JOIN
			[viAddress] A
		ON
			E.AddressId = A.Id
		WHERE
			E.DeleteTime is null