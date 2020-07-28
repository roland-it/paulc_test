









CREATE view [dbo].[L2_Customer]
AS 
SELECT UPPER(ct.DataAreaId)							[LegalEntity],
			ct.AccountNum									,
			ct.[Name]										[Name],
			cpa.Street,
			cpa.City										[City],
			cpa.[State]										[State],
			cpa.ZipCode										[Zip],
			cpa.COUNTRYREGIONID								[COUNTRYREGIONID],
			cpac.ShortName									[CountryName],
			--pc.ShortName									[CustomerReportingCountry],
			ct.LOBName								[CategoryName], -- Not used in AX
			ct.LineOfBusinessId								[CategoryCode], -- Not used in AX
			ct.CompanyChainId								[ChainCode],    -- use Pepper.ERP_LKUP_CLNUP.dbo.erp_BI_Customer_Master
			ct.ChainName								[ChainName],	-- same as above
			--ddv.[DisplayValue]								[ChannelCode],  -- use ProdDbo customer channel => AX FD channel map
			--dft.[Description]								[ChannelName],
			--pc.ShortName									[CountryRegion],
			ct.SubsegmentId									[DivisionCode],	-- use Pepper.ERP_LKUP_CLNUP.dbo.erp_BI_Customer_Master
			ct.SubsegmentDescription						[DivisionName],
			mcp.[Name]										[ManagerName],	-- use Pepper.ERP_LKUP_CLNUP.dbo.erp_customer_account_managers - if not found, may have to attempt lookup by legacy manager code's name.
			bpa.City										[BrokerCity],
			bc.BrokerId										[BrokerNum],
			bpa.[Name]										[BrokerName],
			bpa.[State]										[BrokerState],
			bpa.ZipCode										[BrokerZip],
			bc.BrokerId										[BrokerId],
			--sdg.[Description]								[StateRegion],	-- use Pepper.ERP_LKUP_CLNUP.dbo.erp_BI_Customer_Master - maybe. currently sales district is reflected in metro region.
			iap.[Name]										[InsideAccountManager],
			ct.InvoiceAccount								[InvoiceAccount],
			iapa.[Name]										[InvoiceAccountName],
			--CASE WHEN RTRIM(dpci.CountryRegionCode) <> '' 
			--	 THEN '+' + dpci.CountryRegionCode + ' ' 
			--	 ELSE '' 
			--	 END +
			--	+ dpci.Locator
			--	+ CASE WHEN RTRIM(dpci.LocatorExtension) <> '' 
			--	  THEN ', ' + dpci.LocatorExtension 
			--	  ELSE '' 
			--	  END										[CustomerPhone],
			ct.KnownAs										[KnownAs],
			cpa.LocationName								[LocationName],
			ct.CustGroup									,
			ct.Currency										[Currency],
			ct.PaymTermId									[PaymTermId],
			ct.DLVMODE										[DlvMode],
			ct.DLVTERM										[DlvTerm],
			--dbo.UTCToEastern(ct.RFLL_CUSTOMERSINCE)			[RFLL_CustomerSince],
			ct.[RFLL_CustomerSince],
			ct.ROLCLOSEDDATE								[RolClosedDate],
			ct.INVENTLOCATION								[InventLocationCode],
			loc.name										[InventLocationName],
			--dbo.UTCToEastern(ct.CreatedDatetime)			[CreatedDateTime],
			ct.[CreatedDateTime],
			ct.ModifiedBy									[ModifiedBy],
			--dbo.UTCToEastern(ct.ModifiedDatetime)			[ModifiedDateTime],
			ct.[ModifiedDateTime],
			pt.description									[PaymTermDesc],
			ct.rolAlwaysHoldSO								[rolAlwaysHoldSO],
			ct.lineofbusinessid,
			ct.LOBName,
			ddv.[DisplayValue]								[ChannelCode],  -- use ProdDbo customer channel => AX FD channel map
			dft.[Description]								[ChannelName],
			sdg.[Description]								[SalesDistrict],
			ct.Party,
			ct.PARTITION
 FROM L1_CUSTOMER ct 
 INNER JOIN L2_CUSTOMER_PRIMARY_LEGAL_ENTITY PL on ct.ACCOUNTNUM = PL.ACCOUNTNUM and ct.DATAAREAID = PL.DATAAREAID
LEFT OUTER JOIN dbo.L2_BrokerContract bc
ON		bc.AccountRelation =
				CASE bc.AccountCode 
				WHEN /*Table=*/ 0 THEN ct.AccountNum
				WHEN /*Group=*/ 1 THEN ct.CustGroup
				WHEN /*All=*/   2 THEN bc.AccountRelation
				END
	AND		ct.DataAreaId = bc.DataAreaId
	AND		ct.[Partition] = bc.[Partition]
LEFT OUTER JOIN 
	dbo.VendTable							bvt
	ON		bc.BrokerId = bvt.AccountNum
	AND		bc.DataAreaId = bvt.DataAreaId
	AND		bc.[Partition] = bvt.[Partition]

LEFT OUTER
	JOIN	dbo.L2_DirPartyNamePrimaryAddressView		bpa
	ON		bvt.Party = bpa.Party		
	LEFT OUTER
	JOIN	L1_CUSTOMER						ia
	ON		ct.InvoiceAccount = ia.AccountNum
	AND		ct.DataAreaId = ia.DataAreaId
	LEFT OUTER
	JOIN	dbo.L2_DirPartyNamePrimaryAddressView		iapa
	ON		ia.Party = iapa.Party		
	LEFT OUTER
	JOIN	dbo.HcmWorker							mcw
	ON		ct.MainContactWorker = mcw.RecId
	LEFT OUTER
	JOIN	dbo.DirPartyTable						mcp
	ON		mcw.Person = mcp.RecId
	LEFT OUTER
	JOIN	dbo.HcmWorker							iamw
	ON		ct.rolInsideAccountManager = iamw.RecId
	LEFT OUTER
	JOIN	dbo.DirPartyTable						iap
	ON		iamw.Person = iap.RecId
	LEFT OUTER
	JOIN	dbo.L2_DirPartyNamePrimaryAddressView		cpa
	ON		ct.Party = cpa.Party
		
LEFT OUTER	JOIN	dbo.LogisticsAddressCountryRegionTranslation	cpac
	ON		cpa.CountryRegionId = cpac.CountryRegionId
	AND		cpac.LanguageId = 'en-us'
	LEFT
	JOIN	dbo.InventLocation loc 
	on		ct.InventLocation=loc.InventLocationId 
	and		ct.DATAAREAID=loc.DATAAREAID
	LEFT
	JOIN	dbo.PaymTerm pt 
	on		ct.PaymTermid= pt.paymTermId 
	and		ct.dataareaid=pt.dataareaid
	LEFT
	JOIN	dbo.DefaultDimensionView				ddv
	ON		ct.DefaultDimension = ddv.DefaultDimension
	AND		ddv.ReportColumnName = 'C'
	LEFT
	JOIN	dbo.DimensionFinancialTag				dft
	ON		ddv.EntityInstance = dft.RecId

	
	LEFT
	JOIN	dbo.smmBusRelSalesDistrictGroup		sdg
	ON		ct.SalesDistrictId = sdg.SalesDistrictId
	AND		ct.DataAreaId = sdg.DataAreaId
	AND		ct.[Partition] = sdg.[Partition]






