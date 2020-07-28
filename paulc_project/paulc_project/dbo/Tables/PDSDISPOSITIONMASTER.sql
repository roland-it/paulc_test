CREATE TABLE [dbo].[PDSDISPOSITIONMASTER] (
    [DESCRIPTION]                          NVARCHAR (30) DEFAULT ('') NOT NULL,
    [DISPOSITIONCODE]                      NVARCHAR (10) DEFAULT ('') NOT NULL,
    [PDSNETTABLE]                          INT           DEFAULT ((0)) NOT NULL,
    [PDSPRODBLOCKPICK]                     INT           DEFAULT ((0)) NOT NULL,
    [PDSPRODBLOCKPRODUCTIONPICKINGJOURNAL] INT           DEFAULT ((0)) NOT NULL,
    [PDSPRODBLOCKRESERVE]                  INT           DEFAULT ((0)) NOT NULL,
    [PDSSALESBLOCKPICK]                    INT           DEFAULT ((0)) NOT NULL,
    [PDSSALESBLOCKRESERVE]                 INT           DEFAULT ((0)) NOT NULL,
    [PDSSALESBLOCKSHIP]                    INT           DEFAULT ((0)) NOT NULL,
    [PDSTRANSBLOCKPICK]                    INT           DEFAULT ((0)) NOT NULL,
    [PDSTRANSBLOCKRESERVE]                 INT           DEFAULT ((0)) NOT NULL,
    [PDSTRANSBLOCKSHIP]                    INT           DEFAULT ((0)) NOT NULL,
    [STATUS]                               INT           DEFAULT ((0)) NOT NULL,
    [DATAAREAID]                           NVARCHAR (4)  DEFAULT ('dat') NOT NULL,
    [RECVERSION]                           INT           DEFAULT ((1)) NOT NULL,
    [PARTITION]                            BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                                BIGINT        NOT NULL,
    CONSTRAINT [I_101263DISPOSITIONCODEIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [DISPOSITIONCODE] ASC),
    CHECK ([RECID]<>(0))
);

