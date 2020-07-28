Create view L1_UPC
AS
SELECT UPC.ItemId,
		UPC.itemBarCode,
		UPC.dataareaid,
		UPC.BarCodeSetupId	 FROM (SELECT 
		iib.ItemId,
		iib.itemBarCode,
		iib.dataareaid,
		iib.BarCodeSetupId	,			
		RANK() OVER (	PARTITION BY 
						iib.ItemId,
						iib.itemBarCode,
						iib.dataareaid,
						iib.BarCodeSetupId	 
						ORDER BY 
						iib.recid DESC	)	[RowRank]
		FROM dbo.inventitembarcode iib
		where iib.BARCODESETUPID='UPC'
	) UPC 
	WHERE UPC.RowRank=1