CREATE TABLE [dbo].[Vp_tmpTLESummary] (
    [execution_date]   DATETIME       NOT NULL,
    [PO_ID]            INT            NOT NULL,
    [PO_NUM]           NVARCHAR (220) NULL,
    [TP_Name]          NVARCHAR (300) NULL,
    [CUSTOMER_NUM]     VARCHAR (100)  NOT NULL,
    [CUSTOMER_NAME]    VARCHAR (100)  NOT NULL,
    [ORDER_ENTRY_DATE] DATETIME       NULL,
    [REQ_RECEIPT_DATE] VARCHAR (100)  NOT NULL,
    [PO]               VARCHAR (50)   NULL,
    [WSO]              VARCHAR (50)   NULL,
    [POA]              VARCHAR (50)   NULL,
    [POC]              VARCHAR (50)   NULL,
    [INV]              VARCHAR (50)   NULL,
    [WSA]              VARCHAR (50)   NULL,
    [ASN]              VARCHAR (50)   NULL,
    [Num_Complete]     INT            NULL,
    [Num_Required]     INT            NULL,
    [done_date]        VARCHAR (8000) NULL
);


GO
CREATE NONCLUSTERED INDEX [VW_INDX_VP_TLE]
    ON [dbo].[Vp_tmpTLESummary]([execution_date] ASC, [PO_ID] ASC, [PO_NUM] ASC)
    INCLUDE([TP_Name], [CUSTOMER_NUM], [CUSTOMER_NAME], [ORDER_ENTRY_DATE], [REQ_RECEIPT_DATE], [PO], [WSO], [POA], [POC], [INV], [WSA], [ASN], [Num_Complete], [Num_Required], [done_date]);

