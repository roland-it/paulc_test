CREATE TABLE [dbo].[EXCHANGERATE] (
    [EXCHANGERATECURRENCYPAIR] BIGINT           DEFAULT ((0)) NOT NULL,
    [EXCHANGERATE]             NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [VALIDTO]                  DATETIME         DEFAULT ('2154-12-31T00:00:00.000') NOT NULL,
    [VALIDFROM]                DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [MODIFIEDDATETIME]         DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [RECVERSION]               INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]                BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                    BIGINT           NOT NULL,
    CONSTRAINT [I_6885RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

