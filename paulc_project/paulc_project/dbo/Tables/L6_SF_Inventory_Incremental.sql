CREATE TABLE [dbo].[L6_SF_Inventory_Incremental] (
    [entity]      NVARCHAR (4)     NOT NULL,
    [warehouseid] NVARCHAR (10)    NOT NULL,
    [itemid]      NVARCHAR (20)    NOT NULL,
    [physical]    NUMERIC (38, 16) NULL,
    [available]   NUMERIC (38, 16) NULL,
    [reserved]    NUMERIC (38, 16) NULL
);

