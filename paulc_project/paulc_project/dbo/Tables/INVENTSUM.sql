﻿CREATE TABLE [dbo].[INVENTSUM] (
    [ITEMID]                 NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [POSTEDQTY]              NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [POSTEDVALUE]            NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [DEDUCTED]               NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [RECEIVED]               NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [RESERVPHYSICAL]         NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [RESERVORDERED]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ONORDER]                NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ORDERED]                NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [QUOTATIONISSUE]         NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [QUOTATIONRECEIPT]       NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [INVENTDIMID]            NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [CLOSED]                 INT              DEFAULT ((0)) NOT NULL,
    [REGISTERED]             NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PICKED]                 NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [AVAILORDERED]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [AVAILPHYSICAL]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PHYSICALVALUE]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ARRIVED]                NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PHYSICALINVENT]         NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [CLOSEDQTY]              INT              DEFAULT ((0)) NOT NULL,
    [LASTUPDDATEPHYSICAL]    DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [LASTUPDDATEEXPECTED]    DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [POSTEDVALUESECCUR_RU]   NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PHYSICALVALUESECCUR_RU] NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWARRIVED]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWAVAILORDERED]      NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWAVAILPHYSICAL]     NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWDEDUCTED]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWONORDER]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWORDERED]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWPHYSICALINVENT]    NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWPICKED]            NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWPOSTEDQTY]         NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWQUOTATIONISSUE]    NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWQUOTATIONRECEIPT]  NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWRECEIVED]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWREGISTERED]        NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWRESERVORDERED]     NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [PDSCWRESERVPHYSICAL]    NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]       DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DATAAREAID]             NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]             INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]              BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                  BIGINT           NOT NULL,
    CONSTRAINT [I_174ITEMDIMIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [ITEMID] ASC, [INVENTDIMID] ASC),
    CHECK ([RECID]<>(0))
);

