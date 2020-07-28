CREATE TABLE [dbo].[WHSPHYSDIMUOM] (
    [UOM]              NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ITEMID]           NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [PHYSDIMID]        NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [DEPTH]            NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [HEIGHT]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [WEIGHT]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [WIDTH]            NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME] DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]       NVARCHAR (8)     NOT NULL,
    [DATAAREAID]       NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]       INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]        BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]            BIGINT           NOT NULL,
    CONSTRAINT [I_102695RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

