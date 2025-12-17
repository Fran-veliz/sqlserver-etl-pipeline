USE AventureWorks_DWH;
GO 

CREATE OR ALTER PROCEDURE DW.sp_Carga_DimProducto 
AS
BEGIN
 SET NOCOUNT ON ;
 TRUNCATE TABLE DW.Dim_Producto;
 
 INSERT INTO  DW.Dim_producto(
  ProductID_Source,
  NombreProducto,
  Color, 
  Subcategoria, 
  Categoria
 )
 SELECT
  P.ProductID,
  P.Name,
  ISNULL( P.Color,'N/A'),
  ISNULL(S.name,'Sin SubCategoria'),
  ISNULL( C.Name,'Sin Categoria')

 FROM 
 AdventureWorks2019.Production.Product P 
 LEFT JOIN AdventureWorks2019.Production.ProductSubcategory S
      ON P.ProductSubcategoryID = S.ProductSubcategoryID
 LEFT JOIN AdventureWorks2019.Production.ProductCategory C
      ON S.ProductCategoryID=C.ProductCategoryID;

PRINT('LOG : Dim_Producto cargada exitosamente ')
END;
GO

--EXEC DW.sp_Carga_DimProducto;
--SELECT TOP 10 FROM DW.Dim_Producto;"""