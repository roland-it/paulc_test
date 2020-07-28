
Create view [dbo].[L1_SubstituteItem]
AS
SELECT	Product1			[Product],
				Product2			[SubstituteProduct]

		FROM	dbo.EcoResProductRelationTable erprt
		JOIN	dbo.EcoResProductRelationType erpy
		ON		erprt.ProductRelationType= erpy.RecId
		WHERE	erpy.Name = 'Substitute'




