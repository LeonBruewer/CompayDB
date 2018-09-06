/*
Bereitstellungsskript für Training-LR-Company

Dieser Code wurde von einem Tool generiert.
Änderungen an dieser Datei führen möglicherweise zu falschem Verhalten und gehen verloren, falls
der Code neu generiert wird.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Training-LR-Company"
:setvar DefaultFilePrefix "Training-LR-Company"
:setvar DefaultDataPath "D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Überprüfen Sie den SQLCMD-Modus, und deaktivieren Sie die Skriptausführung, wenn der SQLCMD-Modus nicht unterstützt wird.
Um das Skript nach dem Aktivieren des SQLCMD-Modus erneut zu aktivieren, führen Sie folgenden Befehl aus:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Der SQLCMD-Modus muss aktiviert sein, damit dieses Skript erfolgreich ausgeführt werden kann.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [DF__Address__Creatio__164452B1];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Company] DROP CONSTRAINT [DF__Company__Creatio__173876EA];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [DF__tmp_ms_xx__Creat__239E4DCF];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [DF__Employee__Creati__267ABA7A];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Company] DROP CONSTRAINT [FK__Company__Address__2C3393D0];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employees] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK__Employees__Addre__1CF15040];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__Addres__2B3F6F97];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employees] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK__Employees__Compa__1BFD2C07];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK__Departmen__Compa__276EDEB3];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__Compan__2A4B4B5E];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK__Departmen__Manag__286302EC];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__Depart__29572725];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Address]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Address] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [PostalCode]   INT            NOT NULL,
    [Place]        NVARCHAR (256) NULL,
    [Street]       NVARCHAR (256) NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GETDATE() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Address])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Address] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Address] ([Id], [PostalCode], [Place], [Street], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [PostalCode],
                 [Place],
                 [Street],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Address]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Address] OFF;
    END

DROP TABLE [dbo].[Address];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Address]', N'Address';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Company]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Company] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [CompanyName]  NVARCHAR (256) NOT NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GETDATE() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    [AddressId]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Company])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Company] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Company] ([Id], [CompanyName], [CreationTime], [DeleteTime], [AddressId])
        SELECT   [Id],
                 [CompanyName],
                 [CreationTime],
                 [DeleteTime],
                 [AddressId]
        FROM     [dbo].[Company]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Company] OFF;
    END

DROP TABLE [dbo].[Company];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Company]', N'Company';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [DepartmentName] NVARCHAR (256) NULL,
    [CreationTime]   DATETIME2 (7)  DEFAULT GETDATE() NOT NULL,
    [DeleteTime]     DATETIME2 (7)  NULL,
    [CompanyId]      INT            NOT NULL,
    [ManagerId]      INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Department])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Department] ([Id], [DepartmentName], [CreationTime], [DeleteTime], [CompanyId], [ManagerId])
        SELECT   [Id],
                 [DepartmentName],
                 [CreationTime],
                 [DeleteTime],
                 [CompanyId],
                 [ManagerId]
        FROM     [dbo].[Department]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department] OFF;
    END

DROP TABLE [dbo].[Department];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department]', N'Department';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Employee]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Employee] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]    NVARCHAR (256) NOT NULL,
    [Surname]      NVARCHAR (256) NOT NULL,
    [BirthDate]    DATETIME2 (7)  NOT NULL,
    [Gender]       NVARCHAR (8)   NOT NULL,
    [PhoneNumber]  NVARCHAR (16)  NOT NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GETDATE() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    [DepartmentId] INT            NOT NULL,
    [CompanyId]    INT            NOT NULL,
    [AddressId]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Employee])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Employee] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Employee] ([Id], [FirstName], [Surname], [BirthDate], [Gender], [PhoneNumber], [CreationTime], [DeleteTime], [DepartmentId], [CompanyId], [AddressId])
        SELECT   [Id],
                 [FirstName],
                 [Surname],
                 [BirthDate],
                 [Gender],
                 [PhoneNumber],
                 [CreationTime],
                 [DeleteTime],
                 [DepartmentId],
                 [CompanyId],
                 [AddressId]
        FROM     [dbo].[Employee]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Employee] OFF;
    END

DROP TABLE [dbo].[Employee];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Employee]', N'Employee';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Company] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Department] WITH NOCHECK
    ADD FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Department] WITH NOCHECK
    ADD FOREIGN KEY ([ManagerId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'[dbo].[viAddress] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viAddress]';


GO
PRINT N'[dbo].[viCompany] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viCompany]';


GO
PRINT N'[dbo].[viDepartment] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viDepartment]';


GO
PRINT N'[dbo].[viEmployee] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viEmployee]';


GO
PRINT N'[dbo].[spInsertAddress] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spInsertAddress]';


GO
PRINT N'[dbo].[spUpdateAddress] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUpdateAddress]';


GO
PRINT N'[dbo].[spInsertCompany] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spInsertCompany]';


GO
PRINT N'[dbo].[spUpdateCompany] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUpdateCompany]';


GO
PRINT N'[dbo].[spInsertDepartment] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spInsertDepartment]';


GO
PRINT N'[dbo].[spUpdateDepartment] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUpdateDepartment]';


GO
PRINT N'[dbo].[spInsertEmployee] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spInsertEmployee]';


GO
PRINT N'[dbo].[spUpdateEmployee] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUpdateEmployee]';


GO
PRINT N'Vorhandene Daten werden auf neu erstellte Einschränkungen hin überprüft.';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Company'), OBJECT_ID(N'dbo.Employee'), OBJECT_ID(N'dbo.Department'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Einschränkung wird überprüft: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Fehler beim Überprüfen der Einschränkung:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Fehler beim Überprüfen von Einschränkungen', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update abgeschlossen.';


GO
