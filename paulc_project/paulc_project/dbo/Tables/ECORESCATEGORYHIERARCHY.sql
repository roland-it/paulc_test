CREATE TABLE [dbo].[ECORESCATEGORYHIERARCHY] (
    [NAME]              NVARCHAR (128) DEFAULT ('') NOT NULL,
    [HIERARCHYMODIFIER] INT            DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]  DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]        NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [CREATEDDATETIME]   DATETIME       DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [CREATEDBY]         NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [RECVERSION]        INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]         BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]             BIGINT         NOT NULL,
    CONSTRAINT [I_2660RECID] PRIMARY KEY CLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

