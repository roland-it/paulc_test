﻿/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW L1_VP_POStatus AS
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
  FROM [datarepo].[dbo].[L1_VP_POStatus_History]