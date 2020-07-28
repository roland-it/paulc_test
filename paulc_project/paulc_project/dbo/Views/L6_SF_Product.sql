









CREATE VIEW [dbo].[L6_SF_Product]
AS
SELECT * FROM L4_SF_Product where modifieddatetime > 
(CASE WHEN
	-- check if this the first run. aka, no row in the tracking table
	(select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_Product') IS NULL
	then
		-- use an epoch date
		 (select CAST('1996-03-19 01:05:06.289' AS TIME(0)))
	else
		-- use table row if exists
		(select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_Product')
	END
)






