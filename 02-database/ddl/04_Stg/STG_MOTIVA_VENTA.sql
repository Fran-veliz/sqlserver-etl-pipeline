USE AventureWorks_DWH;
GO 

IF OBJECT_ID('STG.SalesReason','U') IS NULL
BEGIN
    CREATE TABLE STG.SalesReason (
        SalesOrderID_Source INT NOT NULL,
        SalesReasonID_Source INT NOT NULL,
        NombreMotivo NVARCHAR(100),
        TipoMotivo NVARCHAR(50),
        ModifiedDate DATETIME,

        -- Auditoría
        FechaCarga DATETIME DEFAULT GETDATE(),
        BatchID UNIQUEIDENTIFIER
    );
END;
GO
