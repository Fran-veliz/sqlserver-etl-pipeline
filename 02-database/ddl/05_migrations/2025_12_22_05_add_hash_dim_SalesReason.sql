USE AventureWorks_DWH;
GO 

ALTER TABLE [DW].[Dim_SalesReason]
ADD
    HashDiff VARBINARY(32),
    FechaActualiza DATETIME2;
