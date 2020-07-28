
CREATE VIEW [dbo].[L4_SF_Inventory]
AS
SELECT ph.*, w.available,rq.reserved 
FROM 
( select entity,warehouseid, itemid,sum(PhysicalInventoryCases)physical from L1_Inventory where entity = 'RFLL'  group by entity,warehouseid,itemid) ph
LEFT OUTER JOIN
	(SELECT i.dataareaid,inventlocationid, itemid,sum(i.BALANCEQTY) as available FROM L2_Inventory i where dataareaid = 'RFLL'
		 group by i.dataareaid,inventlocationid,itemid) w on   ph.ItemId = w.ItemId and ph.entity = w.DataAreaId and ph.warehouseid = w.inventlocationid

LEFT OUTER JOIN
 (select itemid,inventlocationid, sum(reserved) reserved from L2_ReservedInventory group by dataareaid, inventlocationid,itemid) rq
	 on ph.ItemId = rq.ItemId  and ph.warehouseid = rq.inventlocationid

	
