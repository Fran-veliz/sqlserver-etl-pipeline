USE AventureWorks_DWH;
GO 
CREATE OR ALTER PROCEDURE DW.sp_Carga_DimProducto
AS
BEGIN
    SET NOCOUNT ON;

    MERGE DW.Dim_Producto AS target
    USING (
        SELECT
            P.ProductID,
            P.Name AS NombreProducto,
            ISNULL(P.Color, 'N/A') AS Color,
            ISNULL(S.Name, 'Sin SubCategoria') AS Subcategoria,
            ISNULL(C.Name, 'Sin Categoria') AS Categoria
        FROM AdventureWorks2019.Production.Product P
        LEFT JOIN AdventureWorks2019.Production.ProductSubcategory S
            ON P.ProductSubcategoryID = S.ProductSubcategoryID
        LEFT JOIN AdventureWorks2019.Production.ProductCategory C
            ON S.ProductCategoryID = C.ProductCategoryID
    ) AS source
    ON target.ProductID_Source = source.ProductID

    WHEN MATCHED THEN
        UPDATE SET
            NombreProducto = source.NombreProducto,
            Color = source.Color,
            Subcategoria = source.Subcategoria,
            Categoria = source.Categoria,
            FechaCarga = GETDATE(),
            UsuarioCarga = SYSTEM_USER

    WHEN NOT MATCHED THEN
        INSERT (
            ProductID_Source,
            NombreProducto,
            Color,
            Subcategoria,
            Categoria
        )
        VALUES (
            source.ProductID,
            source.NombreProducto,
            source.Color,
            source.Subcategoria,
            source.Categoria
        );

    PRINT('LOG : Dim_Producto cargada incrementalmente');
END;
GO
