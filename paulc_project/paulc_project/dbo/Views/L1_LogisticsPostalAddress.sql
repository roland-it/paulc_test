-- =============================================
-- Author:		george.hyros@rolandfoods.com
-- Create date: March 23, 2020
-- Description:	L1 view of Logistics Postal Addresses
-- =============================================
CREATE VIEW dbo.L1_LogisticsPostalAddress
AS

	SELECT	lpa.*,
			lacrt.ShortName										COUNTRYREGIONNAME
	FROM	LogisticsPostalAddress								lpa
	LEFT
	JOIN	LogisticsAddressCountryRegionTranslation			lacrt
	ON		lpa.CountryRegionId = lacrt.CountryRegionId
	AND		'en-us' = lacrt.LanguageId
	
