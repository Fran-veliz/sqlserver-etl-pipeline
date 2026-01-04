USE AventureWorks_DWH
GO

ALTER TABLE [DW].[Dim_Promotion]
DROP COLUMN HashDiff, FechaActualiza;
GO

ALTER TABLE [DW].[Dim_SalesPerson]
DROP COLUMN HashDiff, FechaActualiza;

GO
ALTER TABLE [DW].[Dim_SalesReason]
DROP COLUMN HashDiff, FechaActualiza;

GO
ALTER TABLE [DW].[Dim_Territory]
DROP COLUMN HashDiff, FechaActualiza;
GO

ALTER TABLE [DW].[Dim_Cliente]
ADD FechaInicioVigencia DATETIME2(7) NOT NULL DEFAULT SYSDATETIME(),
    FechaFinVigencia DATETIME2(7) NULL,
    EsRegistroActual BIT NOT NULL DEFAULT 1;
GO
ALTER TABLE [DW].[Dim_Product]
ADD FechaInicioVigencia DATETIME2(7) NOT NULL DEFAULT SYSDATETIME(),
    FechaFinVigencia DATETIME2(7) NULL,
    EsRegistroActual BIT NOT NULL DEFAULT 1;
GO