﻿CREATE VIEW [dbo].[EXCHANGERATEEFFECTIVEVIEW] AS SELECT T1.PARTITION AS PARTITION,T1.RECID AS RECID,1 AS UnionAllBranchId,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.VALIDFROM) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEPRIORTOSTARTDATEVIEW T1 WHERE ((FIXEDCURRENCY1='') AND (FIXEDCURRENCY2='')) UNION ALL SELECT T1.PARTITION,T1.RECID,2,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.VALIDFROM) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.FIXEDSTARTDATE1 then T1.VALIDTO else T1.FIXEDSTARTDATE1 - 1 end) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEPRIORTOSTARTDATEVIEW T1 WHERE (( NOT ((FIXEDCURRENCY1='')) AND (FIXEDCURRENCY2='')) AND (VALIDFROM<FIXEDSTARTDATE1)) UNION ALL SELECT T1.PARTITION,T1.RECID,3,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.VALIDFROM) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.FIXEDSTARTDATE1 and T1.VALIDTO <= T1.FIXEDSTARTDATE2 then T1.VALIDTO when T1.FIXEDSTARTDATE1 <= T1.FIXEDSTARTDATE2 then T1.FIXEDSTARTDATE1 - 1  else T1.FIXEDSTARTDATE2 - 1  end) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEPRIORTOSTARTDATEVIEW T1 WHERE (( NOT ((FIXEDCURRENCY1='')) AND  NOT ((FIXEDCURRENCY2=''))) AND ((VALIDFROM<FIXEDSTARTDATE1) AND (VALIDFROM<FIXEDSTARTDATE2))) UNION ALL SELECT T1.PARTITION,T1.RECID,4,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.VALIDFROM) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPERECID) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATESAMEFROMTOCURRENCYVIEW T1 UNION ALL SELECT T1.PARTITION,T1.RECID,5,(CAST ((T1.EUROCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.STARTDATE) AS DATETIME)) AS VALIDFROM,(CAST (('21541231') AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTOEUROAFTERSTART T1 UNION ALL SELECT T1.PARTITION,T1.RECID,6,(CAST ((T1.CURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.EUROCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((T1.STARTDATE) AS DATETIME)) AS VALIDFROM,(CAST (('21541231') AS DATETIME)) AS VALIDTO,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((0.0) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTOEUROAFTERSTART T1 UNION ALL SELECT T1.PARTITION,T1.RECID,7,(CAST ((T1.EURODENCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE then T1.VALIDFROM else T1.STARTDATE end) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((T1.EURODENEXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EURODENEXCHANGERATE when 0.0 then 0.0 else 100.0 * T1.EXCHANGERATE / T1.EURODENEXCHANGERATE end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTOVARAFTERSTARTVIEW T1 UNION ALL SELECT T1.PARTITION,T1.RECID,8,(CAST ((T1.TOCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.EURODENCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE then T1.VALIDFROM else T1.STARTDATE end) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EURODENEXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * T1.EURODENEXCHANGERATE / T1.EXCHANGERATE end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTOVARAFTERSTARTVIEW T1 UNION ALL SELECT T1.PARTITION,T1.RECID,9,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.EURODENCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE then T1.VALIDFROM else T1.STARTDATE end) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EURODENEXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * T1.EURODENEXCHANGERATE / (100.0 * (1.0 / (T1.EXCHANGERATE / 100.0))) end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEVARTODENAFTERSTARTVIEW T1 UNION ALL SELECT T1.PARTITION,T1.RECID,10,(CAST ((T1.EURODENCURRENCYCODE) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.FROMCURRENCYCODE) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE then T1.VALIDFROM else T1.STARTDATE end) AS DATETIME)) AS VALIDFROM,(CAST ((T1.VALIDTO) AS DATETIME)) AS VALIDTO,(CAST ((T1.EURODENEXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE when T1.EXCHANGERATE = 0.0 or T1.EURODENEXCHANGERATE = 0.0 then 0.0 else 100.0 * (100.0 * (1.0 / (T1.EXCHANGERATE / 100.0))) / T1.EURODENEXCHANGERATE end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEVARTODENAFTERSTARTVIEW T1 UNION ALL SELECT T1.PARTITION,T1.RECID,11,(CAST ((T1.CURRENCYCODE1) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE2) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.STARTDATE1 >= T1.STARTDATE2 then T1.STARTDATE1 else T1.STARTDATE2 end) AS DATETIME)) AS VALIDFROM,(CAST (('21541231') AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE1) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EXCHANGERATE2) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE1 when 0.0 then 0.0 else 100.0 * T1.EXCHANGERATE2 / T1.EXCHANGERATE1 end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTODENAFTERBOTHSTART T1 UNION ALL SELECT T1.PARTITION,T1.RECID,12,(CAST ((T1.CURRENCYCODE1) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE2) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE1 then T1.VALIDFROM else T1.STARTDATE1 end) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.STARTDATE2 then T1.VALIDTO else T1.STARTDATE2 - 1 end) AS DATETIME)) AS VALIDTO,(CAST ((T1.EURODENOMINATIONRATE1) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EURODENOMINATIONRATE1 when 0.0 then 0.0 else 100.0 * T1.EXCHANGERATE / T1.EURODENOMINATIONRATE1 end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTODENBETWEENSTART T1 WHERE ((((FROMCURRENCYCODE=EUROCURRENCYCODE) AND (TOCURRENCYCODE=CURRENCYCODE2)) AND (STARTDATE1<STARTDATE2)) AND (((((VALIDFROM<=STARTDATE1) AND (VALIDTO>=STARTDATE1)) OR ((VALIDFROM>=STARTDATE1) AND (VALIDTO<=STARTDATE2))) OR ((VALIDFROM<STARTDATE2) AND (VALIDTO>=STARTDATE2))) OR ((VALIDFROM<STARTDATE1) AND (VALIDTO>STARTDATE2)))) UNION ALL SELECT T1.PARTITION,T1.RECID,13,(CAST ((T1.CURRENCYCODE1) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE2) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE1 then T1.VALIDFROM else T1.STARTDATE1 end) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.STARTDATE2 then T1.VALIDTO else T1.STARTDATE2 - 1 end) AS DATETIME)) AS VALIDTO,(CAST ((T1.EURODENOMINATIONRATE1) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE when T1.EXCHANGERATE = 0.0 or T1.EURODENOMINATIONRATE1 = 0.0 then 0.0 else 100.0 * (100.0 * (1.0 / (T1.EXCHANGERATE / 100.0))) / T1.EURODENOMINATIONRATE1 end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTODENBETWEENSTART T1 WHERE ((((T1.FROMCURRENCYCODE=T1.CURRENCYCODE2 AND (T1.PARTITION = T1.PARTITION)) AND (T1.TOCURRENCYCODE=T1.EUROCURRENCYCODE AND (T1.PARTITION = T1.PARTITION))) AND (T1.STARTDATE1<T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION))) AND (((((T1.VALIDFROM<=T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>=T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION))) OR ((T1.VALIDFROM>=T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO<=T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)))) OR ((T1.VALIDFROM<T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>=T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)))) OR ((T1.VALIDFROM<T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION))))) AND NOT (EXISTS (SELECT 'x' FROM EXCHANGERATECURRENCYPAIR T2 WHERE (((T1.FROMCURRENCYCODE=T2.TOCURRENCYCODE AND (T1.PARTITION = T2.PARTITION)) AND (T1.TOCURRENCYCODE=T2.FROMCURRENCYCODE AND (T1.PARTITION = T2.PARTITION))) AND (T1.EXCHANGERATETYPE=T2.EXCHANGERATETYPE AND (T1.PARTITION = T2.PARTITION))))) UNION ALL SELECT T1.PARTITION,T1.RECID,14,(CAST ((T1.CURRENCYCODE1) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE2) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE2 then T1.VALIDFROM else T1.STARTDATE2 end) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.STARTDATE1 then T1.VALIDTO else T1.STARTDATE1 - 1 end) AS DATETIME)) AS VALIDTO,(CAST ((T1.EXCHANGERATE) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EURODENOMINATIONRATE2) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * T1.EURODENOMINATIONRATE2 / T1.EXCHANGERATE end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTODENBETWEENSTART T1 WHERE ((((FROMCURRENCYCODE=EUROCURRENCYCODE) AND (TOCURRENCYCODE=CURRENCYCODE1)) AND (STARTDATE1>STARTDATE2)) AND (((((VALIDFROM<=STARTDATE2) AND (VALIDTO>=STARTDATE2)) OR ((VALIDFROM>=STARTDATE2) AND (VALIDTO<=STARTDATE1))) OR ((VALIDFROM<STARTDATE1) AND (VALIDTO>=STARTDATE1))) OR ((VALIDFROM<STARTDATE2) AND (VALIDTO>STARTDATE1)))) UNION ALL SELECT T1.PARTITION,T1.RECID,15,(CAST ((T1.CURRENCYCODE1) AS NVARCHAR(3))) AS FROMCURRENCYCODE,(CAST ((T1.CURRENCYCODE2) AS NVARCHAR(3))) AS TOCURRENCYCODE,(CAST ((CASE when T1.VALIDFROM >= T1.STARTDATE2 then T1.VALIDFROM else T1.STARTDATE2 end) AS DATETIME)) AS VALIDFROM,(CAST ((CASE when T1.VALIDTO <= T1.STARTDATE1 then T1.VALIDTO else T1.STARTDATE1 - 1 end) AS DATETIME)) AS VALIDTO,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * (1.0 / (T1.EXCHANGERATE / 100.0)) end) AS NUMERIC(32,16))) AS EXCHANGERATE1,(CAST ((T1.EURODENOMINATIONRATE2) AS NUMERIC(32,16))) AS EXCHANGERATE2,(CAST ((CASE T1.EXCHANGERATE when 0.0 then 0.0 else 100.0 * T1.EURODENOMINATIONRATE2 / (100.0 * (1.0 / (T1.EXCHANGERATE / 100.0))) end) AS NUMERIC(32,16))) AS CROSSRATE,(CAST ((T1.EXCHANGERATETYPE) AS BIGINT)) AS EXCHANGERATETYPE FROM EXCHANGERATEDENTODENBETWEENSTART T1 WHERE ((((T1.FROMCURRENCYCODE=T1.CURRENCYCODE1 AND (T1.PARTITION = T1.PARTITION)) AND (T1.TOCURRENCYCODE=T1.EUROCURRENCYCODE AND (T1.PARTITION = T1.PARTITION))) AND (T1.STARTDATE1>T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION))) AND (((((T1.VALIDFROM<=T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>=T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION))) OR ((T1.VALIDFROM>=T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO<=T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)))) OR ((T1.VALIDFROM<T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>=T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION)))) OR ((T1.VALIDFROM<T1.STARTDATE2 AND (T1.PARTITION = T1.PARTITION)) AND (T1.VALIDTO>T1.STARTDATE1 AND (T1.PARTITION = T1.PARTITION))))) AND NOT (EXISTS (SELECT 'x' FROM EXCHANGERATECURRENCYPAIR T2 WHERE (((T1.FROMCURRENCYCODE=T2.TOCURRENCYCODE AND (T1.PARTITION = T2.PARTITION)) AND (T1.TOCURRENCYCODE=T2.FROMCURRENCYCODE AND (T1.PARTITION = T2.PARTITION))) AND (T1.EXCHANGERATETYPE=T2.EXCHANGERATETYPE AND (T1.PARTITION = T2.PARTITION)))))
