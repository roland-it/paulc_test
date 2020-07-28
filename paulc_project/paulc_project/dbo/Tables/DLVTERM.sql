CREATE TABLE [dbo].[DLVTERM] (
    [CODE]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [TXT]                         NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [INTRASTATCODE]               NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [SHIPCARRIERAPPLYFREEMINIMUM] INT              DEFAULT ((0)) NOT NULL,
    [MISCCHARGES_IT]              INT              DEFAULT ((0)) NOT NULL,
    [SHIPCARRIERFREIGHTAPPLIED]   INT              DEFAULT ((0)) NOT NULL,
    [SHIPCARRIERFREEMINIMUM]      NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [TAXLOCATIONROLE]             INT              DEFAULT ((0)) NOT NULL,
    [CUSTOMINVENTPROFILEID_RU]    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CUSTOMINVENTTRANSSTATUS_RU]  INT              DEFAULT ((0)) NOT NULL,
    [FREIGHTCHARGETERM]           INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]            DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DATAAREAID]                  NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]                  INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]                   BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                       BIGINT           NOT NULL,
    CHECK ([RECID]<>(0))
);

