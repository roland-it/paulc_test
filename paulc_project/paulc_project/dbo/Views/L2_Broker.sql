








CREATE view [dbo].[L2_Broker]
AS 
SELECT bvt.*,bc.AccountCode, bc.AccountRelation, bc.BrokerId
		
 FROM L2_VENDOR bvt
		LEFT JOIN dbo.L2_BrokerContract bc
	ON		 bvt.AccountNum = bc.BrokerId
	AND		bvt.DataAreaId = bc.DataAreaId
	AND		bvt.[Partition] = bc.[Partition]
	where bvt.Vendgroup = 'SalesBrkr' -- GROUP FOR BROKER
	








