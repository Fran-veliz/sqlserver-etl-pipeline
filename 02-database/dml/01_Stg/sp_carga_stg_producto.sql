USE AventureWorks_DWH;
GO 

CREATE OR ALTER PROCEDURE STG.sp_Carga_Producto
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BatchID UNIQUEIDENTIFIER = NEWID();

    TRUNCATE TABLE STG.Producto;

    INSERT INTO STG.Producto (
        ProductID_Source,
        NombreProducto,
        ProductNumber,
        Color,
        Size,
        Weight,
        Subcategoria,
        Categoria,
        StandardCost,
        ListPrice,
        SellStartDate,
        SellEndDate,
        ModifiedDate,
        BatchID
    )
    SELECT
        P.ProductID,
        P.Name,
        P.ProductNumber,
        ISNULL(P.Color, 'N/A'),
        P.Size,
        P.Weight,
        ISNULL(S.Name, 'Sin SubCategoria'),
        ISNULL(C.Name, 'Sin Categoria'),
        P.StandardCost,
        P.ListPrice,
        P.SellStartDate,
        P.SellEndDate,
        P.ModifiedDate,
        @BatchID
    FROM AdventureWorks2019.Production.Product P
    LEFT JOIN AdventureWorks2019.Production.ProductSubcategory S
        ON P.ProductSubcategoryID = S.ProductSubcategoryID
    LEFT JOIN AdventureWorks2019.Production.ProductCategory C
        ON S.ProductCategoryID = C.ProductCategoryID;

    PRINT('LOG: STG.Producto cargado correctamente');
END;
GO
