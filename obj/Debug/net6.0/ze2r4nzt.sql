IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [DeptMaster] (
    [DeptCode] int NOT NULL IDENTITY,
    [DeptName] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_DeptMaster] PRIMARY KEY ([DeptCode])
);
GO

CREATE TABLE [EmpProfile] (
    [EmpCode] int NOT NULL IDENTITY,
    [DateOfBirth] datetime2 NOT NULL,
    [EmpName] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [DeptCode] int NOT NULL,
    [DeptMasterDeptCode] int NOT NULL,
    CONSTRAINT [PK_EmpProfile] PRIMARY KEY ([EmpCode]),
    CONSTRAINT [FK_EmpProfile_DeptMaster_DeptMasterDeptCode] FOREIGN KEY ([DeptMasterDeptCode]) REFERENCES [DeptMaster] ([DeptCode]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_EmpProfile_DeptMasterDeptCode] ON [EmpProfile] ([DeptMasterDeptCode]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230906064929_SimplonaMigration', N'7.0.10');
GO

COMMIT;
GO

