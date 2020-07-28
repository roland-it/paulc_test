create view L2_CustInvoiceTrans
AS
SELECT	citx.NumberSequenceGroup,
				citx.InvoiceDate InvoiceDate,
				citx.InvoiceId InvoiceId,
				citx.CurrencyCode,
				citx.SalesId SalesId,
				citx.InventTransId InventTransId,
				SUM(citx.InventQty) InventQty,
				SUM(citx.Qty) InvoiceQty,
				AVG(citx.SalesPrice) SalesPriceUnit,
				AVG(CASE WHEN citx.SalesPrice = 0 THEN 0
						 WHEN citx.LineAmount = 0 THEN 0
						 ELSE citx.SalesPrice * citx.LineAmountMST / citx.LineAmount END) SalesPriceUnitMST, -- Cannot divide by zero
				AVG(citx.LineAmount / citx.Qty) LineAmountUnit, -- Cannot divide by zero
				AVG(citx.LineAmountMST / citx.Qty) LineAmountUnitMST, -- Cannot divide by zero
				AVG(ISNULL(er.ExchangeRate, 1)) ExchRate,
				citx.DataAreaId,
				citx.[Partition]
		FROM	dbo.CustInvoiceTrans citx
		JOIN	dbo.CustInvoiceJour cij ON citx.NumberSequenceGroup = cij.NumberSequenceGroup AND citx.InvoiceDate = cij.InvoiceDate AND citx.InvoiceId = cij.InvoiceId AND citx.SalesId = cij.SalesId AND citx.DataAreaId = cij.DataAreaId AND citx.[Partition] = cij.[Partition]
		JOIN	L1_ExchangeRate er ON DATEADD(day, -1, cij.InvoiceDate) BETWEEN er.ValidFrom AND er.ValidTo AND cij.CurrencyCode = er.FromCurrencyCode AND cij.[Partition] = er.[Partition]
		WHERE	citx.Qty <> 0
		GROUP
		BY		citx.NumberSequenceGroup,
				citx.InvoiceDate,
				citx.InvoiceId,
				citx.CurrencyCode,
				citx.SalesId,
				citx.InventTransId,
				citx.DataAreaId,
				citx.[Partition]