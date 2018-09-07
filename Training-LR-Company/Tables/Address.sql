CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL  IDENTITY, 
    [PostalCode] INT NOT NULL REFERENCES [City](PostalCode),
    [Street] NVARCHAR(256) NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DeleteTime] DATETIME2(7) NULL, 
    CONSTRAINT [PK_Address] PRIMARY KEY ([Id]) 
)
