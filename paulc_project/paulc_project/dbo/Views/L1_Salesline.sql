
CREATE VIEW [dbo].[L1_Salesline]
AS
	SELECT	UPPER(sl.DataAreaId)		DataAreaId,
			sl.SalesId											[OrderNum],
			sl.ItemId											[ItemNum],
			itb.InventBatchId									[BatchNum],
			-1*itb.Qty											[CasesShipped],
			-1*itb.Qty * (citx.LineAmountUnitMst * sl.SalesQty / sl.QtyOrdered)	[InvoicePrice],
			CASE WHEN ISNULL(itb.DatePhysical, '1900-01-01') <> '1900-01-01'
				 THEN itb.DatePhysical
				 ELSE NULL
				 END											[ShippingDate],
			
			-1*itb.Qty * (
				CASE WHEN itm.PriceUnit <> 0
					 THEN itm.Price / itm.PriceUnit
					 ELSE 0.0
					 END
			)													[TotalCost],
			sl.InventTransId									[InventTransId],
			-1*itb.Qty											[QtyOrdered],
			-1*itb.Qty * ISNULL(citx.LineAmountUnit, CASE WHEN sl.QtyOrdered <> 0 THEN sl.LineAmount / sl.SalesQty ELSE NULL END) * sl.SalesQty / sl.QtyOrdered [InvoicePriceCur], -- Cannot divide by 0
		CASE itb.StatusIssue

				WHEN 0 THEN CASE itb.StatusReceipt
								 WHEN 0 THEN 'None'
								 WHEN 1 THEN 'Purchased'
								 WHEN 2 THEN 'Received'
								 WHEN 3 THEN 'Registered'
								 WHEN 4 THEN 'Arrived'
								 WHEN 5 THEN 'Ordered'
								 WHEN 6 THEN 'QuotationReceipt'
									    ELSE 'Unknown'
										END
				WHEN 1 THEN 'Sold'
				WHEN 2 THEN 'Deducted'
				WHEN 3 THEN 'Picked'
				WHEN 4 THEN 'ReservPhysical'
				WHEN 5 THEN 'ReservOrdered'
				WHEN 6 THEN 'OnOrder'
				WHEN 7 THEN 'QuotationIssue'
					   ELSE 'Unknown'
					   END										[InventStatus],
				rs.[Description]								[RolWmsReservedStatus],
				-1*itb.Qty * citx.SalesPriceUnit * citx.ExchRate [GrossAmountMST], sl.MODIFIEDDATETIME
	FROM		dbo.SalesLine								sl
	JOIN	L2_InventTransBatch itb
	ON		sl.[Partition] = itb.[Partition]
	AND		sl.DataAreaId = itb.DataAreaId
	AND		sl.InventTransId = itb.InventTransId
	
JOIN	AXEnums										rs
	ON		sl.rolWMSReservedStatus = rs.[Value]
	AND		rs.[Type] = 'rolWMSReservedStatus'
	LEFT
	JOIN	 dbo.L2_CustInvoiceTrans									citx
	ON		sl.[Partition] = citx.[Partition]
	AND		sl.DataAreaId = citx.DataAreaId
	AND		sl.InventTransId = citx.InventTransId
	LEFT
	JOIN	dbo.CustInvoiceJour						cij
	ON		citx.[Partition] = cij.[Partition]
	AND		citx.DataAreaId = cij.DataAreaId
	AND		citx.SalesId = cij.SalesId
	AND		citx.InvoiceId = cij.InvoiceId
	AND		citx.InvoiceDate = cij.InvoiceDate
	AND		citx.NumberSequenceGroup = cij.NumberSequenceGroup
	LEFT
	JOIN	dbo.InventTableModule						itm
	ON		sl.[Partition] = itm.[Partition]
	AND		sl.DataAreaId = itm.DataAreaId
	AND		sl.ItemId = itm.ItemId
	AND		itm.ModuleType = 2 /* Sales */
	






