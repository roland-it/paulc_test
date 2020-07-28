CREATE TABLE [dbo].[UNITOFMEASURE] (
    [SYMBOL]             NVARCHAR (10) DEFAULT ('') NOT NULL,
    [UNITOFMEASURECLASS] INT           DEFAULT ((0)) NOT NULL,
    [SYSTEMOFUNITS]      INT           DEFAULT ((0)) NOT NULL,
    [DECIMALPRECISION]   INT           DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]   DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [RECVERSION]         INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]          BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]              BIGINT        NOT NULL,
    CONSTRAINT [I_4436RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);

