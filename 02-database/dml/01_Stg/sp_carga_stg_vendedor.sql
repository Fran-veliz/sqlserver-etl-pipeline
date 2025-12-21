USE AventureWorks_DWH;
GO
CREATE OR ALTER PROCEDURE STG.sp_carga_Vendedor 
AS


BEGIN 
   SET NOCOUNT ON ;

   DECLARE @BachID UNIQUEIDENTIFIER = NEWID();

   TRUNCATE TABLE STG.Vendedor;
   
   INSERT INTO  STG.Vendedor(
       BusinessEntityID_Source ,
	   NombreCompleto ,
	   Cargo ,
	   FechaContratacion ,
	   TerritoryID_Source  ,
	   TerritoryName ,
	   SalesQuota ,
	   Bonus ,
	   CommissionsPct ,
	   ModifiedDate,
       BachID 
   
   )
   SELECT 
   SP.BusinessEntityID,
   CONCAT(P.FirstName, ' ', P.LastName),
   E.JobTitle,
   E.HireDate,
   T.TerritoryID,
   T.Name,
   SP.SalesQuota,
   SP.Bonus,
   SP.CommissionPct,
   SP.ModifiedDate,
   @BachID
   
   FROM AdventureWorks2019.Sales.SalesPerson SP
   INNER JOIN AdventureWorks2019.HumanResources.Employee E
     ON SP.BusinessEntityID = E.BusinessEntityID
   INNER JOIN AdventureWorks2019.Person.Person P
     ON SP.BusinessEntityID = P.BusinessEntityID
   LEFT JOIN AdventureWorks2019.Sales.SalesTerritory T 
     ON SP.TerritoryID= T.TerritoryID;

   PRINT('LOG: STG.VENDEDOR CARGADO CORRECTAMENTE');
END;
GO 