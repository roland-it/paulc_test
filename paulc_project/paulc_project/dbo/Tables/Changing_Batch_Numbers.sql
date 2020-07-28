CREATE TABLE [dbo].[Changing_Batch_Numbers] (
    [change_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [trndte]    DATETIME        NULL,
    [ordnum]    VARCHAR (50)    NULL,
    [ordlin]    VARCHAR (50)    NULL,
    [prtnum]    VARCHAR (50)    NULL,
    [lot]       VARCHAR (50)    NULL,
    [all_qty]   DECIMAL (18, 4) NULL,
    [usr_id]    VARCHAR (50)    NULL,
    [rule_nam]  VARCHAR (50)    NULL,
    [load_date] DATETIME        CONSTRAINT [DF_Changing_Batch_Numbers_load_date_Hist] DEFAULT (getdate()) NULL,
    [AX_Batch]  VARCHAR (500)   NULL,
    CONSTRAINT [PK_Changing_Batch_Numbers_Hist] PRIMARY KEY CLUSTERED ([change_id] ASC)
);

