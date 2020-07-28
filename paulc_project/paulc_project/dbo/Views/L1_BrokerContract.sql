CREATE view [L1_BrokerContract]
AS
SELECT  bcl.AccountCode									[AccountCode],
				bcl.AccountRelation								[AccountRelation],
				bct.BrokerId									[BrokerId],
				bct.DataAreaId									[DataAreaId],
				bct.[Partition]									[Partition],
				RANK() OVER (	PARTITION BY
								bcl.AccountCode,
								bcl.AccountRelation,
								bct.DataAreaId,
								bct.[Partition]
								ORDER BY
								bct.RecId			DESC,
								bcl.RecId			DESC	)	[RowRank]
		FROM	dbo.McrBrokerContractLine				bcl
		JOIN	dbo.McrBrokerContractTable				bct
		ON		bcl.ContractId = bct.ContractId
		AND		bcl.DataAreaId = bct.DataAreaId
		AND		bcl.[Partition] = bct.[Partition]
		
		WHERE	bcl.ItemCode = /*All=*/ 2
		AND		(	(bct.FromDate = '1900-01-01' AND bct.ToDate = '1900-01-01'	)	OR
					(GETDATE() BETWEEN bct.FromDate AND bct.ToDate				)	)