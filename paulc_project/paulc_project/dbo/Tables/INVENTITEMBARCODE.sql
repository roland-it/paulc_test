CREATE TABLE [dbo].[INVENTITEMBARCODE] (
    [ITEMBARCODE]       NVARCHAR (80)    DEFAULT ('') NOT NULL,
    [ITEMID]            NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVENTDIMID]       NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [BARCODESETUPID]    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [USEFORPRINTING]    INT              DEFAULT ((0)) NOT NULL,
    [USEFORINPUT]       INT              DEFAULT ((0)) NOT NULL,
    [DESCRIPTION]       NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [QTY]               NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [UNITID]            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [RETAILVARIANTID]   NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [RETAILSHOWFORITEM] INT              DEFAULT ((0)) NOT NULL,
    [BLOCKED]           INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]  DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DEL_MODIFIEDTIME]  INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDBY]        NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [DATAAREAID]        NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]        INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]         BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]             BIGINT           NOT NULL,
    [RFLL_OVERRIDE]     INT              DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_1213RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);


GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [dbo].[INVENTITEMBARCODE]([BARCODESETUPID] ASC)
    INCLUDE([ITEMBARCODE], [ITEMID], [DATAAREAID], [RECID]);

