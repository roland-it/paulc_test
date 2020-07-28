CREATE TABLE [dbo].[PRICEDISCGROUP] (
    [MODULE]                      INT           DEFAULT ((0)) NOT NULL,
    [TYPE]                        INT           DEFAULT ((0)) NOT NULL,
    [GROUPID]                     NVARCHAR (10) DEFAULT ('') NOT NULL,
    [NAME]                        NVARCHAR (60) DEFAULT ('') NOT NULL,
    [MCRPRICEDISCGROUPTYPE]       INT           DEFAULT ((0)) NOT NULL,
    [ISRETAILPRICEGROUP]          INT           DEFAULT ((0)) NOT NULL,
    [RETAILCHECKSALESPRICESTATUS] INT           DEFAULT ((0)) NOT NULL,
    [RETAILPRICINGPRIORITYNUMBER] INT           DEFAULT ((0)) NOT NULL,
    [DATAAREAID]                  NVARCHAR (4)  DEFAULT ('dat') NOT NULL,
    [RECVERSION]                  INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]                   BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                       BIGINT        NOT NULL,
    CONSTRAINT [I_312PRICEDISCGROUP] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [MODULE] ASC, [TYPE] ASC, [GROUPID] ASC),
    CHECK ([RECID]<>(0))
);

