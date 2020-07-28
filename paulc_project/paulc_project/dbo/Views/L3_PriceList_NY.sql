



/*
Only have the highest previous date to meet requirements and make the L4 list unique per item
*/
CREATE view [dbo].[L3_PriceList_NY]
AS
SELECT
* 
FROM
dbo.L2_PriceList
WHERE ACCOUNTRELATION = 'C00145557'
AND DATAAREAID = 'ARFC'




