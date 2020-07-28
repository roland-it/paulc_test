CREATE TABLE [dbo].[DIMENSIONATTRIBUTEVALUE] (
    [DIMENSIONATTRIBUTE]      BIGINT           NOT NULL,
    [ISSUSPENDED]             INT              NOT NULL,
    [ACTIVEFROM]              DATETIME         NOT NULL,
    [ACTIVETO]                DATETIME         NOT NULL,
    [ISTOTAL]                 INT              NOT NULL,
    [ENTITYINSTANCE]          BIGINT           NOT NULL,
    [ISBLOCKEDFORMANUALENTRY] INT              NOT NULL,
    [GROUPDIMENSION]          NVARCHAR (10)    NOT NULL,
    [HASHKEY]                 UNIQUEIDENTIFIER NOT NULL,
    [ISDELETED]               INT              NOT NULL,
    [OWNER]                   BIGINT           NOT NULL,
    [ISBALANCING_PSN]         INT              NOT NULL,
    [MODIFIEDBY]              NVARCHAR (8)     NOT NULL,
    [RECVERSION]              INT              NOT NULL,
    [PARTITION]               BIGINT           NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    [ROLALLOWRELEASESO]       INT              NOT NULL,
    CONSTRAINT [I_381RECID] PRIMARY KEY CLUSTERED ([RECID] ASC)
);

