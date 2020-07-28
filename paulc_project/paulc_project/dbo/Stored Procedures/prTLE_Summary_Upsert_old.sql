


-- =============================================
-- Author:		Bryan D. Williams
-- Create date: 2020-04-27
-- Description:	Compare VP data in VP_tmpTLESummary to History
--				Upsert data to keep deleted lines
-- =============================================
CREATE PROCEDURE [dbo].[prTLE_Summary_Upsert_old]
AS
BEGIN
	SET NOCOUNT ON;


--INSERT NEW FIRST

DECLARE @VP_TB TABLE (EXECUTION_DATE DATETIME,PO_ID INT, PO_NUM varchar(220),UPSERT INT,primary key (execution_date,po_id,po_num))

BEGIN TRY

INSERT INTO @VP_TB 
SELECT [execution_date]
           ,[PO_ID]
           ,[PO_NUM], 0
FROM [Vp_tmpTLESummary]
WHERE cast(execution_date as varchar) + cast(po_id as varchar) + po_num not in (SELECT
cast(execution_date as varchar) + cast(po_id as varchar) + po_num 
FROM [Vp_tmpTLESummary_History])



INSERT INTO @VP_TB 
SELECT [execution_date]
           ,[PO_ID]
           ,[PO_NUM], 1
FROM [Vp_tmpTLESummary]
WHERE cast(execution_date as varchar) + cast(po_id as varchar) + po_num  in (SELECT
cast(execution_date as varchar) + cast(po_id as varchar) + po_num 
FROM [Vp_tmpTLESummary_History])



INSERT INTO [dbo].[Vp_tmpTLESummary_History]
           ([execution_date]
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
           ,[done_date])
		   SELECT
		[execution_date]
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
		   FROM [Vp_tmpTLESummary]
WHERE cast(execution_date as varchar) + cast(po_id as varchar) + po_num  in (SELECT
cast(execution_date as varchar) + cast(po_id as varchar) + po_num 
FROM @VP_TB where upsert = 0)

--UPDATE OLD

    UPDATE OLD SET
     OLD.[TP_Name] = NW.[TP_Name]
     ,OLD.[CUSTOMER_NUM] = NW.[CUSTOMER_NUM]
     ,OLD.[CUSTOMER_NAME] = NW.[CUSTOMER_NAME]
     ,OLD.[ORDER_ENTRY_DATE] = NW.[ORDER_ENTRY_DATE]
     ,OLD.[REQ_RECEIPT_DATE] = NW.[REQ_RECEIPT_DATE]
     ,OLD.[PO] = NW.[PO]
     ,OLD.[WSO] = NW.[WSO]
     ,OLD.[POA] = NW.[POA]
     ,OLD.[POC] = NW.[POC]
     ,OLD.[INV] = NW.[INV]
     ,OLD.[WSA] = NW.[WSA]
     ,OLD.[ASN] = NW.[ASN]
     ,OLD.[Num_Complete] = NW.[Num_Complete]
     ,OLD.[Num_Required] = NW.[Num_Required]
     ,OLD.[done_date] = NW.[done_date]
	 FROM  [Vp_tmpTLESummary_History] OLD INNER JOIN  [Vp_tmpTLESummary] NW
	 ON OLD.EXECUTION_DATE = NW.execution_date 
	 AND OLD.PO_ID = NW.PO_ID
	 AND OLD.PO_NUM = NW.PO_NUM
WHERE cast(old.execution_date as varchar) + cast(old.po_id as varchar) + old.po_num  in (SELECT
cast(execution_date as varchar) + cast(po_id as varchar) + po_num 
FROM @VP_TB WHERE UPSERT = 1)

END TRY
 
BEGIN CATCH
 	INSERT INTO [dbo].[DATA_LOAD_ERROR]
           ([ERROR_AREA]
		   ,[ERROR_SEVERITY]
           ,[ERROR_MESSAGE]
           ,[ERROR_DATETIME])
		SELECT  CAST(OBJECT_NAME(@@PROCID) AS NVARCHAR(50)),CAST(ERROR_SEVERITY() as NVARCHAR(2)),CAST(ERROR_MESSAGE() as NVARCHAR(2000)),GETDATE()
	
 
END CATCH


END