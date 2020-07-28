CREATE TABLE [dbo].[CURRENCY] (
    [CURRENCYCODE]            NVARCHAR (3)     DEFAULT ('') NOT NULL,
    [TXT]                     NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [ROUNDOFFSALES]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROUNDOFFPURCH]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROUNDOFFTYPEPURCH]       INT              DEFAULT ((0)) NOT NULL,
    [ROUNDOFFTYPESALES]       INT              DEFAULT ((0)) NOT NULL,
    [ROUNDOFFTYPEPRICE]       INT              DEFAULT ((0)) NOT NULL,
    [ROUNDOFFPRICE]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [SYMBOL]                  NVARCHAR (5)     DEFAULT ('') NOT NULL,
    [CURRENCYCODEISO]         NVARCHAR (3)     DEFAULT ('') NOT NULL,
    [ISEURO]                  INT              DEFAULT ((0)) NOT NULL,
    [ROUNDINGPRECISION]       NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROUNDOFFASSETDEP_JP]     NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROUNDOFFTYPEASSETDEP_JP] INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]        DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [RECVERSION]              INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]               BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    CONSTRAINT [I_047CURRENCYCODEIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [CURRENCYCODE] ASC),
    CHECK ([RECID]<>(0))
);

