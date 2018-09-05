CREATE TABLE [dbo].[Employees]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(256) NOT NULL, 
    [Surname] NVARCHAR(256) NOT NULL, 
    [BirthDate] DATETIME2 NOT NULL, 
	[CreationTime] DATETIME2 NOT NULL DEFAULT GETDATE(), 
    [DeleteTime] DATETIME2 NULL,
	[DepartmentId] INT NOT NULL REFERENCES [Department](Id),
    [CompanyId] INT NOT NULL REFERENCES [Company](Id)
)
