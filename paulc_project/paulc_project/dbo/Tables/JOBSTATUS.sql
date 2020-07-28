CREATE TABLE [dbo].[JOBSTATUS] (
    [Message_Id]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [HOSTNAME]        NVARCHAR (255) NULL,
    [APP-NAME]        NVARCHAR (255) NULL,
    [JobID]           NVARCHAR (255) NULL,
    [Severity]        INT            NULL,
    [Status]          INT            NULL,
    [Message]         NVARCHAR (255) NULL,
    [CreatedDateTime] DATETIME       CONSTRAINT [DF_JOBSTATUS_CreatedDateTime] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_JOBSTATUS] PRIMARY KEY CLUSTERED ([Message_Id] ASC)
);

