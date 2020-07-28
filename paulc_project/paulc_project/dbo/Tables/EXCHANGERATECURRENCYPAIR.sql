CREATE TABLE [dbo].[EXCHANGERATECURRENCYPAIR] (
    [FROMCURRENCYCODE]          NVARCHAR (3) DEFAULT ('') NOT NULL,
    [TOCURRENCYCODE]            NVARCHAR (3) DEFAULT ('') NOT NULL,
    [EXCHANGERATETYPE]          BIGINT       DEFAULT ((0)) NOT NULL,
    [EXCHANGERATEDISPLAYFACTOR] INT          DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]          DATETIME     DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [RECVERSION]                INT          DEFAULT ((1)) NOT NULL,
    [PARTITION]                 BIGINT       DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                     BIGINT       NOT NULL,
    CONSTRAINT [I_6883RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

