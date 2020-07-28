
CREATE view [dbo].[L2_SalesOrder]
AS
SELECT 
	so.*,
	ware.InventLocationId [WarehouseNumber],
	ware.NAME [WarehouseName],
	ISNULL(so.deliveryname,'')                                        AS shiptodeliveryname,
     
     CASE
         WHEN CHARINDEX(',', del.street) > 0 THEN LTRIM(RTRIM(SUBSTRING(del.street, 1,CHARINDEX(',', del.street) - 1)))
         ELSE ISNULL(del.street,'')
      END                                                               AS shiptoadd1,
  
     CASE 
         WHEN CHARINDEX(',', del.street) > 0 THEN LTRIM(RTRIM(SUBSTRING(del.street,CHARINDEX(',', del.street) + 1,LEN(del.street) - CHARINDEX(',', del.street) + 1)))
         ELSE ''
      END                                                               AS shiptoadd2,

     ''                                                                 AS shiptoadd3,
     ISNULL(del.CITY,'')                                                AS shiptocity,
     ISNULL(del.STATE,'')                                               AS shiptostate,
     ISNULL(del.ZIPCODE,'')                                             AS shiptozip,
     ISNULL(del.COUNTRYREGIONID,'')                                     AS shiptocountry,
	 LTRIM(RTRIM(ISNULL(so.dlvmode,'')))                               AS carrierid,
     LTRIM(RTRIM(ISNULL(dlv.txt,'')))                                   AS carrierdesc,
	 	wxda.City											[CrossDockCity],
			so.rolCrossDockDeliveryName							[CrossDockName],
			wxda.[State]										[CrossDockState],
			wxda.ZipCode										[CrossDockZipCode],
			so.DlvTerm											[DeliveryTerms],
			so.DlvMode											[DeliveryMode],
			cij.InvoiceDate										[InvoiceDate],
			cij.InvoiceId										[InvoiceNum],
			so.CustAccount										[ShipAccount],
			so.CreatedDateTime				[CustomerOrderDate],
			CASE WHEN so.RolCreditHoldReleased <> 0
				 THEN 'Released'
				 WHEN so.RolOrderCreditHoldStopped <> 0
				 THEN 'Hold'
				 ELSE 'None'
				 END											[CreditHoldStatus],

			CASE so.ReceiptDateRequested
				WHEN '1900-01-01' THEN NULL
								  ELSE so.ReceiptDateRequested
								  END							[SOReceiptDateRequested],
		
	
				so.ROLWMSCONFIRMSTATUS							[WmsConfirmStatus]
FROM L1_SalesOrder so
LEFT OUTER JOIN [dbo].[L2_LOGISTICSPOSTALADDRESS] del on so.deliverypostaladdress = del.recid
LEFT OUTER JOIN [dbo].[L1_Warehouse] ware on so.InventLocationId = ware.InventLocationId
LEFT OUTER JOIN dbo.DLVMODE   dlv WITH (NOLOCK)    -- to obtain carrier description
         ON    so.dlvmode = dlv.code
           AND so.dataareaid    = dlv.dataareaid
		   AND so.PARTITION     = dlv.PARTITION
LEFT OUTER JOIN	[dbo].[L2_LOGISTICSPOSTALADDRESS]	wxda	ON		so.rolCrossdockDeliveryPostalAddress = wxda.RecId --xdoc warehouse
	LEFT OUTER
	JOIN	dbo.CustInvoiceJour						cij
	ON		so.[Partition] = cij.[Partition]
	AND		so.DataAreaId = cij.DataAreaId
	AND		so.SalesId = cij.SalesId
