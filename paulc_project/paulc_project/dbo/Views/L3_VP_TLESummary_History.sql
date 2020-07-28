



-- =============================================
-- Author:		Bryan D. Williams
-- Create date: 04/28/2020
-- Description:	Level 3 wrapper for VantagePoint
--	(VP) TLESummary History
-- Change Log:BDW 06/15/2020 Eliminate the 1899 records 
-- =============================================
CREATE VIEW [dbo].[L3_VP_TLESummary_History] 
AS 
    SELECT [execution_date]
			,[PO_ID]
			,[PO_NUM]
			,[TP_Name]
			,[CUSTOMER_NUM]
			,[CUSTOMER_NAME]
			,[ORDER_ENTRY_DATE]
			,[REQ_RECEIPT_DATE]
			,[PO]
			,[WSO]
			,[POA]
			,[POC]
			,[INV]
			,[WSA]
			,[ASN]
			,[Num_Complete]
			,[Num_Required]
			,[done_date]
	
		FROM [datarepo].[dbo].[L1_VP_TLESummary_History]
			WHERE YEAR(ORDER_ENTRY_DATE) > 1900



