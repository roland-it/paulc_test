











CREATE view [dbo].[L3_Broker_Active]
AS 
SELECT distinct 
      bvt.[AccountNum]
      ,bvt.[Name]
      ,bvt.[Street]
      ,bvt.[City]
      ,bvt.[State]
      ,bvt.[Zip]
	  ,bvt.CountryRegionId
	  ,bvt.CountryName
      ,bvt.[VendGroup]
      ,bvt.[KnownAs]
      ,bvt.[LocationName]
	--  ,bvt.DataAreaId
      ,bvt.[Partition],bvt.AccountCode, bvt.BrokerId, bvt.ModifiedDateTime
		
 FROM L2_Broker bvt
	where bvt.BrokerId is not null
	--Active broker is associated to a customer account
	










