
create view [dbo].[L2_LogisticsPostalAddress]	
AS
SELECT * FROM dbo.LOGISTICSPOSTALADDRESS	
WHERE (ValidFrom = '1/1/1900' AND ValidTo = '1/1/1900')	OR
			(GETUTCDATE() BETWEEN ValidFrom AND ValidTo)	
