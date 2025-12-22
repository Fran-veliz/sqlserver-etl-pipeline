USE AventureWorks_DWH;
GO

CREATE OR ALTER PROCEDURE STG.sp_Carga_Promocion
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BatchID UNIQUEIDENTIFIER = NEWID();

    TRUNCATE TABLE STG.Promocion;

    INSERT INTO STG.Promocion (
        SpecialOfferID_Source,
        Descripcion,
        DiscountPct,
        TipoPromocion,
        Categoria,
        FechaInicio,
        FechaFin,
        MinQty,
        MaxQty,
        ModifiedDate,
        BatchID
    )
    SELECT
        SpecialOfferID,
        Description,
        DiscountPct,
        Type,
        Category,
        StartDate,
        EndDate,
        MinQty,
        MaxQty,
        ModifiedDate,
        @BatchID
    FROM AdventureWorks2019.Sales.SpecialOffer;

    PRINT('LOG: STG.Promocion cargado correctamente');
END;
GO
