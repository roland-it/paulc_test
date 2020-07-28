﻿CREATE TABLE [dbo].[DATA_LOAD_STATUS_ERROR] (
    [STATUS_ERROR_ID] BIGINT          IDENTITY (1, 1) NOT NULL,
    [APP]             NVARCHAR (100)  NULL,
    [APP_AREA]        NVARCHAR (200)  NULL,
    [APP_STEP]        NVARCHAR (200)  NULL,
    [APP_STEP_STATUS] INT             NULL,
    [ERROR_AREA]      NVARCHAR (50)   NULL,
    [ERROR_SEVERITY]  NVARCHAR (2)    NULL,
    [ERROR_MESSAGE]   NVARCHAR (2000) NULL,
    [STATUS_DATETIME] DATETIME        NULL,
    CONSTRAINT [PK_DATA_LOAD_STATUS_ERROR] PRIMARY KEY CLUSTERED ([STATUS_ERROR_ID] ASC)
);

