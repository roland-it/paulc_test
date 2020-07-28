﻿CREATE TABLE [dbo].[DIMENSIONATTRIBUTEVALUESETITEM] (
    [DIMENSIONATTRIBUTEVALUESET] BIGINT        NOT NULL,
    [DIMENSIONATTRIBUTEVALUE]    BIGINT        NOT NULL,
    [DISPLAYVALUE]               NVARCHAR (30) NOT NULL,
    [MODIFIEDBY]                 NVARCHAR (8)  NOT NULL,
    [RECVERSION]                 INT           NOT NULL,
    [PARTITION]                  BIGINT        NOT NULL,
    [RECID]                      BIGINT        NOT NULL,
    CONSTRAINT [I_3261RECID] PRIMARY KEY CLUSTERED ([RECID] ASC)
);

