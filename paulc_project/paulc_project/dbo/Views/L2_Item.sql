












CREATE view [dbo].[L2_Item]
AS
SELECT  UPPER(ISNULL(it.DataAreaId, ''))			DataAreaId,
			i.DisplayProductNumber				,
			i.[Name]								,
		   it.GrossDepth								,
			it.GrossHeight								,
			it.GrossWidth								,
			it.NetWeight								,
			it.StandardPalletQuantity					,
			it.PdsShelfLife								,
			it.UnitVolume							,
			 it.TaraWeight	,			
			it.QtyPerLayer,
			it.rolCartonMarking							[rolCartonMarking],
			it.rolCartonMarkingsInner						[rolCartonMarkingsInner],
			it.rolShipConditionsSell						[rolShipConditionsSell],
			it.rolShipConditionsPurchase					[rolShipConditionsPurchase],
			it.Intracode									[Intracode],
			it.CreatedBy									[CreatedBy],
			it.CreatedDatetime			[CreatedDatetime],
			it.ModifiedBy									[ModifiedBy],
			it.ModifiedDatetime			[ModifiedDatetime],
			it.RFLI_SUPENGAGEMENTSPECID						[SupplierEngagementSpecialist],
			ibg.[Description]							[BuyerName],
			ibg.Group_									[BuyerId],
			CASE iips.[Stopped] WHEN 0 THEN 'No' 
									   ELSE 'Yes' END	[StoppedPurch],
			CASE iiis.[Stopped] WHEN 0 THEN 'No' 
									   ELSE 'Yes' END	[StoppedInvent],
			CASE iiss.[Stopped] WHEN 0 THEN 'No' 
									   ELSE 'Yes' END	[StoppedSales],
			itm.UnitId									[PackType],
			
			ic.Category1								,
			ic.Category2								,
			ISNULL(ipk.pack1, 1)							[Pack1],
			ISNULL(ipk.pack2, 1)							[Pack2],
			ISNULL(ipk.standard_pack, 1)					[StandardPackQty],
			wpdu.Depth									[UnitDepth],
			wpdu.Height									[UnitHeight],
			wpdu.Width									[UnitWidth],
			it.rolDrainedWeight	,
			iib.itembarcode UPC,
			iig.[GLOBALTRADEITEMNUMBER] GTIN,
		    CASE WHEN iips.[Stopped] + iiis.[Stopped] + iiss.[Stopped] > 0 THEN 'Yes' 
									   ELSE 'No' END	Discontinued,
			ddv.DisplayValue							[BrandNum],
			dft.[Description]							[BrandName],
			cast(it.rolFreightClass as varchar(50))										[FreightClass],
			sub.DisplayProductNumber SubItemId,
			sub.SubstituteName,
			it.RFLI_UNITOFMEASURE UnitType,
			isnull(it.TARAWEIGHT,0) + isnull(it.NETWEIGHT,0) GrossWeight,
			cast('0.00' as varchar(32)) store_temp
FROM L1_InventTable it 
INNER JOIN L1_Item i on i.RecId = it.Product
LEFT
	JOIN	dbo.InventBuyerGroup ibg
	ON		it.ItemBuyerGroupId = ibg.Group_
	AND		it.DataAreaId = ibg.DataAreaId
	LEFT
	JOIN	dbo.InventItemInventSetup iiis
	ON		it.ItemId = iiis.ItemId
	AND		it.DataAreaId = iiis.DataAreaId
	AND		iiis.InventDimId = 'AllBlank'
	LEFT
	JOIN	dbo.InventItemLocation iil
	ON		it.ItemId = iil.ItemId
	AND		it.DataAreaId = iil.DataAreaId
	AND		iil.InventDimId = 'AllBlank'
	LEFT
	JOIN	dbo.InventItemPurchSetup iips
	ON		it.ItemId = iips.ItemId
	AND		it.DataAreaId = iips.DataAreaId
	AND		iips.InventDimId = 'AllBlank'
	LEFT
	JOIN	dbo.InventItemSalesSetup iiss
	ON		it.ItemId = iiss.ItemId
	AND		it.DataAreaId = iiss.DataAreaId
	AND		iiss.InventDimId = 'AllBlank'
	LEFT
	JOIN	dbo.InventTableModule itm
	ON		it.ItemId = itm.ItemId
	AND		it.DataAreaId = itm.DataAreaId
	AND		itm.ModuleType = 0
	LEFT
	JOIN	dbo.L1_ItemCategory	 ic
	ON		it.ItemId = ic.ItemId
	LEFT
	JOIN	dbo.L2_ItemPack			ipk
	ON		it.ItemId = ipk.item_num
	LEFT
	JOIN	dbo.WhsPhysDimUom wpdu
	ON		it.ItemId = wpdu.ItemId
	AND		it.DataAreaId = wpdu.DataAreaId
	AND		wpdu.Uom = 'Each'
	LEFT
	JOIN	dbo.L1_UPC iib
	ON		it.ItemId = iib.ItemId
	AND		it.DataAreaId = iib.DataAreaId
	AND		iib.BARCODESETUPID = 'UPC'
	LEFT
	JOIN	dbo.L1_GTIN iig
	ON		it.ItemId = iig.ItemId
	AND		it.DataAreaId = iig.DataAreaId
	and		itm.UNITID = iig.UNITID
	LEFT
	JOIN	dbo.DefaultDimensionView ddv
	ON		it.DefaultDimension = ddv.DefaultDimension
	AND		ddv.ReportColumnName = 'B'
	LEFT
	JOIN	dbo.DimensionFinancialTag dft
	ON		ddv.EntityInstance = dft.RecId
	LEFT
	JOIN dbo.L2_SubstituteItem sub
	on it.PRODUCT = sub.Product












