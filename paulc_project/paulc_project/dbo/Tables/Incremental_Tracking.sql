CREATE TABLE [dbo].[Incremental_Tracking] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [VIEW_NAME]        VARCHAR (100) NOT NULL,
    [MODIFIEDDATETIME] DATETIME      NULL,
    [KEY_COLUMNS]      VARCHAR (100) NULL,
    [KEY_VALUE]        VARCHAR (100) NULL,
    [LAST_RUNDATETIME] DATETIME      CONSTRAINT [DF_Incremental_Tracking_LAST_RUNDATETIME] DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Incremental_Tracking]
    ON [dbo].[Incremental_Tracking]([VIEW_NAME] ASC, [MODIFIEDDATETIME] ASC);

