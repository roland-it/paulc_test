﻿
CREATE VIEW [dbo].[DIRPARTYPOSTALADDRESSVIEW] AS SELECT T1.PARTY AS PARTY,T1.RECID AS PARTYLOCATION,T1.ISPRIMARY AS ISPRIMARY,T1.ISLOCATIONOWNER 
AS ISLOCATIONOWNER,T1.ISPRIMARYTAXREGISTRATION AS ISPRIMARYTAXREGISTRATION,T1.PARTITION AS PARTITION,T1.RECID AS RECID,T2.PARTITION AS PARTITION#2,T2.LOCATIONNAME
 AS LOCATIONNAME,T2.ADDRESS AS ADDRESS,T2.STREETNUMBER AS STREETNUMBER,T2.STREET AS STREET,T2.CITY AS CITY,T2.ZIPCODE AS ZIPCODE,T2.STATE AS STATE,T2.COUNTY AS 
 COUNTY,T2.COUNTRYREGIONID AS COUNTRYREGIONID,T2.DISTRICT AS DISTRICT,T2.POSTBOX AS POSTBOX,T2.BUILDINGCOMPLIMENT AS BUILDINGCOMPLIMENT,T2.TIMEZONE AS TIMEZONE,
 T2.LONGITUDE AS LONGITUDE,T2.LATITUDE AS LATITUDE,T2.LOCATION AS LOCATION,T2.VALIDFROM AS VALIDFROM,T2.VALIDTO AS VALIDTO,T2.COUNTRYCURRENCYCODE 
 AS COUNTRYCURRENCYCODE,T2.ISPRIVATE AS ISPRIVATE,T2.DISTRICTNAME AS DISTRICTNAME,T2.POSTALADDRESS AS POSTALADDRESS,T2.ISOCODE AS ISOCODE,T2.STREETID_RU
  AS STREETID_RU,T2.HOUSEID_RU AS HOUSEID_RU,T2.FLATID_RU AS FLATID_RU,T2.BUILDING_RU AS BUILDING_RU,T2.APARTMENT_RU AS APARTMENT_RU,T2.PRIVATEFORPARTY AS
   PRIVATEFORPARTY,T2.XRECID_LOGISTICSPOSTALADDRESS AS XRECID_LOGISTICSPOSTALADDRESS,T2.XRECVERSION_LOGISTICSPOSTALADDRESS AS XRECVERSION_LOGISTICSPOSTALADDRESS,
   T2.CITYRECID AS CITYRECID
    FROM  DIRPARTYLOCATION T1 LEFT OUTER JOIN LOGISTICSPOSTALADDRESSVIEW T2 ON (T1.LOCATION=T2.LOCATION AND (T1.PARTITION = T2.PARTITION)) WHERE (T1.ISPOSTALADDRESS=1)