CREATE TABLE [dbo].[ECORESPRODUCT] (
    [PRODUCTMASTER]                         BIGINT        DEFAULT (NULL) NULL,
    [RETAITOTALWEIGHT]                      INT           DEFAULT (NULL) NULL,
    [VARIANTCONFIGURATIONTECHNOLOGY]        INT           DEFAULT (NULL) NULL,
    [RETAILCOLORGROUPID]                    NVARCHAR (10) DEFAULT (NULL) NULL,
    [RETAILSIZEGROUPID]                     NVARCHAR (10) DEFAULT (NULL) NULL,
    [RETAILSTYLEGROUPID]                    NVARCHAR (10) DEFAULT (NULL) NULL,
    [ISPRODUCTVARIANTUNITCONVERSIONENABLED] INT           DEFAULT (NULL) NULL,
    [INSTANCERELATIONTYPE]                  BIGINT        DEFAULT ((0)) NOT NULL,
    [DISPLAYPRODUCTNUMBER]                  NVARCHAR (70) DEFAULT ('') NOT NULL,
    [SEARCHNAME]                            NVARCHAR (20) DEFAULT ('') NOT NULL,
    [PRODUCTTYPE]                           INT           DEFAULT ((0)) NOT NULL,
    [PDSCWPRODUCT]                          INT           DEFAULT ((0)) NOT NULL,
    [MODIFIEDBY]                            NVARCHAR (8)  DEFAULT ('?') NOT NULL,
    [RECVERSION]                            INT           DEFAULT ((1)) NOT NULL,
    [RELATIONTYPE]                          BIGINT        DEFAULT ((0)) NOT NULL,
    [PARTITION]                             BIGINT        DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                                 BIGINT        NOT NULL,
    CONSTRAINT [I_3270RECID] PRIMARY KEY CLUSTERED ([RECID] ASC),
    CHECK ([RECID]<>(0))
);

