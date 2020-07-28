-- =============================================
-- Author:		George Hyros
-- Create date: November 24, 2014
-- Description:	Determines the DATETIME that represents the start, i.e. midnight, of today's date
-- =============================================
CREATE FUNCTION [dbo].[Today] 
(
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DATETIME

	-- This function figures out the number of days between now and 'zero'
	-- and then adds that number to 'zero' as a DATETIME object
	SELECT @Result = DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 0)

	-- Return the result of the function
	RETURN @Result

END
