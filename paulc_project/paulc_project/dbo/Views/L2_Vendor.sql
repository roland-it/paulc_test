







CREATE view [dbo].[L2_Vendor]
AS 
SELECT UPPER(vt.DataAreaId)									DataAreaId,
			vt.AccountNum									,
			vt.[Name]										[Name],
			vpa.Street,
			vpa.City										[City],
			vpa.[State]										[State],
			vpa.ZipCode										[Zip],
			vpa.COUNTRYREGIONID								[CountryRegionId],
			vpac.ShortName									[CountryName],
			--pc.ShortName									[CustomerReportingCountry],
			--CASE WHEN RTRIM(dpci.CountryRegionCode) <> '' 
			--	 THEN '+' + dpci.CountryRegionCode + ' ' 
			--	 ELSE '' 
			--	 END +
			--	+ dpci.Locator
			--	+ CASE WHEN RTRIM(dpci.LocatorExtension) <> '' 
			--	  THEN ', ' + dpci.LocatorExtension 
			--	  ELSE '' 
			--	  END										[CustomerPhone],
			vt.VendGroup,
			vt.KnownAs										[KnownAs],
			vpa.LocationName								[LocationName],
			vt.[CreatedDateTime],
			vt.ModifiedBy									[ModifiedBy],
			--dbo.UTCToEastern(vt.ModifiedDatetime)			[ModifiedDateTime],
			vt.[ModifiedDateTime],
			vt.Partition
		
 FROM L1_VENDOR vt 
LEFT OUTER
	JOIN	dbo.L2_DirPartyNamePrimaryAddressView		vpa
	ON		vt.Party = vpa.Party		
LEFT OUTER	JOIN	dbo.LogisticsAddressCountryRegionTranslation	vpac
	ON		vpa.CountryRegionId = vpac.CountryRegionId
	AND		vpac.LanguageId = 'en-us'







