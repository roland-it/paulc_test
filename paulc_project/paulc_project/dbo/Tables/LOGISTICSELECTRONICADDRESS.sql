﻿CREATE TABLE [dbo].[LOGISTICSELECTRONICADDRESS] (
    [LOCATOR]           NVARCHAR (255) DEFAULT ('') NOT NULL,
    [LOCATOREXTENSION]  NVARCHAR (10)  DEFAULT ('') NOT NULL,
    [LOCATION]          BIGINT         DEFAULT ((0)) NOT NULL,
    [COUNTRYREGIONCODE] NVARCHAR (5)   DEFAULT ('') NOT NULL,
    [TYPE]              INT            DEFAULT ((0)) NOT NULL,
    [DESCRIPTION]       NVARCHAR (60)  DEFAULT ('') NOT NULL,
    [ISINSTANTMESSAGE]  INT            DEFAULT ((0)) NOT NULL,
    [ISMOBILEPHONE]     INT            DEFAULT ((0)) NOT NULL,
    [ISPRIMARY]         INT            DEFAULT ((0)) NOT NULL,
    [ISPRIVATE]         INT            DEFAULT ((0)) NOT NULL,
    [PRIVATEFORPARTY]   BIGINT         DEFAULT ((0)) NOT NULL,
    [MODIFIEDBY]        NVARCHAR (8)   DEFAULT ('?') NOT NULL,
    [RECVERSION]        INT            DEFAULT ((1)) NOT NULL,
    [PARTITION]         BIGINT         DEFAULT ((5637144576.)) NOT NULL,
    [RECID]             BIGINT         NOT NULL,
    CHECK ([RECID]<>(0))
);

