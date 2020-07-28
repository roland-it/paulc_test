




/*
Combine PurchTable and PurchLine with selected fields.
Used by:
	[dbo].[prLoadCostHistoryTrans] 

*/
CREATE view  [dbo].[L2_PurchaseOrders]
as
select 
	pl.ItemId	
	,pl.PurchId	
	,pl.PurchPrice
	,pt.CurrencyCode				
	,pt.InventLocationId	
	,pt.ConfirmedDlv
	,pt.DataAreaId
	,pt.rolLandedCostDoneStatus
	,pt.ExchangeRateDate
	,pt.PARTITION
	,pt.PURCHSTATUS
	,pt.createddatetime
	,L1V.Name
FROM	dbo.PurchLine		pl
	JOIN	dbo.PurchTable		pt
	ON		pl.[Partition] = pt.[Partition]
	AND		pl.DataAreaId = pt.DataAreaId
	AND		pl.PurchId = pt.PurchId
	JOIN	L1_Vendor L1V
	ON		L1V.ACCOUNTNUM = PT.ORDERACCOUNT

