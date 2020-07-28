-- =============================================
-- Author:		Bryan D. Williams
-- Create date: 2020-02-23
-- Description:	Previous Price List information
-- BDW 04/04/2020 Added top 1  and order by to eliminate duplicates from previous prices.  
--	Need to check with dev team on logic used in AX 
-- =============================================
CREATE FUNCTION [dbo].[fnPreviousPriceList]
(	
	@item nvarchar(20), @customer nvarchar(20), @FROMDATE datetime
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT TOP 1 AMOUNT,FROMDATE,TODATE, ACCOUNTRELATION, ITEMRELATION FROM L2_PriceList WHERE @item=ITEMRELATION and @customer = ACCOUNTRELATION and @FROMDATE between FROMDATE AND TODATE
	ORDER BY FROMDATE ASC
)
