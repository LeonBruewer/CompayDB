﻿CREATE TABLE [dbo].[Department]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(256) NULL, 
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DeleteTime] DATETIME2(7) NULL,
    [CompanyId] INT NOT NULL REFERENCES [Company](Id),
	[ManagerId] INT NOT NULL
)
