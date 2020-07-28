CREATE VIEW L1_UOMConversion
AS
SELECT 	uomc.*,
		fuom.Symbol											[FromUnitOfMeasureSymbol],
		tuom.Symbol											[ToUnitOfMeasureSymbol]
FROM	dbo.UnitOfMeasureConversion								uomc
	JOIN	dbo.UnitOfMeasure										fuom
	ON		uomc.FromUnitOfMeasure = fuom.RecId
	JOIN	dbo.UnitOfMeasure										tuom
	ON		uomc.ToUnitOfMeasure = tuom.RecId
