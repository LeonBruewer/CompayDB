CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL  IDENTITY, 
    [PostalCode] INT NOT NULL, 
    [City] NVARCHAR(256) NULL, 
    [Street] NVARCHAR(256) NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DeleteTime] DATETIME2(7) NULL, 
    CONSTRAINT [PK_Address] PRIMARY KEY ([Id]) 
)
