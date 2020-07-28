CREATE function  [dbo].[fnAXInventory]
(

 @asOnDate DATETIME = '2020-02-01',
 @DataAreaID varchar(10) = 'RFLL',
 @ItemId varchar(20) = NULL,
 @Size varchar(20) = '200'
)
RETURNS TABLE 
AS
RETURN 
(
	
Select onHand.ITEMID, onHand.NAME, onHand.UNITID ,
 onHand.INVENTSIZEID, onHand.INVENTCOLORID,
 case 
 when oBal.OPBAL_QTY is null then 0
 else oBal.OPBAL_QTY
 end as BALANCEQTY, @DataAreaID DataAreaID, oBal.INVENTLOCATIONID
from 
(
 select a.ITEMID, b.NAME, c.UNITID, e.INVENTSIZEID, e.INVENTCOLORID, e.INVENTLOCATIONID
 from dbo.INVENTTABLE as a
 left join dbo.L1_Item b on a.ITEMID = b.DisplayProductNumber
 left join dbo.INVENTTABLEMODULE c on a.ITEMID = c.ITEMID and c.MODULETYPE = 0
 inner join 
 (
 select iSum.ITEMID, iDim.INVENTSIZEID, iDim.INVENTCOLORID, iDim.INVENTLOCATIONID
 from INVENTSUM as iSum 
 inner join dbo.INVENTDIM as iDim on iDim.INVENTDIMID = iSum.INVENTDIMID
 where iSum.DATAAREAID = @DataAreaID and iDim.DATAAREAID = @DataAreaID 
 group by iSum.ITEMID, iDim.INVENTSIZEID, iDim.INVENTCOLORID, iDim.INVENTLOCATIONID
 ) as e on e.ITEMID = a.ITEMID
 where a.DATAAREAID = @DataAreaID and c.DATAAREAID = @DataAreaID and (@itemid is null or (@ItemId is not null and a.ITEMID = @ItemId))
) as onHand

--Get opening balance
left join 
(
 Select iTrans.ITEMID, iDim.INVENTSIZEID, iDim.INVENTCOLORID, iDim.INVENTLOCATIONID, sum(iTrans.QTY) as OPBAL_QTY
 from INVENTTRANS as iTrans 
 inner join dbo.INVENTDIM as iDim on iDim.INVENTDIMID = iTrans.INVENTDIMID
 where iTrans.DATAAREAID = @DataAreaID and iDim.DATAAREAID = @DataAreaID and
 ((iTrans.DATEINVENT <> '' and iTrans.DATEINVENT <= @asOnDate) OR
 (iTrans.DATEINVENT = '' and iTrans.DATEPHYSICAL <> '' and iTrans.DATEPHYSICAL <= @asOnDate))
 group by iTrans.ITEMID, iDim.INVENTSIZEID, iDim.INVENTCOLORID, iDim.INVENTLOCATIONID
) as oBal on oBal.ITEMID = onHand.ITEMID and 
 oBal.INVENTSIZEID = onHand.INVENTSIZEID and obal.INVENTCOLORID = onHand.INVENTCOLORID and obal.INVENTLOCATIONID = onHand.INVENTLOCATIONID
)