
-- Aclaración: el commit anterior incluye la creación de STG_TERRITORIO y STG_VENDEDOR

USE AventureWorks_DWH;
GO 



IF OBJECT_ID('STG.Territory','U') IS NULL
BEGIN
   CREATE TABLE STG.Territory(

   TerritoryID_Source INT NOT NULL,
   TerritoryName NVARCHAR(100),
   CountryRegionCode NVARCHAR(10),
   CountryName NVARCHAR(50),
   GroupName NVARCHAR(50),
   SalesYTD MONEY,
   SalesLastYear MONEY,
   ModifiedDate DATETIME,
   FechaCarga DATETIME DEFAULT GETDATE(),
   BatchID UNIQUEIDENTIFIER

   );
END;
GO