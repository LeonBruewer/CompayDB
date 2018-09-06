CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [FirstName] NVARCHAR(256) NOT NULL, 
    [Surname] NVARCHAR(256) NOT NULL, 
    [BirthDate] DATETIME2 NOT NULL, 
	[Gender] NVARCHAR(8) NOT NULL,
	[PhoneNumber] NVARCHAR(16) NOT NULL,
	[CreationTime] DATETIME2 NOT NULL DEFAULT GETDATE(), 
    [DeleteTime] DATETIME2 NULL,
	[DepartmentId] INT NOT NULL REFERENCES [Department](Id),
    [CompanyId] INT NOT NULL REFERENCES [Company](Id), 
    [AddressId] INT NOT NULL REFERENCES [Address](Id)
)
