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
PRINT N'[dbo].[spInsertAddress] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spInsertAddress]
	@PostalCode int,
	@Place nvarchar(256),
	@Street nvarchar(256)
AS
	INSERT INTO Address(PostalCode, Place, Street)
	VALUES(@PostalCode, @Place, @Street)
RETURN 0
GO
PRINT N'[dbo].[spInsertCompany] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spInsertCompany]
	@CompanyName nvarchar(256),
	@AddressId int
AS
	INSERT INTO Company(CompanyName, AddressId)
	VALUES(@CompanyName, @AddressId)
RETURN 0
GO
PRINT N'[dbo].[spInsertDepartment] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spInsertDepartment]
	@DepartmentName nvarchar(256),
	@CompanyId int,
	@ManagerId int
AS
	INSERT INTO Department(DepartmentName, CompanyId, ManagerId)
	VALUES (@DepartmentName, @CompanyId, @ManagerId)
RETURN 0
GO
PRINT N'[dbo].[spInsertEmployee] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spInsertEmployee]
	@FirstName nvarchar(256),
	@Surname nvarchar(256),
	@BirthDate datetime2(7),
	@Gender nvarchar(8),
	@PhoneNumber nvarchar(16),
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	INSERT INTO Employee(FirstName, Surname, BirthDate, Gender, PhoneNumber, DepartmentId, CompanyId, AddressId)
	VALUES(@FirstName, @Surname, @BirthDate, @Gender, @PhoneNumber, @DepartmentId, @CompanyId, @AddressId)
RETURN 0
GO
PRINT N'[dbo].[spUpdateAddress] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spUpdateAddress]
	@Id int,
	@PostalCode int,
	@Place nvarchar(256),
	@Street nvarchar(256)
AS
	UPDATE Address
	SET PostalCode = @PostalCode, Place = @Place, Street = @Street
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateCompany] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spUpdateCompany]
	@Id int,
	@CompanyName nvarchar(256),
	@AddressId int
AS
	Update Company
	SET CompanyName = @CompanyName, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateDepartment] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spUpdateDepartment]
	@Id int,
	@DepartmentName nvarchar(256),
	@CompanyId int,
	@ManagerId int
AS
	UPDATE Department
	SET DepartmentName = @DepartmentName, CompanyId = @CompanyId, ManagerId = @ManagerId
	WHERE Id = @Id
RETURN 0
GO
PRINT N'[dbo].[spUpdateEmployee] wird geändert....';


GO
ALTER PROCEDURE [dbo].[spUpdateEmployee]
	@Id int,
	@FirstName nvarchar(256),
	@Surname nvarchar(256),
	@BirthDate datetime2(7),
	@Gender nvarchar(8),
	@PhoneNumber nvarchar(16),
	@DepartmentId int,
	@CompanyId int,
	@AddressId int
AS
	UPDATE Employee
	SET FirstName = @FirstName, Surname = @Surname, BirthDate = @BirthDate, Gender = @Gender, PhoneNumber = @PhoneNumber, DepartmentId = @DepartmentId, CompanyId = @CompanyId, AddressId = @AddressId
	WHERE Id = @Id
RETURN 0
GO
PRINT N'Update abgeschlossen.';


GO
