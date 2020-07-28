CREATE TABLE [dbo].[LOGISTICSPOSTALADDRESS] (
    [ADDRESS]            NVARCHAR (250)   DEFAULT ('') NOT NULL,
    [COUNTRYREGIONID]    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ZIPCODE]            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [STATE]              NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [COUNTY]             NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CITY]               NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [STREET]             NVARCHAR (250)   DEFAULT ('') NOT NULL,
    [LATITUDE]           NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [LONGITUDE]          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [TIMEZONE]           INT              DEFAULT ((0)) NOT NULL,
    [STREETNUMBER]       NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [BUILDINGCOMPLIMENT] NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [POSTBOX]            NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [CITYRECID]          BIGINT           DEFAULT ((0)) NOT NULL,
    [DISTRICT]           BIGINT           DEFAULT ((0)) NOT NULL,
    [LOCATION]           BIGINT           DEFAULT ((0)) NOT NULL,
    [ZIPCODERECID]       BIGINT           DEFAULT ((0)) NOT NULL,
    [VALIDTO]            DATETIME         DEFAULT ('2154-12-31T23:59:59.000') NOT NULL,
    [VALIDTOTZID]        INT              DEFAULT ((37001)) NOT NULL,
    [VALIDFROM]          DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [VALIDFROMTZID]      INT              DEFAULT ((37001)) NOT NULL,
    [DISTRICTNAME]       NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [STREETID_RU]        BIGINT           DEFAULT ((0)) NOT NULL,
    [HOUSEID_RU]         BIGINT           DEFAULT ((0)) NOT NULL,
    [FLATID_RU]          BIGINT           DEFAULT ((0)) NOT NULL,
    [APARTMENT_RU]       NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BUILDING_RU]        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CITYKANA_JP]        NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [ISPRIVATE]          INT              DEFAULT ((0)) NOT NULL,
    [PRIVATEFORPARTY]    BIGINT           DEFAULT ((0)) NOT NULL,
    [STREETKANA_JP]      NVARCHAR (250)   DEFAULT ('') NOT NULL,
    [MODIFIEDDATETIME]   DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [MODIFIEDBY]         NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [RECVERSION]         INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]          BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]              BIGINT           NOT NULL,
    CHECK ([RECID]<>(0))
);


GO
CREATE NONCLUSTERED INDEX [VW_INDX_LPA]
    ON [dbo].[LOGISTICSPOSTALADDRESS]([LOCATION] ASC, [PARTITION] ASC)
    INCLUDE([COUNTRYREGIONID], [ZIPCODE], [STATE], [CITY], [STREET], [VALIDTO], [VALIDFROM]);

