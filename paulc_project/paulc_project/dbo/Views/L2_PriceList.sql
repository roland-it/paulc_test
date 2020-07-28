



CREATE view [dbo].[L2_PriceList]
AS
SELECT
cus.Name [CustomerName],
enum.Name [Account Code],
pdt.ITEMRELATION,
pdt.ACCOUNTRELATION,
dim.INVENTLOCATIONID,
--Price Group
pdt.Currency,
pdt.UNITID,
it.Name [ItemDescription],
pdt.AMOUNT,
pdt.FROMDATE,
pdt.TODATE,
pdt.DATAAREAID,
pdt.ModifiedDatetime
FROM dbo.PriceDiscTable pdt--dbo.PRICEDISCADMTRANS PDAT 
INNER JOIN dbo.L1_Customer cus on pdt.ACCOUNTRELATION = cus.ACCOUNTNUM
INNER JOIN dbo.L1_Item it on pdt.ITEMRELATION = it.DisplayProductNumber 
INNER JOIN dbo.InventDim dim on pdt.INVENTDIMID = dim.INVENTDIMID and pdt.DATAAREAID = dim.DATAAREAID
INNER JOIN dbo.AXEnums enum ON enum.value = pdt.ACCOUNTCODE and enum.[Type] = 'AccountCode'





