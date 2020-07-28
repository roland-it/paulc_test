CREATE TABLE [dbo].[TAMDEDUCTIONUPDATEHISTORY] (
    [TAMDEDUCTIONID]          NVARCHAR (20)    NOT NULL,
    [TAMDEDUCTIONUPDATETYPE]  INT              NOT NULL,
    [LEDGERJOURNALID]         NVARCHAR (10)    NOT NULL,
    [LEDGERJOURNALTRANSRECID] BIGINT           NOT NULL,
    [AMOUNTCUR]               NUMERIC (32, 16) NOT NULL,
    [REVERSED]                INT              NOT NULL,
    [HCMWORKERID]             BIGINT           NOT NULL,
    [CREATEDDATETIME]         DATETIME         NOT NULL,
    [DEL_CREATEDTIME]         INT              NOT NULL,
    [CREATEDBY]               NVARCHAR (8)     NOT NULL,
    [DATAAREAID]              NVARCHAR (4)     NOT NULL,
    [RECVERSION]              INT              NOT NULL,
    [PARTITION]               BIGINT           NOT NULL,
    [RECID]                   BIGINT           NOT NULL,
    CONSTRAINT [I_30597RECID] PRIMARY KEY CLUSTERED ([RECID] ASC)
);

