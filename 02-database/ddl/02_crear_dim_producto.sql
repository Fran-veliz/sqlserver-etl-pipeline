USE AventureWorks_DWH
GO 

IF OBJECT_ID('DW.Dim_Producto','U') IS NOT NULL
DROP TABLE DW.Dim_Producto;
GO 

CREATE TABLE DW.Dim_Producto(
 ProductKey INT IDENTITY(1,1) PRIMARY KEY,
 ProductID_Source  INT NOT NULL,
 NombreProducto NVARCHAR(50) NOT NULL,
 Color NVARCHAR(15) NULL,
 Subcategoria NVARCHAR(50) DEFAULT 'Sin Categoria',
 Categoria NVARCHAR(50) DEFAULT 'SinCategoria',
 FechaCarga DATETIME DEFAULT GETDATE(), -->Para auditoria 
 UsuarioCarga NVARCHAR(50)DEFAULT SYSTEM_USER -->Para auditoria 
       
);
GO 