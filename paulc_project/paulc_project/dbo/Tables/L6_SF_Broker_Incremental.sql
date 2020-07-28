CREATE TABLE [dbo].[L6_SF_Broker_Incremental] (
    [VendorType]       VARCHAR (6)    NOT NULL,
    [AccountNum]       NVARCHAR (20)  NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [Street]           NVARCHAR (250) NULL,
    [City]             NVARCHAR (60)  NULL,
    [State]            NVARCHAR (10)  NULL,
    [Zip]              NVARCHAR (10)  NULL,
    [CountryRegionId]  NVARCHAR (10)  NULL,
    [CountryName]      NVARCHAR (255) NULL,
    [VendGroup]        NVARCHAR (10)  NOT NULL,
    [KnownAs]          NVARCHAR (100) NOT NULL,
    [LocationName]     NVARCHAR (60)  NULL,
    [Partition]        BIGINT         NOT NULL,
    [AccountCode]      INT            NULL,
    [BrokerId]         NVARCHAR (20)  NULL,
    [ModifiedDateTime] DATETIME       NOT NULL
);

