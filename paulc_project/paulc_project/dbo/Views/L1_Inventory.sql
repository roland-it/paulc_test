
CREATE VIEW [dbo].[L1_Inventory]
AS
SELECT
	isum.DATAAREAID Entity,
	isum.ITEMID ItemId,
	id.INVENTLOCATIONID WarehouseId,
	id.WMSLOCATIONID LocationId,
	id.INVENTBATCHID BatchId,

	--isum.AVAILPHYSICAL AvailablePhysicalInventoryCases,
	--isum.RESERVPHYSICAL ReservedPhysicalInventoryCases,

	isum.PHYSICALINVENT PhysicalInventoryCases,
	ib.PDSDISPOSITIONCODE DispositionCode,
	convert(date,ib.PDSFINISHEDGOODSDATETESTED) FinishedGoodsDateTested,
	
	convert(date,ib.PRODDATE) ProductionDate,
	convert(date,ib.EXPDATE) ExpirationDate,
	convert(date,ib.PDSBESTBEFOREDATE) BestBeforeDate,
	
	ib.PDSVENDBATCHID VendorBatchId,
	convert(date,ib.PDSVENDBATCHDATE) VendorProductionDate,
	convert(date,ib.PDSVENDEXPIRYDATE) VendorExpirationDate,
	
	ib.ROLCUSTOMSAQI CustomsAgriculturalExamination,
	ib.ROLCUSTOMSINTENSIVE CustomsIntensive,
	ib.ROLCUSTOMSOTHER CustomsOther,
	ib.ROLCUSTOMSVACUS CustomsVehicleandCargoInspection,
	ib.ROLFDA FDA,
	ib.ROLUSDAGRADING USDAGrading


from
	dbo.INVENTSUM isum
	INNER JOIN dbo.INVENTDIM id on id.INVENTDIMID = isum.INVENTDIMID and id.DATAAREAID = isum.DATAAREAID
	INNER JOIN dbo.INVENTITEMGROUPITEM gi on isum.ITEMID = gi.ITEMID and isum.DATAAREAID = gi.ITEMDATAAREAID
	LEFT OUTER JOIN dbo.INVENTBATCH ib on isum.ITEMID = ib.ITEMID and id.INVENTBATCHID = ib.INVENTBATCHID and isum.DATAAREAID = ib.DATAAREAID
	WHERE gi.ITEMGROUPID != 'EXP'
