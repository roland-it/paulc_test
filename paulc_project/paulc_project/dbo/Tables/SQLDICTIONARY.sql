CREATE TABLE [dbo].[SQLDICTIONARY] (
    [TABLEID]      INT           NOT NULL,
    [FIELDID]      INT           NOT NULL,
    [ARRAY]        INT           NOT NULL,
    [NAME]         NVARCHAR (40) NOT NULL,
    [SQLNAME]      NVARCHAR (40) NOT NULL,
    [FIELDTYPE]    INT           NOT NULL,
    [STRSIZE]      INT           NOT NULL,
    [SHADOW]       INT           NOT NULL,
    [RIGHTJUSTIFY] INT           NOT NULL,
    [NULLABLE]     INT           NOT NULL,
    [FLAGS]        INT           NOT NULL,
    [RECVERSION]   INT           NOT NULL,
    [RECID]        BIGINT        NOT NULL,
    CONSTRAINT [I_65518FIELD] PRIMARY KEY CLUSTERED ([TABLEID] ASC, [FIELDID] ASC, [ARRAY] ASC, [SHADOW] ASC)
);

