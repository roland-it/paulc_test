﻿

CREATE VIEW [dbo].[DIRPARTYNAMEPRIMARYADDRESSVIEW] AS SELECT T1.RECID AS PARTY,T1.INSTANCERELATIONTYPE AS PARTYTYPE,T1.NAME AS NAME,
T1.PARTITION AS PARTITION,T1.RECID AS RECID,T2.PARTITION AS PARTITION#2,T2.ADDRESS AS ADDRESS,T2.BUILDINGCOMPLIMENT AS BUILDINGCOMPLIMENT,
T2.CITY AS CITY,T2.COUNTRYCURRENCYCODE AS COUNTRYCURRENCYCODE,T2.COUNTRYREGIONID AS COUNTRYREGIONID,T2.COUNTY AS COUNTY,
T2.DISTRICT AS DISTRICT,T2.ISPRIMARY AS ISPRIMARY,T2.ISPRIVATE AS ISPRIVATE,T2.LATITUDE AS LATITUDE,T2.LOCATION AS LOCATION,
T2.LOCATIONNAME AS LOCATIONNAME,T2.LONGITUDE AS LONGITUDE,T2.PARTYLOCATION AS PARTYLOCATION,T2.POSTBOX AS POSTBOX,T2.STATE AS STATE,
T2.STREET AS STREET,T2.STREETNUMBER AS STREETNUMBER,T2.TIMEZONE AS TIMEZONE,T2.VALIDFROM AS VALIDFROM,T2.VALIDTO AS VALIDTO,T2.ZIPCODE AS ZIPCODE,
T2.ISOCODE AS ISOCODE,T2.XRECID_LOGISTICSPOSTALADDRESS AS XRECID_LOGISTICSPOSTALADDRESS,T2.XRECVERSION_LOGISTICSPOSTALADDRESS AS XRECVERSION_LOGISTICSPOSTALADDRESS 
FROM  DIRPARTYTABLE T1 LEFT OUTER JOIN DIRPARTYPOSTALADDRESSVIEW T2 ON ((T2.ISPRIMARY=1) AND (T1.RECID=T2.PARTY AND (T1.PARTITION = T2.PARTITION)))