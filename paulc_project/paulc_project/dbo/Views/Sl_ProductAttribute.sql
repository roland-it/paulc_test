

CREATE VIEW [dbo].[Sl_ProductAttribute]
AS
SELECT [SKU]
	,[Name]
	,[Item Name] AS ITEMNAME
	,[Product Name] AS PRODUCTNAME
	,[Computed - Pack Size] AS COMPUTEDPACKSIZE
	,[Unit Quantity] AS UnitQuantity
	,[Unit Size] AS UnitSize
	,[Brand Name] AS BrandName
	,[Disabled] a
	,[Product Category 1] AS ProductCategory1
	,[Product Category 2] AS ProductCategory2
	,[Supplier Engagement Specialist] AS SupplierEngagementSpecialist
	,[Buyer Name] AS BuyerName
	,[Item UPC] AS ItemUPC
	,[Inside UPC Code] AS InsideUPCECode
	,[Outside UPC Code] AS OutsideUPCCode
	,[Master Pack] AS MasterPack
	,[Effective Date (mmddyyyy)] AS EffectiveDate
	,[Supersedes (mmddyyyy)] AS Supersedes
	,[Reason for Change] AS ReasonForChange
	,[Revised By] AS RevisedBy
	,[File]
	,[Pack Size] AS PackSize
	,[Pack1]
	,[Pack2]
	,[Supplier #1] AS Supplier1
	,[Supplier # 10 COO] AS Supplier10COO
	,[Supplier #10] AS Supplier10
	,[Supplier #10 Kosher] AS Supplier10Kosher
	,[Supplier #11] AS Supplier11
	,[Supplier # 11 COO] AS Supplier11COO
	,[Supplier #11 Kosher] AS Supplier11Kosher
	,[Supplier #1 COO] AS Supplier1COO
	,[Supplier #2] AS Supplier2
	,[Supplier #1 Kosher] AS Supplier1Kosher
	,[Supplier #2 Kosher] AS Supplier2Kosher
	,[Supplier #2 COO] AS Supplier2COO
	,[Supplier # 3 COO] AS Supplier3COO
	,[Supplier #3] AS Supplier3
	,[Supplier #3 Kosher] AS Supplier3Kosher
	,[Supplier #4] AS Supplier4
	,[Supplier #4 Kosher] AS Supplier4Kosher
	,[Supplier # 4 COO] AS Supplier4COO
	,[Supplier #5] AS Supplier5
	,[Supplier # 5 COO] AS Supplier5COO
	,[Supplier #5 Kosher] AS Supplier5Kosher
	,[Supplier #6] AS Supplier6
	,[Supplier # 6 COO] AS Supplier6COO
	,[Supplier #6 Kosher] AS Supplier6Kosher
	,[Supplier # 7 COO] AS Supplier7COO
	,[Supplier #7] AS Supplier7
	,[Supplier #7 Kosher] AS Supplier7Kosher
	,[Supplier #8] AS Supplier8
	,[Supplier # 8 COO] AS Supplier8COO
	,[Supplier #8 Kosher] AS Supplier8Kosher
	,[Supplier #9] AS Supplier9
	,[Supplier # 9 COO] AS Supplier9COO
	,[Supplier #9 Kosher] AS Supplier9Kosher
	,[Case Length (in)] AS CaseLengthin
	,[Case Width (in)] AS CaseWidthin
	,[Case Height (in)] AS CaseHeightin
	,[Case Net Weight (lb)] AS CaseNetWeightlb
	,[Case Gross Weight (lb)] AS CaseGrossWeightlb
	,[Case Tare Weight (lb)] AS CaseTareWeightlb
	,[Pallet Hi] AS PalletHi
	,[Pallet Tie] AS PalletTie
	,[Gross Pallet Weight (lb)] AS GrossPalletWeightlb
	,[Cases Per Pallet] AS CasesPerPallet
	,[Case Cube (ft3)] AS CaseCubeft3
	,[Packaging Type] AS PackagingType
	,[Net Weight (Unit Label)] AS NetWeightUnitLabel
	,[Net Weight Formula] AS NetWeightFormula
	,[DR Weight Formula] AS DRWeightFormula
	,[DR Weight (Unit Label)] AS DRWeightUnitLabel
	,[DR WT Unit (use: g, kg, OZ, LB)]		AS		DRWTUnitUseGKgOzLb
,[Packaging Tare Weight (g)] AS PackagingTareWeightg
	,[Shelf Life Days (Unopened)] AS ShelfLifeDaysUnopened
	,[Unopened Storage Condition] AS UnopenedStorageCondition
	,[Shelf Life After Opening (Days)] AS ShelfLifeAfterOpeningDays
	,[Opened Storage Condition] AS OpenedStorageCondition
	,[Ship Contidions (Sales)] AS ShipContidionsSales
	,[Calories (kcal)/100g] AS Calorieskcal100g
	,[Calories from Fat (kcal)/100g] AS CaloriesfromFatkcal100g
	,[Total Fat (g)/100g] AS TotalFatg100g
	,[Saturated Fat (g)/100g] AS SaturatedFatg100g
	,[Unsaturated Fat (g)/100g] AS UnsaturatedFatg100g
	,[Polyunsaturated Fat (g)/100g] AS PolyunsaturatedFatg100g
	,[Calcium (mg)/100g] AS Calciummg100g
	,[Added Sugar (g)/100g] AS AddedSugarg100g
	,[Cholesterol (mg)/100g] AS Cholesterolmg100g
	,[Iron (mg)/100g] AS Ironmg100g
	,[Dietary Fiber (g)/100g] AS DietaryFiberg100g
	,[Monounsaturated Fat (g)/100g] AS MonounsaturatedFatg100g
	,[Moisture/Ash (g)/100g] AS MoistureAshg100g
	,[Protein (g)/100g] AS Proteing100g
	,[Potassium (mg)/100g] AS Potassiummg100g
	,[Total Carbohydrate (g)/100g] AS TotalCarbohydrateg100g
	,[Sodium (mg)/100g] AS Sodiummg100g
	,[Trans Fat (g)/100g] AS TransFatg100g
	,[Total Sugar (g)/100g] AS TotalSugarg100g
	,[Vitamin C (mg)/100g] AS VitaminCmg100g
	,[Vitamin A (mcg)/100g] AS VitaminAmcg100g
	,[Vitamin D (mcg)/100g] AS VitaminDmcg100g
	,[Calories (kcal)/Serving] AS CalorieskcalServing
	,[Total Fat (g)/Serving] AS TotalFatgServing
	,[Saturated Fat (g)/Serving] AS SaturatedFatgServing
	,[Added Sugar (g)/Serving] AS AddedSugargServing
	,[Monounsaturated Fat (g)/Serving] AS MonounsaturatedFatgServing
	,[Dietary Fiber (g)/Serving] AS DietaryFibergServing
	,[Protein (g)/Serving] AS ProteingServing
	,[Polyunsaturated Fat (g)/Serving] AS PolyunsaturatedFatgServing
	,[Total Sugar (g)/Serving] AS TotalSugargServing
	,[Total Carbs (g)/Serving] AS TotalCarbsgServing
	,[Trans Fat (g)/Serving] AS TransFatgServing
	,[Unsaturated Fat (g)/Serving] AS UnsaturatedFatgServing
	,[Calcium (mg)/Serving] AS CalciummgServing
	,[Cholesterol (mg)/Serving] AS CholesterolmgServing
	,[Potassium (mg)/Serving] AS PotassiummgServing
	,[Iron (mg)/Serving] AS IronmgServing
	,[Sodium (mg)/Serving] AS SodiummgServing
	,[Added Sugars (%DV)] AS AddedSugarsDV
	,[Cholesterol (%DV)] AS CholesterolDV
	,[Saturated Fat (%DV)] AS SaturatedFatDV
	,[Dietary Fiber (%DV)] AS DietaryFiberDV
	,[Sodium (%DV)] AS SodiumDV
	,[Total Carb (%DV)] AS TotalCarbDV
	,[Vitamin D (%DV)] AS VitaminDDV
	,[Total Fat (%DV)] AS TotalFatDV
	,[Ingredient Statement] AS IngredientStatement
	,[Calculated Weight/Serving (g)] AS CalculatedWeightServingg
	,[Specific Gravity] AS SpecificGravity
	,[Count per Unit] AS CountperUnit
	,[Appearance] AS Appearance
	,[Color] AS Color
	,[Aroma/Smell] AS AromaSmell
	,[Flavor/Taste] AS FlavorTaste
	,[Texture/Feel] AS TextureFeel
	,[Halal] AS Halal
	,[Label Comments] AS LabelComments
	,[LabelComments1] AS LabelComments1
	,[LabelComments2] AS LabelComments2
	,[LabelComments3] AS LabelComments3
	,[GMO Status] AS GMOStatus
	,[GMO Status1] AS GMOStatus1
	,[Gluten Ingredients Status] AS GlutenIngredientsStatus
	,[Lacto-ovo Vegetarian] AS LactoovoVegetarian
	,[Vegan] AS Vegan
	,[Qualify for "Made in America Program"] AS QualifyforMadeinAmericaProgram
	,[Salsify Record Type] AS SalsifyRecordType
	,[Vitamin D (mcg)/Serving] AS VitaminDmcgServing
	,[Calcium (DV%)] AS CalciumDV
	,[Iron (DV%)] AS IronDV
	,[Potassium (DV%)] AS PotassiumDV
	,[Servings Per Container] AS ServingsPerContainer
	,[Product Status] AS ProductStatus
	,[Organic Certifying Body] AS OrganicCertifyingBody
	,[Certified Organic Agent] AS CertifiedOrganicAgent
    ,[Channels]
      ,[Channels1]
      ,[Channels2]
FROM [dbo].[SalsifyProductFeed]
