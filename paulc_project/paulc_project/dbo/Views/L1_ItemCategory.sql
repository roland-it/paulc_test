
create VIEW [dbo].[L1_ItemCategory] 
AS

SELECT	erch.Name										Hierarchy,
		erc0.Name										RootCategory,
		erc1.Name										Category1,
		erc2.Name										Category2,
		erp.DisplayProductNumber						ItemId
FROM	dbo.EcoResCategoryHierarchy							erch
JOIN	dbo.EcoResCategory									erc0
ON		erch.RecId = erc0.CategoryHierarchy
AND		erc0.ParentCategory = 0
LEFT
JOIN	dbo.EcoResCategory									erc1
ON		erc0.RecId = erc1.ParentCategory
LEFT
JOIN	dbo.EcoResCategory									erc2
ON		erc1.RecId = erc2.ParentCategory
LEFT
JOIN	dbo.EcoResProductCategory							erpc
ON		COALESCE (
			erc2.RecId,
			erc1.RecId,
			erc0.RecId
		) = erpc.Category
LEFT
JOIN	dbo.EcoResProduct									erp
ON		erpc.Product = erp.RecId
WHERE	erch.Name = 'Product Categories'
