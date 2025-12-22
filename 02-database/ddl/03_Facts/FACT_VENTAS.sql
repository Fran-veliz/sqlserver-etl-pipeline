IF OBJECT_ID('DW.Fact_Sales','U') IS NOT NULL
    DROP TABLE DW.Fact_Sales;
GO

CREATE TABLE DW.Fact_Sales (
    DateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    ClientKey INT NOT NULL,
    SalesPersonKey INT,
    TerritoryKey INT,
    PromotionKey INT,

    SalesOrderID_Source INT NOT NULL,

    OrderQty INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    UnitPriceDiscount DECIMAL(5,2) NOT NULL,
    LineTotal DECIMAL(12,2) NOT NULL,

   
    FechaCarga DATETIME DEFAULT GETDATE(),

    CONSTRAINT PK_Fact_Sales PRIMARY KEY (
        SalesOrderID_Source,
        ProductKey
    )
);
GO
