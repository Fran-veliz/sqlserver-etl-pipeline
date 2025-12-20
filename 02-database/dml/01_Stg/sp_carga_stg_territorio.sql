USE AventureWorks_DWH;
GO 


CREATE OR ALTER PROCEDURE STG.sp_Carga_Territory
AS

BEGIN 
    SET NOCOUNT ON;

	DECLARE @BachID UNIQUEIDENTIFIER = NEWID();

	TRUNCATE TABLE STG.Territory;

	INSERT INTO STG.Territory(
	   TerritoryID_Source ,
       TerritoryName ,
       CountryRegionCode ,
       CountryName ,
       GroupName,
       SalesYTD ,
       SalesLastYear ,
       ModifiedDate ,
       BatchID 
	)
	SELECT 
	T.TerritoryID,
	T.Name,
	T.CountryRegionCode,
	CR.Name,
	T.[Group],
	T.SalesYTD,
	T.SalesLastYear,
	T.ModifiedDate,
	@BachID

	FROM AdventureWorks2019.Sales.SalesTerritory T
	INNER JOIN  AdventureWorks2019.Person.CountryRegion CR
	   ON T.CountryRegionCode = CR.CountryRegionCode;
	PRINT('LOG:STG.TERRITORIO CARGADO CORRECTAMENTE ');

END ;
GO 
