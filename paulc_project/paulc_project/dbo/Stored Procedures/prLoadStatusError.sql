
-- =============================================
-- Author:		Bryan D. Williams
-- Create date: 04/27/2020
-- Description:	Insert Status/Error into 
-- =============================================
CREATE PROCEDURE [dbo].[prLoadStatusError](@APP nvarchar(100) ,@APP_AREA nvarchar(200) ,@APP_STEP nvarchar(200) ,@APP_STEP_STATUS int ,@ERROR_AREA nvarchar(50)=NULL,@ERROR_SEVERITY nvarchar(2)=NULL,@ERROR_MESSAGE nvarchar(2000)=NULL)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 INSERT INTO [dbo].[DATA_LOAD_STATUS_ERROR] ([APP] ,[APP_AREA] ,[APP_STEP] ,[APP_STEP_STATUS] ,[ERROR_AREA] ,[ERROR_SEVERITY] ,[ERROR_MESSAGE]) 
 VALUES (@APP ,@APP_AREA ,@APP_STEP ,@APP_STEP_STATUS ,@ERROR_AREA ,@ERROR_SEVERITY ,@ERROR_MESSAGE)
END
