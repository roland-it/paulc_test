create VIEW L1_Item
As
SELECT erp.RecId,
	   erp.DisplayProductNumber,
	   erpt.[Name]
	FROM	dbo.EcoResProduct erp
	JOIN	dbo.EcoResProductTranslation erpt
	ON		erpt.Product = erp.RecId