CREATE TABLE [dbo].[INVENTPOSTING] (
    [ITEMRELATION]            NVARCHAR (20) NOT NULL,
    [CUSTVENDRELATION]        NVARCHAR (20) NOT NULL,
    [TAXGROUPID]              NVARCHAR (10) NOT NULL,
    [INVENTACCOUNTTYPE]       INT           NOT NULL,
    [ITEMCODE]                INT           NOT NULL,
    [CUSTVENDCODE]            INT           NOT NULL,
    [COSTCODE]                INT           NOT NULL,
    [COSTRELATION]            NVARCHAR (10) NOT NULL,
    [CATEGORYRELATION]        BIGINT        NOT NULL,
    [LEDGERDIMENSION]         BIGINT        NOT NULL,
    [INVENTPROFILETYPEALL_RU] INT           NOT NULL,
    [INVENTPROFILETYPE_RU]    INT           NOT NULL,
    [INVENTPROFILEID_RU]      NVARCHAR (10) NOT NULL,
    [SITECODE_CN]             INT           NOT NULL,
    [SITERELATION_CN]         NVARCHAR (10) NOT NULL,
    [DATAAREAID]              NVARCHAR (4)  NOT NULL,
    [RECVERSION]              INT           NOT NULL,
    [PARTITION]               BIGINT        NOT NULL,
    [RECID]                   BIGINT        NOT NULL,
    CONSTRAINT [I_157RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC)
);

