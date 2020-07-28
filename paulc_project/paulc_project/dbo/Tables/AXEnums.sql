CREATE TABLE [dbo].[AXEnums] (
    [Type]        NVARCHAR (50) NOT NULL,
    [Value]       INT           NOT NULL,
    [Name]        NVARCHAR (20) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AXEnums] PRIMARY KEY NONCLUSTERED ([Type] ASC, [Value] ASC),
    CONSTRAINT [IX_AXEnums] UNIQUE CLUSTERED ([Type] ASC, [Value] ASC)
);

