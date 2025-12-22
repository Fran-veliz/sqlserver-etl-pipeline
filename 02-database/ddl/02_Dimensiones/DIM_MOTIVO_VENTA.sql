USE AventureWorks_DWH;
GO 
IF OBJECT_ID('DW.Dim_SalesReason','U') IS NOT NULL
    DROP TABLE DW.Dim_SalesReason;
GO

CREATE TABLE DW.Dim_SalesReason (
    SalesReasonKey INT IDENTITY(1,1) PRIMARY KEY,
    SalesReasonID_Source INT NOT NULL,
    Motivo NVARCHAR(100),
    TipoMotivo NVARCHAR(50),
    FechaCarga DATETIME DEFAULT GETDATE()
);
GO
