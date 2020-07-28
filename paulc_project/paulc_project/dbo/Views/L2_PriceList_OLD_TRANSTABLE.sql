



CREATE view [dbo].[L2_PriceList_OLD_TRANSTABLE]
AS
SELECT
cus.Name [CustomerName],
enum.Name [Account Code],
PDAT.ITEMRELATION,
PDAT.ACCOUNTRELATION,
dim.INVENTLOCATIONID,
--Price Group
PDAT.Currency,
PDAT.UNITID,
it.Name [ItemDescription],
PDAT.AMOUNT,
PDAT.FROMDATE,
PDAT.TODATE,
PDAT.DATAAREAID,
PDAT.ModifiedDatetime
FROM dbo.PRICEDISCADMTRANS PDAT 
INNER JOIN dbo.L1_Customer cus on PDAT.ACCOUNTRELATION = cus.ACCOUNTNUM
INNER JOIN dbo.L1_Item it on PDAT.ITEMRELATION = it.DisplayProductNumber 
INNER JOIN dbo.InventDim dim on PDAT.INVENTDIMID = dim.INVENTDIMID and PDAT.DATAAREAID = dim.DATAAREAID
INNER JOIN dbo.AXEnums enum ON enum.value = PDAT.ACCOUNTCODE and enum.[Type] = 'AccountCode'




