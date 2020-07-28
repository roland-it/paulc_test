

-- adding previous price columns
create VIEW [dbo].[L4_SF_PriceList_NY_old]
AS
SELECT 
	distinct  
		L3_PriceList_NY.*
		, prev.Amount[PreviousAmount]
		, prev.FromDate[PreviousFromDate]
		, prev.ToDate[PreviousToDate]
	FROM    L3_PriceList_NY  
	CROSS apply 
	-- Generate previous prices
		dbo.fnPreviousPriceList(
			L3_PriceList_NY.itemrelation
			, L3_PriceList_NY.accountrelation
			, dateadd(day, - 1, L3_PriceList_NY.FROMDATE)
		) prev
	WHERE
		GETDATE() BETWEEN L3_PriceList_NY.FROMDATE AND L3_PriceList_NY.TODATE

