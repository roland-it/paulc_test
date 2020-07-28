﻿CREATE TABLE [dbo].[INVENTITEMPURCHSETUP] (
    [ITEMID]                  NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVENTDIMID]             NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVENTDIMIDDEFAULT]      NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [MANDATORYINVENTSITE]     INT              DEFAULT ((0)) NOT NULL,
    [MANDATORYINVENTLOCATION] INT              DEFAULT ((0)) NOT NULL,
    [MULTIPLEQTY]             NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [LOWESTQTY]               NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [HIGHESTQTY]              NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [STANDARDQTY]             NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [LEADTIME]                INT              DEFAULT ((0)) NOT NULL,
    [CALENDARDAYS]            INT              DEFAULT ((0)) NOT NULL,
    [STOPPED]                 INT              DEFAULT ((0)) NOT NULL,
    [OVERRIDE]                INT              DEFAULT ((0)) NOT NULL,
    [DATAAREAID]              NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]              INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]               BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    CONSTRAINT [I_1754ITEMDIMIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [ITEMID] ASC, [INVENTDIMID] ASC),
    CHECK ([RECID]<>(0))
);

