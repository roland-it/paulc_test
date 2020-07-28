


-- =============================================
-- Author:		Bryan D. Williams
-- Create date: 2020-03-04
-- Description:	Compare Views data and load staging if empty
--				Staging tables end incremental and start with L6
--				A view starting with L6 will pull data from the L5 or L4 based on key or flag in Incremental_tracking table
-- BDW 04/15/2020 Added Broker, Inventory,Product,SalesOrder,SalesLine to incremental process
-- =============================================
CREATE PROCEDURE [dbo].[prIncrementalDataExtract]
	@Reload int=0,@reload_num_days int = 0, @specific_table varchar(100), @RUN_LAG INT = 3
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   DECLARE @VIEW_LOOP table (ID int, view_name varchar(100), modifieddatetime datetime, lastrundate datetime, active int)

   INSERT INTO @VIEW_LOOP SELECT ID,VIEW_NAME,MODIFIEDDATETIME,LAST_RUNDATETIME, 1 FROM Incremental_Tracking

   DECLARE @ID INT
   DECLARE @VIEW VARCHAR(100)
   DECLARE @MODIFIEDDATETIME DATETIME
   DECLARE @ACTIVE INT
   DECLARE @DataCount bigint
   DECLARE @LastModified DateTime
   DECLARE @LAST_RUNDATETIME DateTime

   WHILE(EXISTS(SELECT * FROM @VIEW_LOOP WHERE ACTIVE = 1))
   BEGIN
		--- Get the last run time and modified time for the view
	   SELECT TOP 1 @ID = ID
			, @VIEW = VIEW_NAME
			, @MODIFIEDDATETIME = MODIFIEDDATETIME
			, @LAST_RUNDATETIME = lastrundate
			, @ACTIVE = ACTIVE 
		FROM @VIEW_LOOP 
		WHERE ACTIVE = 1 
		ORDER BY ID

	   IF(@VIEW = 'L4_SF_Customer')
	   BEGIN
			SELECT @DataCount = COUNT(*) FROM [L6_SF_Customer_Incremental]
			IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR @LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate()))) OR @RELOAD = 1)
			BEGIN
				IF(@Reload = 1)
				BEGIN
				
					TRUNCATE TABLE L6_SF_Customer_Incremental
					UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

				END
				INSERT INTO [L6_SF_Customer_Incremental]([BrokerId]
			  ,[BrokerName]
			  ,[Name]
			  ,[invoiceAccount]
			  ,[KnownAs]
			  ,[LegalEntity]
			  ,[AccountNum]
			  ,[LocationName]
			  ,[City]
			  ,[State]
			  ,[Zip]
			  ,[Street]
			  ,[CountryRegionId]
			  ,[CountryName]
			  ,[DlvTerm]
			  ,[DlvMode]
			  ,[InsideAccountManager]
			  ,[ChainCode]
			  ,[ChainName]
			  ,[LineOfBusinessId]
			  ,[LobName]
			  ,[ModifiedDateTime]
			  ,[DivisionCode]
			  ,[DivisionName]
			  ,[Warehouse Code]
			  ,[Warehouse Name]
			  ,[Account Manager]
			  ,[ChannelCode]
			  ,[Channel Name]
			  ,[Sales District])
			   SELECT [BrokerId]
			  ,[BrokerName]
			  ,[Name]
			  ,[invoiceAccount]
			  ,[KnownAs]
			  ,[LegalEntity]
			  ,[AccountNum]
			  ,[LocationName]
			  ,[City]
			  ,[State]
			  ,[Zip]
			  ,[Street]
			  ,[CountryRegionId]
			  ,[CountryName]
			  ,[DlvTerm]
			  ,[DlvMode]
			  ,[InsideAccountManager]
			  ,[ChainCode]
			  ,[ChainName]
			  ,[LineOfBusinessId]
			  ,[LobName]
			  ,[ModifiedDateTime]
			  ,[DivisionCode]
			  ,[DivisionName]
			  ,[Warehouse Code]
			  ,[Warehouse Name]
			  ,[Account Manager]
			  ,[ChannelCode]
			  ,[Channel Name]
			  ,[Sales District] FROM L6_SF_Customer
				SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_Customer_Incremental]

				IF(@LastModified is null)
				BEGIN
					SET @LastModified = @MODIFIEDDATETIME
				END
				UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
			END
		END

		IF(@VIEW = 'L4_SF_PriceList_NY')
		BEGIN
			SELECT @DataCount = COUNT(*) FROM [L6_SF_PriceList_Incremental]
			IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
			BEGIN
				IF(@Reload = 1)
				BEGIN
				
					TRUNCATE TABLE [L6_SF_PriceList_Incremental]
					UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

				END
				INSERT INTO [L6_SF_PriceList_Incremental] 
				(
				   [CustomerName]
				  ,[Account Code]
				  ,[ITEMRELATION]
				  ,[ACCOUNTRELATION]
				  ,[INVENTLOCATIONID]
				  ,[Currency]
				  ,[UNITID]
				  ,[ItemDescription]
				  ,[AMOUNT]
				  ,[FROMDATE]
				  ,[TODATE]
				  ,[DATAAREAID]
				  ,[ModifiedDatetime]
							)
				SELECT [CustomerName]
				  ,[Account Code]
				  ,[ITEMRELATION]
				  ,[ACCOUNTRELATION]
				  ,[INVENTLOCATIONID]
				  ,[Currency]
				  ,[UNITID]
				  ,[ItemDescription]
				  ,[AMOUNT]
				  ,[FROMDATE]
				  ,[TODATE]
				  ,[DATAAREAID]
				  ,[ModifiedDatetime] FROM L6_SF_Pricelist_NY
				SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_Customer_Incremental]

				IF(@LastModified is null)
				BEGIN
					SET @LastModified = @MODIFIEDDATETIME
				END
				UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
			END

		END

		----------------------------
		--- Loading Product table
		----------------------------
		IF(@VIEW = 'L4_SF_Product')
		BEGIN
			SELECT @DataCount = COUNT(*) FROM [L6_SF_Product_Incremental]
			IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
			BEGIN
				IF(@Reload = 1)
				BEGIN
				
					TRUNCATE TABLE [L6_SF_Product_Incremental]

					UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

				END

					INSERT INTO [L6_SF_Product_Incremental]
					(
					[DisplayProductNumber]
				  ,[Name]
				  ,[GrossDepth]
				  ,[GrossHeight]
				  ,[GrossWidth]
				  ,[NetWeight]
				  ,[StandardPalletQuantity]
				  ,[PdsShelfLife]
				  ,[UnitVolume]
				  ,[TareWeight]
				  ,[QtyPerLayer]
				  ,[rolCartonMarking]
				  ,[rolCartonMarkingsInner]
				  ,[rolShipConditionsSell]
				  ,[rolShipConditionsPurchase]
				  ,[Intracode]
				  ,[CreatedBy]
				  ,[CreatedDatetime]
				  ,[ModifiedBy]
				  ,[ModifiedDatetime]
				  ,[SupplierEngagementSpecialist]
				  ,[BuyerName]
				  ,[BuyerId]
				  ,[StoppedPurch]
				  ,[StoppedInvent]
				  ,[StoppedSales]
				  ,[PackType]
				  ,[Category1]
				  ,[Category2]
				  ,[Pack1]
				  ,[Pack2]
				  ,[StandardPackQty]
				  ,[UnitDepth]
				  ,[UnitHeight]
				  ,[UnitWidth]
				  ,[DrainedWeight]
				  ,[UPC]
				  ,[GTIN]
				  ,[Discontinued]
				  ,[UnitType]
				  ,[BlockConfig]
				  ,[StackConfig]
				  ,[GrossWeight]
				  ,[BrandNum]
				  ,[BrandName]
				  ,[FreightClass]
				  ,[SubItemId]
				  ,[SubstituteName]
				  ,[store_temp])
				SELECT 
				  [DisplayProductNumber]
				  ,[Name]
				  ,[GrossDepth]
				  ,[GrossHeight]
				  ,[GrossWidth]
				  ,[NetWeight]
				  ,[StandardPalletQuantity]
				  ,[PdsShelfLife]
				  ,[UnitVolume]
				  ,[TareWeight]
				  ,[QtyPerLayer]
				  ,[rolCartonMarking]
				  ,[rolCartonMarkingsInner]
				  ,[rolShipConditionsSell]
				  ,[rolShipConditionsPurchase]
				  ,[Intracode]
				  ,[CreatedBy]
				  ,[CreatedDatetime]
				  ,[ModifiedBy]
				  ,[ModifiedDatetime]
				  ,[SupplierEngagementSpecialist]
				  ,[BuyerName]
				  ,[BuyerId]
				  ,[StoppedPurch]
				  ,[StoppedInvent]
				  ,[StoppedSales]
				  ,[PackType]
				  ,[Category1]
				  ,[Category2]
				  ,[Pack1]
				  ,[Pack2]
				  ,[StandardPackQty]
				  ,[UnitDepth]
				  ,[UnitHeight]
				  ,[UnitWidth]
				  ,[rolDrainedWeight]
				  ,[UPC]
				  ,[GTIN]
				  ,[Discontinued]
				  ,[UnitType]
				  ,[BlockConfig]
				  ,[StackConfig]
				   ,[GrossWeight]
				  ,[BrandNum]
				  ,[BrandName]
				  ,[FreightClass]
				  ,[SubItemId]
				  ,[SubstituteName]
				  ,[store_temp] 
				  FROM dbo.L6_SF_Product
				
				SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_Product_Incremental]
				IF(@LastModified is null)
				BEGIN
					SET @LastModified = @MODIFIEDDATETIME
				END
				UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
			END
		END
		
		IF(@VIEW = 'L4_SF_Inventory')
		BEGIN
			PRINT 'COOL'
			SELECT @DataCount = COUNT(*) FROM [L6_SF_Inventory_Incremental]
			Select @DataCount, @LastModified, @LAST_RUNDATETIME,@RUN_LAG
			IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
			BEGIN
				PRINT 'COOl2'
				IF(@Reload = 1)
				BEGIN
				
					TRUNCATE TABLE [L6_SF_Inventory_Incremental]

					UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

				END
				
				TRUNCATE TABLE [L6_SF_Inventory_Incremental]
				INSERT INTO [L6_SF_Inventory_Incremental]
					SELECT * FROM dbo.L6_SF_Inventory
					PRINT 'COOL23'
				--BDW This is current inventory no need for modified date
				--SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_Inventory_Incremental]

				UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
			END
		END
		--IF(@VIEW = 'L4_SF_SalesLine')
		--BEGIN
		--	SELECT @DataCount = COUNT(*) FROM [L6_SF_SalesLine_Incremental]
		--	IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
		--	BEGIN
		--		IF(@Reload = 1)
		--		BEGIN
				
		--			TRUNCATE TABLE [L6_SF_SalesLine_Incremental]
		--			UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

		--		END
		--			INSERT INTO [L6_SF_SalesLine_Incremental]
		--			SELECT * FROM dbo.L6_SF_SalesLine
		--		SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_SalesLine_Incremental]

		--		UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
		--	END
		--END
		--IF(@VIEW = 'L4_SF_SalesOrder')
		--BEGIN
		--	SELECT @DataCount = COUNT(*) FROM [L6_SF_SalesOrder_Incremental]
		--	IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
		--	BEGIN
		--		IF(@Reload = 1)
		--		BEGIN
				
		--			TRUNCATE TABLE [L6_SF_SalesOrder_Incremental]
		--			UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

		--		END
		--		INSERT INTO [L6_SF_SalesOrder_Incremental]
		--			SELECT * FROM dbo.L6_SF_SalesOrder
		--		SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_SalesOrder_Incremental]

		--		UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
		--	END
		--END
		--IF(@VIEW = 'L4_SF_Broker')
		--BEGIN
		--	SELECT @DataCount = COUNT(*) FROM [L6_SF_PriceList_Incremental]
		--	IF((@DataCount = 0 and (@LAST_RUNDATETIME IS NULL OR (@LAST_RUNDATETIME < DateAdd(hour,@run_lag,getdate())))) OR @Reload = 1)
		--	BEGIN
		--		IF(@Reload = 1)
		--		BEGIN
				
		--			TRUNCATE TABLE [L6_SF_Broker_Incremental]
		--			UPDATE Incremental_Tracking SET MODIFIEDDATETIME = GETDATE() - @reload_num_days, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID

		--		END
		--		INSERT INTO [L6_SF_Broker_Incremental]
		--			SELECT * FROM dbo.L6_SF_Broker
		--		SELECT @LastModified = MAX(ModifiedDatetime) from [L6_SF_Broker_Incremental]

		--		UPDATE Incremental_Tracking SET MODIFIEDDATETIME = @LastModified, LAST_RUNDATETIME = GETDATE() WHERE ID = @ID
		--	END
		--END
   UPDATE @VIEW_LOOP SET ACTIVE = 0 WHERE ID = @ID
   END
END
