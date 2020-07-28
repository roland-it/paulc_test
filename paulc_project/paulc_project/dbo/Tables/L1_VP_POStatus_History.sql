CREATE TABLE [dbo].[L1_VP_POStatus_History] (
    [execution_date]   DATETIME       NOT NULL,
    [PO_ID]            INT            NOT NULL,
    [PO_NUM]           NVARCHAR (220) NOT NULL,
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
    [done_date]        VARCHAR (8000) NULL,
    CONSTRAINT [PK_L1_VP_POStatus_History] PRIMARY KEY CLUSTERED ([execution_date] ASC, [PO_ID] ASC, [PO_NUM] ASC)
);

