CREATE TABLE [dbo].[INVENTCOSTTRANSVARIANCE] (
    [INVENTCOSTTRANSREFRECID]   BIGINT           NOT NULL,
    [COSTAMOUNT]                NUMERIC (32, 16) NOT NULL,
    [COSTGROUPID]               NVARCHAR (10)    NOT NULL,
    [SPLIT]                     INT              NOT NULL,
    [VARIANCETYPE]              INT              NOT NULL,
    [LEVEL_]                    INT              NOT NULL,
    [POSTING]                   INT              NOT NULL,
    [POSTINGOFFSET]             INT              NOT NULL,
    [ISPOSTED]                  INT              NOT NULL,
    [COSTAMOUNTPOSTED]          NUMERIC (32, 16) NOT NULL,
    [DEFAULTDIMENSION]          BIGINT           NOT NULL,
    [LEDGERDIMENSION]           BIGINT           NOT NULL,
    [OFFSETLEDGERDIMENSION]     BIGINT           NOT NULL,
    [COSTAMOUNTSECCUR_RU]       NUMERIC (32, 16) NOT NULL,
    [COSTAMOUNTPOSTEDSECCUR_RU] NUMERIC (32, 16) NOT NULL,
    [DATAAREAID]                NVARCHAR (4)     NOT NULL,
    [RECVERSION]                INT              NOT NULL,
    [PARTITION]                 BIGINT           NOT NULL,
    [RECID]                     BIGINT           NOT NULL,
    CONSTRAINT [I_2190RECID] PRIMARY KEY NONCLUSTERED ([RECID] ASC)
);

