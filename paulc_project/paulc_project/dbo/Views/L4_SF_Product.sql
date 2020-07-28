











CREATE VIEW [dbo].[L4_SF_Product]
AS
with deduped_products as (-- add rank and row no to dedupe 
SELECT 
	   
	RANK() over (order by it.[DisplayProductNumber]) as rank_no
	,ROW_NUMBER() over (order by it.[DisplayProductNumber]) as row_no
	,it.[DisplayProductNumber]
      ,it.[Name]
      ,convert(decimal(10,2),it.[GrossDepth]) GrossDepth
      ,convert(decimal(10,2),it.[GrossHeight]) [GrossHeight]
      ,convert(decimal(10,2),it.[GrossWidth]) [GrossWidth]
      ,convert(decimal(10,2),it.[NetWeight]) [NetWeight]
      ,convert(decimal(10,2),it.[StandardPalletQuantity]) [StandardPalletQuantity]
      ,it.[PdsShelfLife]
      ,convert(decimal(10,2),it.[UnitVolume]) [UnitVolume]
      ,convert(decimal(10,2),it.[TaraWeight]) [TareWeight]
      ,convert(decimal(10,2),it.[QtyPerLayer]) [QtyPerLayer]
      ,it.[rolCartonMarking]
      ,it.[rolCartonMarkingsInner]
      ,it.[rolShipConditionsSell]
      ,it.[rolShipConditionsPurchase]
      ,it.[Intracode]
      ,it.[CreatedBy]
      ,it.[CreatedDatetime]
      ,it.[ModifiedBy]
      ,it.[ModifiedDatetime]
      ,it.[SupplierEngagementSpecialist]
      ,it.[BuyerName]
      ,it.[BuyerId]
      ,it.[StoppedPurch]
      ,it.[StoppedInvent]
      ,it.[StoppedSales]
      ,it.[PackType]
      ,it.[Category1]
      ,it.[Category2]
      ,convert(decimal(10,2),it.[Pack1]) [Pack1]
      ,convert(decimal(10,2),it.[Pack2]) [Pack2]
      ,convert(decimal(10,2),it.[StandardPackQty]) [StandardPackQty]
      ,it.[UnitDepth]
      ,it.[UnitHeight]
      ,it.[UnitWidth]
      ,convert(decimal(10,2),it.[rolDrainedWeight]) [rolDrainedWeight]
	  ,it.[UPC]
      ,it.[GTIN]
      ,it.[Discontinued]
	  ,it.UnitType
	,CASE it.QtyPerLayer
		WHEN 0 THEN NULL
				ELSE convert(decimal(10,2),it.QtyPerLayer)
				END								[BlockConfig],
	CASE WHEN it.StandardPalletQuantity <> 0
			AND  ISNULL(it.qtyPerLayer, 0) <> 0
			THEN convert(decimal(10,2),(it.StandardPalletQuantity / it.qtyPerLayer	))
			ELSE NULL END							[StackConfig]
		,convert(decimal(10,2),it.GrossWeight) GrossWeight
		,it.[BrandNum]
		,it.[BrandName]
		,it.[FreightClass]
		,it.SubItemId
		,it.SubstituteName
		,it.store_temp

FROM dbo.L2_Item it
where it.DisplayProductNumber not like '%RP1'  -- 4/20/2020 Sri: Remove RP1 aka repackaged items
)

SELECT 
	   -- it.[DataAreaId], -- dedupe products 
     it.[DisplayProductNumber]
      ,it.[Name]
      ,convert(decimal(10,2),it.[GrossDepth]) GrossDepth
      ,convert(decimal(10,2),it.[GrossHeight]) [GrossHeight]
      ,convert(decimal(10,2),it.[GrossWidth]) [GrossWidth]
      ,convert(decimal(10,2),it.[NetWeight]) [NetWeight]
      ,convert(decimal(10,2),it.[StandardPalletQuantity]) [StandardPalletQuantity]
      ,it.[PdsShelfLife]
      ,convert(decimal(10,2),it.[UnitVolume]) [UnitVolume]
      ,convert(decimal(10,2),it.[TareWeight]) [TareWeight]
      ,convert(decimal(10,2),it.[QtyPerLayer]) [QtyPerLayer]
      ,it.[rolCartonMarking]
      ,it.[rolCartonMarkingsInner]
      ,it.[rolShipConditionsSell]
      ,it.[rolShipConditionsPurchase]
      ,it.[Intracode]
      ,it.[CreatedBy]
      ,it.[CreatedDatetime]
      ,it.[ModifiedBy]
      ,it.[ModifiedDatetime]
      ,it.[SupplierEngagementSpecialist]
      ,it.[BuyerName]
      ,it.[BuyerId]
      ,it.[StoppedPurch]
      ,it.[StoppedInvent]
      ,it.[StoppedSales]
      ,it.[PackType]
      ,it.[Category1]
      ,it.[Category2]
      ,convert(decimal(10,2),it.[Pack1]) [Pack1]
      ,convert(decimal(10,2),it.[Pack2]) [Pack2]
      ,convert(decimal(10,2),it.[StandardPackQty]) [StandardPackQty]
      ,it.[UnitDepth]
      ,it.[UnitHeight]
      ,it.[UnitWidth]
      ,convert(decimal(10,2),it.[rolDrainedWeight]) [rolDrainedWeight]
	  ,it.[UPC]
      ,it.[GTIN]
      ,it.[Discontinued]
	  ,it.UnitType
	,CASE it.QtyPerLayer
		WHEN 0 THEN NULL
				ELSE convert(decimal(10,2),it.QtyPerLayer)
				END								[BlockConfig],
	CASE WHEN it.StandardPalletQuantity <> 0
			AND  ISNULL(it.qtyPerLayer, 0) <> 0
			THEN convert(decimal(10,2),(it.StandardPalletQuantity / it.qtyPerLayer	))
			ELSE NULL END							[StackConfig]
		,convert(decimal(10,2),it.GrossWeight) GrossWeight
		,it.[BrandNum]
		,it.[BrandName]
		,it.[FreightClass]
		,it.SubItemId
		,it.SubstituteName
		,it.store_temp

FROM deduped_products it
where rank_no=row_no -- select the the top row

