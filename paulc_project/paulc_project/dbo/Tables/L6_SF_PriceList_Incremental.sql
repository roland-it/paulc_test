CREATE TABLE [dbo].[L6_SF_PriceList_Incremental] (
    [CustomerName]     NVARCHAR (100)   NOT NULL,
    [Account Code]     NVARCHAR (20)    NOT NULL,
    [ITEMRELATION]     NVARCHAR (20)    NOT NULL,
    [ACCOUNTRELATION]  NVARCHAR (20)    NOT NULL,
    [INVENTLOCATIONID] NVARCHAR (10)    NOT NULL,
    [Currency]         NVARCHAR (3)     NOT NULL,
    [UNITID]           NVARCHAR (10)    NOT NULL,
    [ItemDescription]  NVARCHAR (60)    NOT NULL,
    [AMOUNT]           NUMERIC (32, 16) NOT NULL,
    [FROMDATE]         DATETIME         NOT NULL,
    [TODATE]           DATETIME         NOT NULL,
    [DATAAREAID]       NVARCHAR (4)     NOT NULL,
    [ModifiedDatetime] DATETIME         NOT NULL,
    [PreviousAmount]   NUMERIC (32, 16) NULL,
    [PreviousFromDate] DATETIME         NULL,
    [PreviousToDate]   DATETIME         NULL
);

