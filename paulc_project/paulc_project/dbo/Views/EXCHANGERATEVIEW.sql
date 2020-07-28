﻿CREATE VIEW [dbo].[EXCHANGERATEVIEW] AS SELECT T1.FROMCURRENCYCODE AS FROMCURRENCYCODE,T1.TOCURRENCYCODE AS TOCURRENCYCODE,T1.EXCHANGERATETYPE AS EXCHANGERATETYPE,T1.PARTITION AS PARTITION,T1.RECID AS RECID,T2.PARTITION AS PARTITION#2,T2.EXCHANGERATE AS EXCHANGERATE,T2.VALIDFROM AS VALIDFROM,T2.VALIDTO AS VALIDTO,T3.PARTITION AS PARTITION#3 FROM EXCHANGERATECURRENCYPAIR T1 CROSS JOIN EXCHANGERATE T2 CROSS JOIN EXCHANGERATETYPE T3 WHERE (T1.RECID=T2.EXCHANGERATECURRENCYPAIR AND (T1.PARTITION = T2.PARTITION)) AND (T1.EXCHANGERATETYPE=T3.RECID AND (T1.PARTITION = T3.PARTITION))
