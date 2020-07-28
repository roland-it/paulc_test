

CREATE VIEW [dbo].[L1_InventItemBarcode]
As
SELECT  [ITEMBARCODE]
      ,[ITEMID]
      ,[INVENTDIMID]
      ,[BARCODESETUPID]
      ,[USEFORPRINTING]
      ,[USEFORINPUT]
      ,[DESCRIPTION]
      ,[QTY]
      ,[UNITID]
      ,[RETAILVARIANTID]
      ,[RETAILSHOWFORITEM]
      ,[BLOCKED]
      ,[MODIFIEDDATETIME]
      ,[DEL_MODIFIEDTIME]
      ,[MODIFIEDBY]
      ,[DATAAREAID]
      ,[RECVERSION]
      ,[PARTITION]
      ,[RECID]
      ,[RFLL_OVERRIDE]
	FROM	dbo.InventItemBarcode iib
	

