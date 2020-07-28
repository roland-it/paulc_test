CREATE TABLE [dbo].[L6_SF_SalesLine_Incremental] (
    [DataAreaId]           NVARCHAR (4)     NULL,
    [OrderNum]             NVARCHAR (20)    NOT NULL,
    [ItemNum]              NVARCHAR (20)    NOT NULL,
    [BatchNum]             NVARCHAR (20)    NOT NULL,
    [CasesShipped]         NUMERIC (38, 14) NULL,
    [InvoicePrice]         NUMERIC (38, 6)  NULL,
    [ShippingDate]         DATETIME         NULL,
    [TotalCost]            NUMERIC (38, 6)  NULL,
    [InventTransId]        NVARCHAR (20)    NOT NULL,
    [QtyOrdered]           NUMERIC (38, 14) NULL,
    [InvoicePriceCur]      NUMERIC (38, 6)  NULL,
    [InventStatus]         VARCHAR (16)     NOT NULL,
    [RolWmsReservedStatus] NVARCHAR (50)    NOT NULL,
    [GrossAmountMST]       NUMERIC (38, 6)  NULL,
    [MODIFIEDDATETIME]     DATETIME         NOT NULL
);

