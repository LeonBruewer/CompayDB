CREATE VIEW [dbo].[viDepartment]
	AS SELECT
			DepartmentName Department,
			FirstName Manager,
			CompanyName Company
		FROM
			[Department] D
		LEFT JOIN
			[Company] C
		ON
			D.CompanyId = C.Id
		LEFT JOIN
			[Employee] E
		ON
			D.ManagerId = E.Id
		WHERE
			D.DeleteTime is null