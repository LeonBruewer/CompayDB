CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [PostalCode] INT NOT NULL, 
    [Place] NVARCHAR(256) NULL, 
    [Street] NVARCHAR(256) NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DeleteTime] DATETIME2(7) NULL
)
