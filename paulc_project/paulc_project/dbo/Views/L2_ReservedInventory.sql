
CREATE view [dbo].[L2_ReservedInventory]
AS
select coalesce(salestableloc.intercompanycompanyid,inventtransloc.dataareaid) dataareaid, saleslineint.itemid, salestableloc.INVENTLOCATIONID, sum(case when inventtransloc.statusissue = 4 or inventtransloc.statusissue = 1 then (inventTransLoc.Qty * -1) else 0 end ) Reserved
			FROM dbo.inventTrans inventTransLoc
			left outer join dbo.inventTransOrigin inventTransOriginLoc on inventTransLoc.[partition] = inventTransOriginLoc.[partition] and inventTransLoc.dataareaid = inventTransOriginLoc.dataareaid and inventTransLoc.InventTransOrigin = inventTransOriginLoc.RecId 
			left outer join dbo.salesline saleslineint ON inventTransOriginLoc.[partition] = saleslineint.[partition] and inventTransOriginLoc.dataareaid = saleslineint.dataareaid and inventTransOriginLoc.INVENTTRANSID = saleslineint.InventTransId 
			left outer join dbo.salestable salesTableLoc ON saleslineint.[partition] = salestableloc.[partition] and saleslineint.dataareaid = salestableloc.dataareaid and substring(saleslineint.salesid,5,10) = salestableloc.intercompanyoriginalsalesid
			left outer join dbo.SalesLine salesLineLoc ON salesTableLoc.[partition] = saleslineloc.[partition] and salesTableLoc.dataareaid = saleslineloc.dataareaid and salesTableLoc.intercompanyoriginalsalesid = saleslineloc.salesid and saleslineloc.itemid = saleslineint.itemid
		WHERE  (inventtransloc.statusissue = 4 or inventtransloc.statusissue = 1)
		GROUP BY coalesce(salestableloc.intercompanycompanyid,inventtransloc.dataareaid), saleslineint.itemid,salestableloc.INVENTLOCATIONID
