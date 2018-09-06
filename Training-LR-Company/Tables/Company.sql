CREATE TABLE [dbo].[Company]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CompanyName] NVARCHAR(256) NOT NULL, 
    [CreationTime] DATETIME2 NOT NULL DEFAULT GETDATE(), 
    [DeleteTime] DATETIME2 NULL, 
    [AddressId] INT NOT NULL REFERENCES [Address](Id)
)
