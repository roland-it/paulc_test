

-- =============================================
-- Author:		george.hyros@rolandfoods.com
-- Create date: March 20, 2020
-- Description:	Level 3 wrapper for VantagePoint
--	(VP) TLESummary information
-- Change Log:
--	GH 2020-04-10 Includes only most-recent execution date per PO ID/NUM
--	GH 2020-04-10 Excludes any PO NUM with the words go or live in it
-- =============================================
CREATE VIEW [dbo].[L3_VP_TLESummary] 
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
	FROM (
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
			,RANK() OVER (PARTITION BY PO_NUM ORDER BY execution_date DESC, PO_ID DESC) POExecutionRank	-- GH 2020-04-10 Rank PO's by most recent execution date
		FROM [datarepo].[dbo].[L1_VP_TLESummary]
		WHERE	PO_NUM NOT LIKE '%go%live%') tlesum			-- GH 2020-04-10 Exclude any PO_NUM with either go or live in it
	WHERE	POExecutionRank = 1								-- GH 2020-04-10 Only include the most recent execution date per PO

