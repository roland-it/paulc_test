-- =============================================
-- Author:		george.hyros@rolandfood.com
-- Create date: December 22, 2017
-- Description:	
-- =============================================
CREATE VIEW [dbo].[Tableau_L2_NyPriceList]
AS

SELECT	lp.LegalEntity + '-' +
			lp.ItemId + '-' +
			CONVERT(NVARCHAR, lp.EffectiveDate, 101)		[ny_list_id],									-- int
		lp.LegalEntity										[Legal Entity],
		lp.ItemId											[item_num_5],									-- nvarchar(20)
		lp.Price											[list_price_dol],								-- decimal(38,16)
		lp.EffectiveDate									[effective_period],								-- datetime
		pm.Name										[item_desc],
		pm.StandardPackQty									[standard_pack_qty],
		--pm.CasesPerPalletQty								[case_per_pallet_qty],
		--pm.Volume											[cubic_volume_inch],
		--pm.GrossWeight										[freight_wt],
		pm.Pack1											[purchasing_pack1],
		pm.Pack2											[purchasing_pack2],
		pm.StoppedInvent									[Stopped (Invent)],
		pm.StoppedPurch										[Stopped (Purchasing)],
		pm.StoppedSales										[Stopped (Sales)],	  
		pm.PackType											[purchasing_pack_unit_type],
		pm.BuyerName										[buyer_name],
		--pm.BlockConfig										[block_config],
		--pm.StackConfig										[stack_config],
		lp.DateLoaded										[date_loaded],					-- datetime
		pm.Category1									[product_category_1],
		pm.Category2									[product_category_2]
FROM	dbo.NyListPriceTrans									lp
JOIN	dbo.L2_Item										pm
ON		lp.LegalEntity = pm.DataAreaId
AND		lp.ItemId = pm.DisplayProductNumber
WHERE	lp.LegalEntity = 'RFLL'
