CREATE TABLE [dbo].[SalesOrderInvoiced] (
    [SalesId]    NVARCHAR (20) NOT NULL,
    [InvoiceId]  NVARCHAR (20) NOT NULL,
    [DataAreaId] NVARCHAR (4)  NOT NULL,
    CONSTRAINT [PK_SalesOrderInvoiced] PRIMARY KEY CLUSTERED ([SalesId] ASC, [InvoiceId] ASC, [DataAreaId] ASC)
);

