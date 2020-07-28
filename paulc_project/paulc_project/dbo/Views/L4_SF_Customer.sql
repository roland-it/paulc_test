



/*
* BDW - 04/06/2020 -- Add Logic to match names in SalesForce that are not in AX 
*	Currently only one Yuqin Gambardella -> Shirley Xu
*/

CREATE view [dbo].[L4_SF_Customer]
as
select distinct
c.BrokerId,
c.BrokerName,
c.Name,
c.invoiceAccount,
c.KnownAs,
c.LegalEntity,
c.AccountNum,
c.LocationName,
c.City,
c.State,
c.Zip,
c.Street,
c.CountryRegionId,
c.CountryName,
c.DlvTerm,
c.DlvMode,
CASE
	WHEN c.InsideAccountManager = 'CATHIE BANNON' 
	THEN 'Cathie Brannon'
	ELSE c.InsideAccountManager
END InsideAccountManager,
c.ChainCode,
c.ChainName,
c.LineOfBusinessId,
c.LobName,
c.ModifiedDateTime,
--Primary_Address City
--Primary_Address Country
--Primary_Address State
--Primary_Address Zip Code
--Primary_Contact Phone
--Street1
--Street2
--Street3
--Delivery Terms
--Mode of Delivery
c.DivisionCode,
c.DivisionName,
c.InventLocationCode [Warehouse Code],
c.InventLocationName [Warehouse Name],
--BDW 04/06/2020
CASE 
	WHEN  c.ManagerName = 'Shirley Xu'
		THEN 'Yuqin Gambardella' 
		ELSE c.ManagerName 
END					[Account Manager],
c.ChannelCode,
c.channelname [Channel Name],
c.[SalesDistrict] [Sales District]
 from dbo.L2_Customer c 
 --where InvoiceAccount != ''  -- Filtering out Invoice Accounts -- Assumption blank invoice account is an invoice customer account
 where c.CustGroup in ( 'OTH','NADIR' ) -- Jorge said to only limit by custgroup for Sales Team to get all tableau accounts















