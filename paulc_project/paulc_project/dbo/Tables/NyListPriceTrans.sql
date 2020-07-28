CREATE TABLE [dbo].[NyListPriceTrans] (
    [LegalEntity]   NVARCHAR (4)     NOT NULL,
    [ItemId]        NVARCHAR (20)    NOT NULL,
    [EffectiveDate] DATETIME         NOT NULL,
    [Price]         DECIMAL (38, 16) NULL,
    [DateLoaded]    DATETIME         NULL,
    CONSTRAINT [PK_NyListPriceTrans] PRIMARY KEY CLUSTERED ([LegalEntity] ASC, [ItemId] ASC, [EffectiveDate] ASC)
);

