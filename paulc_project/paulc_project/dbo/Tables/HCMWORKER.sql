CREATE TABLE [dbo].[HCMWORKER] (
    [PERSON]           BIGINT        DEFAULT ((0)) NOT NULL,
    [PERSONNELNUMBER]  NVARCHAR (25) DEFAULT ('') NOT NULL,
    [MODIFIEDDATETIME] DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]       NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [CREATEDDATETIME]  DATETIME      DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]        NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [RECVERSION]       INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]        BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]            BIGINT        NOT NULL,
    CHECK ([RECID]<>(0))
);

