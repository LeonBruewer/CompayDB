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
/*
Die Spalte "AddressId" der Tabelle "[dbo].[Company]" muss von NULL in NOT NULL geändert werden. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript u. U. nicht. Um dieses Problem zu vermeiden, müssen Sie dieser Spalte für alle Zeilen Werte hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.
*/

IF EXISTS (select top 1 1 from [dbo].[Company])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[Department].[Name]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Department])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'Der Umgestaltungsvorgang mit Umbenennung mit Schlüssel "d125280d-3cd9-43d8-8e63-d9f87249a61c" wird übersprungen; das Element "[dbo].[Employee].[Name]" (SqlSimpleColumn) wird nicht in "FirstName" umbenannt.';


GO
PRINT N'Der folgende Vorgang wird aus der Umgestaltungsprotokolldatei "ee9b512b-e285-4a0c-b8cd-0ec804cb6817" erstellt.';

PRINT N'"[dbo].[Company].[Name]" in "CompanyName" umbenennen';


GO
EXECUTE sp_rename @objname = N'[dbo].[Company].[Name]', @newname = N'CompanyName', @objtype = N'COLUMN';


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [DF__Departmen__Creat__182C9B23];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK__Departmen__Compa__1A14E395];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employees] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK__Employees__Depar__1B0907CE];


GO
PRINT N'[dbo].[Company] wird geändert....';


GO
ALTER TABLE [dbo].[Company] ALTER COLUMN [AddressId] INT NOT NULL;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department] (
    [Id]             INT            NOT NULL,
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
        INSERT INTO [dbo].[tmp_ms_xx_Department] ([Id], [CreationTime], [DeleteTime], [CompanyId], [ManagerId])
        SELECT   [Id],
                 [CreationTime],
                 [DeleteTime],
                 [CompanyId],
                 [ManagerId]
        FROM     [dbo].[Department]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[Department];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department]', N'Department';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'[dbo].[Employee] wird erstellt....';


GO
CREATE TABLE [dbo].[Employee] (
    [Id]           INT            NOT NULL,
    [FirstName]    NVARCHAR (256) NOT NULL,
    [Surname]      NVARCHAR (256) NOT NULL,
    [BirthDate]    DATETIME2 (7)  NOT NULL,
    [Gender]       NVARCHAR (8)   NOT NULL,
    [PhoneNumber]  NVARCHAR (16)  NOT NULL,
    [CreationTime] DATETIME2 (7)  NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    [DepartmentId] INT            NOT NULL,
    [CompanyId]    INT            NOT NULL,
    [AddressId]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT GETDATE() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Department] WITH NOCHECK
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
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Company] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'[dbo].[viCompany] wird geändert....';


GO
ALTER VIEW [dbo].[viCompany]
	AS SELECT Id, CompanyName, CreationTime, DeleteTime, AddressId
	FROM [Company]
	WHERE DeleteTime = null
GO
PRINT N'[dbo].[viDepartment] wird geändert....';


GO
ALTER VIEW [dbo].[viDepartment]
	AS SELECT Id, DepartmentName, CompanyId, CreationTime, DeleteTime, ManagerId
	FROM [Department]
	WHERE DeleteTime = null
GO
PRINT N'[dbo].[viEmployee] wird erstellt....';


GO
CREATE VIEW [dbo].[viEmployee]
	AS SELECT Id, FirstName, Surname, BirthDate, CreationTime, DeleteTime, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId
	FROM [Employee]
	WHERE CreationTime = null
GO
PRINT N'[dbo].[spInsertAddress] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spInsertAddress]
	@PostalCode int,
	@Place varchar,
	@Street varchar
AS
	INSERT INTO Address(PostalCode, Place, Street)
	VALUES(@PostalCode, @Place, @Street)
RETURN 0
GO
PRINT N'[dbo].[spInsertCompany] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spInsertCompany]
	@CompanyName varchar,
	@AddressId int
AS
	INSERT INTO Company(CompanyName, AddressId)
	VALUES(@CompanyName, @AddressId)
RETURN 0
GO
PRINT N'[dbo].[spInsertDepartment] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spInsertDepartment]
	@DepartmentName varchar,
	@CompanyId int,
	@ManagerId int
AS
	INSERT INTO Department(DepartmentName, CompanyId, ManagerId)
	VALUES (@DepartmentName, @CompanyId, @ManagerId)
RETURN 0
GO
PRINT N'[dbo].[spInsertEmployee] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spInsertEmployee]
	@FirstName nvarchar,
	@Surname nvarchar,
	@BirthDate datetime2,
	@Gender nvarchar,
	@PhoneNumber nvarchar,
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	INSERT INTO Employee(FirstName, Surname, BirthDate, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId)
	VALUES(@FirstName, @Surname, @BirthDate, @Gender, @PhoneNumber, @DepartmentId, @CompanyId, @AddressId)
RETURN 0
GO
PRINT N'[dbo].[spUpdateAddress] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spUpdateAddress]
	@Id int,
	@PostalCode int,
	@Place varchar,
	@Street varchar
AS
	UPDATE Address
	SET PostalCode = @PostalCode, Place = @Place, Street = @Street
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateCompany] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spUpdateCompany]
	@Id int,
	@CompanyName varchar,
	@AddressId int
AS
	Update Company
	SET CompanyName = @CompanyName, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateDepartment] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spUpdateDepartment]
	@Id int,
	@DepartmentName varchar,
	@CompanyId int,
	@ManagerId int
AS
	UPDATE Department
	SET DepartmentName = @DepartmentName, CompanyId = @CompanyId, ManagerId = @ManagerId
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateEmployee] wird erstellt....';


GO
CREATE PROCEDURE [dbo].[spUpdateEmployee]
	@Id int,
	@FirstName nvarchar,
	@Surname nvarchar,
	@BirthDate datetime2,
	@Gender nvarchar,
	@PhoneNumber nvarchar,
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	UPDATE Employee
	SET FirstName = @FirstName, Surname = @Surname, BirthDate = @BirthDate, Gender = @Gender, PhoneNumber = @PhoneNumber, DepartmentId = @DepartmentId, CompanyId = @CompanyId, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
GO
-- Umgestaltungsschritt zum Aktualisieren des Zielservers mit bereitgestellten Transaktionsprotokollen

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd125280d-3cd9-43d8-8e63-d9f87249a61c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d125280d-3cd9-43d8-8e63-d9f87249a61c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ee9b512b-e285-4a0c-b8cd-0ec804cb6817')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ee9b512b-e285-4a0c-b8cd-0ec804cb6817')

GO

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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Department'), OBJECT_ID(N'dbo.Employee'), OBJECT_ID(N'dbo.Company'))
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
