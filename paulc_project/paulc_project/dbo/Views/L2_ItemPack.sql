
CREATE VIEW [dbo].[L2_ItemPack] 
AS

SELECT	ISNULL(p1.Product, p2.Product)						item_num,
		ISNULL(p1.PackQty, 1)								pack1,
		ISNULL(p2.PackQty, 1)								pack2,
		ISNULL(p1.PackQty, 1) * ISNULL(p2.PackQty, 1)		standard_pack

FROM (
	SELECT	uomc.FromUnitOfMeasureSymbol											[FromUnitOfMeasure],
			uomc.ToUnitOfMeasureSymbol											[ToUnitOfMeasure],
			erp.DisplayProductNumber							[Product],
			uomc.Rounding										[Rounding],
			CASE uomc.Denominator 
				WHEN 0 THEN CAST(NULL AS NUMERIC(32,16))
				ELSE uomc.Factor * uomc.Numerator / uomc.Denominator
				END												[PackQty],
			RANK() OVER (	
				PARTITION 
				BY			erp.DisplayProductNumber
				ORDER BY	uomc.Factor				DESC,
							uomc.ModifiedDateTime	DESC,
							uomc.RecId				DESC)		[rank]
	FROM	dbo.L1_UOMConversion uomc
	JOIN	dbo.EcoResProduct										erp
	ON		uomc.Product = erp.RecId
	WHERE	uomc.FromUnitOfMeasureSymbol IN ('Bundle', 'M-Carton')
	AND		uomc.ToUnitOfMeasureSymbol IN ('Carton', 'Drum')
)																p1
FULL
OUTER
JOIN (
	SELECT	uomc.FromUnitOfMeasureSymbol											[FromUnitOfMeasure],
			uomc.ToUnitOfMeasureSymbol										[ToUnitOfMeasure],
			erp.DisplayProductNumber							[Product],
			uomc.Rounding										[Rounding],
			CASE uomc.Denominator 
				WHEN 0 THEN CAST(NULL AS NUMERIC(32,16))
				ELSE uomc.Factor * uomc.Numerator / uomc.Denominator
				END												[PackQty],
			RANK() OVER (	
				PARTITION 
				BY			erp.DisplayProductNumber
				ORDER BY	uomc.Factor				DESC,
							uomc.ModifiedDateTime	DESC,
							uomc.RecId				DESC)		[rank]
	FROM	dbo.L1_UOMConversion uomc
	JOIN	dbo.EcoResProduct										erp
	ON		uomc.Product = erp.RecId
	WHERE	uomc.FromUnitOfMeasureSymbol IN ('Carton', 'Drum')
	AND		uomc.ToUnitOfMeasureSymbol IN ('Bag','Box','Count','Each','Jar','Package','Piece','Quantity','Tin')
)																	p2
ON p1.Product = p2.Product
