
-- =============================================
-- Author:		george.hyros@rolandfood.com
-- Create date: December 22, 2017
-- Description:	
--
-- Change Log:
-- 06/11/2018: Changed query to look for prices
--		relating to RFLL account C00145557. Also,
--		record every item's most-recently 
--		effective price so that we have a record
--		of every item in every month. Finally, 
--		execute insert only on the 1st day of 
--		each month to avoid excessive duplicate
--		data.
-- 05/29/2018: Changed insert filter criteria 
--		(WHERE NOT EXISTS clause) to reflect
--		target table's primary key
-- 05/23/2018: Changed query to look for prices 
--		relating to the NYLIST customer group
-- =============================================
CREATE PROCEDURE [dbo].[prLoadNyListPriceTrans] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF		DAY(GETDATE()) = 1								-- Only execute on the 1st of each month
	BEGIN

	INSERT	NyListPriceTrans
	SELECT	UPPER(pdt.DataAreaId)							[LegalEntity],
			pdt.ItemRelation								[ItemId],
			DATEADD(day, -1, dbo.Today())					[EffectiveDate],
			pdt.Amount										[Price],
			GETDATE()										[DateLoaded]
	FROM	(
		SELECT	DataAreaId,
				ItemRelation,
				FromDate,
				MAX(Amount)										[Amount],
				ItemCode,
				AccountCode
		FROM	dbo.PriceDiscTable						pdt0
		WHERE	ItemCode = /*Item=*/0
		AND		AccountCode = /*Group=*/0
		AND		AccountRelation = 'C00145557'
		AND		FromDate = (
			SELECT	MAX(FromDate)
			FROM	dbo.PriceDiscTable						pdt00
			WHERE	pdt00.AccountCode = pdt0.AccountCode
			AND		pdt00.AccountRelation = pdt0.AccountRelation
			AND		pdt00.ItemCode = pdt0.ItemCode
			AND		pdt00.ItemRelation = pdt0.ItemRelation
			AND		pdt00.DataAreaId = pdt0.DataAreaId
			AND		pdt00.FromDate < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) -- beginning of current month
		)
		GROUP
		BY		DataAreaId,
				ItemRelation,
				FromDate,
				ItemCode,
				AccountCode
	)														pdt
	WHERE	NOT EXISTS (
		SELECT	*
		FROM	NyListPriceTrans								lp
		WHERE	lp.LegalEntity = UPPER(pdt.DataAreaId)
		AND		lp.ItemId = pdt.ItemRelation
		AND		lp.EffectiveDate = dbo.Today()
	)
	END

END
