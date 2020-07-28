CREATE TABLE [dbo].[LOGISTICSLOCATIONROLE] (
    [NAME]            NVARCHAR (40) DEFAULT ('') NOT NULL,
    [TYPE]            INT           DEFAULT ((0)) NOT NULL,
    [ISPOSTALADDRESS] INT           DEFAULT ((0)) NOT NULL,
    [ISCONTACTINFO]   INT           DEFAULT ((0)) NOT NULL,
    [RECVERSION]      INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]       BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]           BIGINT        NOT NULL,
    CHECK ([RECID]<>(0))
);

