USE AventureWorks_DWH;
GO 
IF OBJECT_ID('DW.Bridge_SalesReason','U') IS NOT NULL
    DROP TABLE DW.Bridge_SalesReason;
GO

CREATE TABLE DW.Bridge_SalesReason (
    SalesOrderID_Source INT NOT NULL,
    SalesReasonKey INT NOT NULL
);
GO
