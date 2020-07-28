﻿CREATE TABLE [dbo].[DLVMODE] (
    [CODE]                   NVARCHAR (10) DEFAULT ('') NOT NULL,
    [TXT]                    NVARCHAR (60) DEFAULT ('') NOT NULL,
    [SHIPCARRIERDLVTYPE]     INT           DEFAULT ((0)) NOT NULL,
    [SHIPCARRIERID]          NVARCHAR (10) DEFAULT ('') NOT NULL,
    [SHIPCARRIERACCOUNTCODE] NVARCHAR (20) DEFAULT ('') NOT NULL,
    [SHIPCARRIERNAME]        NVARCHAR (20) DEFAULT ('') NOT NULL,
    [MARKUPGROUP]            NVARCHAR (10) DEFAULT ('') NOT NULL,
    [MCREXPEDITE]            NVARCHAR (10) DEFAULT ('') NOT NULL,
    [DATAAREAID]             NVARCHAR (4)  DEFAULT ('dat') NOT NULL,
    [RECVERSION]             INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]              BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                  BIGINT        NOT NULL,
    CHECK ([RECID]<>(0))
);

