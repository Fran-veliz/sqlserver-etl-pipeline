USE AventureWorks_DWH;
 GO 

CREATE OR ALTER PROCEDURE STG.sp_Carga_Cliente
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BatchID UNIQUEIDENTIFIER = NEWID();

    TRUNCATE TABLE STG.Cliente;

    INSERT INTO STG.Cliente (
        CustomerID_Source,
        PersonID_Source,
        TipoCliente,
        NombreCompleto,
        Email,
        Phone,
        City,
        StateProvince,
        Country,
        ModifiedDate,
        BatchID
    )
    SELECT
        C.CustomerID,
        C.PersonID,
        CASE 
            WHEN C.PersonID IS NOT NULL THEN 'PERSONA'
            ELSE 'EMPRESA'
        END AS TipoCliente,
        CONCAT(P.FirstName, ' ', P.LastName) AS NombreCompleto,
        EA.EmailAddress,
        PP.PhoneNumber,
        A.City,
        SP.Name AS StateProvince,
        CR.Name AS Country,
        C.ModifiedDate,
        @BatchID
    FROM AdventureWorks2019.Sales.Customer C
    LEFT JOIN AdventureWorks2019.Person.Person P
        ON C.PersonID = P.BusinessEntityID
    LEFT JOIN AdventureWorks2019.Person.EmailAddress EA
        ON P.BusinessEntityID = EA.BusinessEntityID
    LEFT JOIN AdventureWorks2019.Person.PersonPhone PP
        ON P.BusinessEntityID = PP.BusinessEntityID
    LEFT JOIN AdventureWorks2019.Person.BusinessEntityAddress BEA
        ON P.BusinessEntityID = BEA.BusinessEntityID
    LEFT JOIN AdventureWorks2019.Person.Address A
        ON BEA.AddressID = A.AddressID
    LEFT JOIN AdventureWorks2019.Person.StateProvince SP
        ON A.StateProvinceID = SP.StateProvinceID
    LEFT JOIN AdventureWorks2019.Person.CountryRegion CR
        ON SP.CountryRegionCode = CR.CountryRegionCode;

    PRINT('LOG: STG.Cliente cargado correctamente');
END;
GO
