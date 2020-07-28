

-- =============================================
-- Author:		george.hyros@rolandfoods.com
-- Create date: March 20, 2020
-- Description:	Level 4 wrapper for VantagePoint
--	(VP) TLESummary information
--
-- Change Log:
--	GH 2020-04-10 Filtered to only include most
--		recent execution date by PO ID/NUM
-- =============================================
CREATE VIEW [dbo].[L4_TB_TLESummary] 
AS 
    
	SELECT	[execution_date]
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
	FROM	[L3_VP_TLESummary_History]


