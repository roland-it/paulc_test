CREATE TABLE [dbo].[INVENTITEMGTIN] (
    [ITEMID]                NVARCHAR (20) DEFAULT ('') NOT NULL,
    [INVENTDIMID]           NVARCHAR (20) DEFAULT ('') NOT NULL,
    [DESCRIPTION]           NVARCHAR (60) DEFAULT ('') NOT NULL,
    [GTINSETUP]             INT           DEFAULT ((0)) NOT NULL,
    [UNITID]                NVARCHAR (10) DEFAULT ('') NOT NULL,
    [GLOBALTRADEITEMNUMBER] NVARCHAR (14) DEFAULT ('') NOT NULL,
    [MODIFIEDDATETIME]      DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DEL_MODIFIEDTIME]      INT           DEFAULT ((0)) NOT NULL,
    [MODIFIEDBY]            NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [DATAAREAID]            NVARCHAR (4)  DEFAULT ('dat') NOT NULL,
    [RECVERSION]            INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]             BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                 BIGINT        NOT NULL,
    CONSTRAINT [I_1104ITEMIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [ITEMID] ASC, [INVENTDIMID] ASC, [UNITID] ASC),
    CHECK ([RECID]<>(0)),
    CHECK ([RECID]<>(0))
);

