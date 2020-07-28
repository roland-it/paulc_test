create view L2_InventTransBatch
AS
SELECT	ito.InventTransId									[InventTransId],
				SUM(itx.Qty)										[Qty],
				id.InventBatchId									[InventBatchId],
				ito.DataAreaId										[DataAreaId],
				ito.[Partition]										[Partition],
				itx.StatusIssue										[StatusIssue],
				itx.StatusReceipt									[StatusReceipt],
				MAX(itx.DatePhysical)								[DatePhysical],
				SUM(itx.CostAmountPhysical)							[CostAmountPhysical]--,
		FROM	dbo.InventTransOrigin ito
		JOIN	dbo.InventTrans itx ON ito.RecId = itx.InventTransOrigin
		JOIN	dbo.InventDim id ON itx.[Partition] = id.[Partition] AND itx.DataAreaId = id.DataAreaId AND itx.InventDimId = id.InventDimId 
		WHERE	ito.ReferenceCategory = 0 /* Sales */
		AND		itx.PackingSlipReturned = 0 /* No */
		GROUP
		BY		ito.InventTransId,	
				id.InventBatchId,
				ito.DataAreaid,
				ito.[Partition],
				itx.StatusIssue,
				itx.StatusReceipt