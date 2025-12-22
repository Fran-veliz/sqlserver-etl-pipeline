USE AventureWorks_DWH;
GO 

CREATE OR ALTER PROCEDURE STG.sp_Carga_SalesReason
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BatchID UNIQUEIDENTIFIER = NEWID();

    TRUNCATE TABLE STG.SalesReason;

    INSERT INTO STG.SalesReason (
        SalesOrderID_Source,
        SalesReasonID_Source,
        NombreMotivo,
        TipoMotivo,
        ModifiedDate,
        BatchID
    )
    SELECT
        SRH.SalesOrderID,
        SR.SalesReasonID,
        SR.Name,
        SR.ReasonType,
        SR.ModifiedDate,
        @BatchID
    FROM AdventureWorks2019.Sales.SalesOrderHeaderSalesReason SRH
    INNER JOIN AdventureWorks2019.Sales.SalesReason SR
        ON SRH.SalesReasonID = SR.SalesReasonID;

    PRINT('LOG: STG.SalesReason cargado correctamente');
END;
GO
