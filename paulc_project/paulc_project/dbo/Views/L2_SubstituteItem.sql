

CREATE view [dbo].[L2_SubstituteItem]
AS
SELECT	sp.product,
it.DisplayProductNumber,
				it.Name SubstituteName

	FROM L1_SubstituteItem sp
		
	LEFT
	JOIN	dbo.EcoResProduct serp
	ON		sp.SubstituteProduct = serp.RecId
		inner join dbo.L1_Item it on it.DisplayProductNumber = serp.DisplayProductNumber






