CREATE TABLE [dbo].[LOGISTICSLOCATION] (
    [LOCATIONID]       NVARCHAR (30) DEFAULT ('') NOT NULL,
    [DESCRIPTION]      NVARCHAR (60) DEFAULT ('') NOT NULL,
    [ISPOSTALADDRESS]  INT           DEFAULT ((0)) NOT NULL,
    [PARENTLOCATION]   BIGINT        DEFAULT ((0)) NOT NULL,
    [DUNSNUMBERRECID]  BIGINT        DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME] DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]       NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [CREATEDDATETIME]  DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [RECVERSION]       INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]        BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]            BIGINT        NOT NULL,
    CHECK ([RECID]<>(0))
);


GO
CREATE NONCLUSTERED INDEX [VW_INDX_LLOC]
    ON [dbo].[LOGISTICSLOCATION]([PARTITION] ASC, [RECID] ASC)
    INCLUDE([DESCRIPTION]);

