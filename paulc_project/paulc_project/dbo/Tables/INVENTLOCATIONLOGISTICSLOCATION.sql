CREATE TABLE [dbo].[INVENTLOCATIONLOGISTICSLOCATION] (
    [INVENTLOCATION]         BIGINT         DEFAULT ((0)) NOT NULL,
    [LOCATION]               BIGINT         DEFAULT ((0)) NOT NULL,
    [ATTENTIONTOADDRESSLINE] NVARCHAR (255) DEFAULT ('') NOT NULL,
    [ISDEFAULT]              INT            DEFAULT ((0)) NOT NULL,
    [ISPRIMARY]              INT            DEFAULT ((0)) NOT NULL,
    [ISPOSTALADDRESS]        INT            DEFAULT ((0)) NOT NULL,
    [ISPRIVATE]              INT            DEFAULT ((0)) NOT NULL,
    [RECVERSION]             INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]              BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                  BIGINT         NOT NULL,
    CONSTRAINT [I_3510RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

