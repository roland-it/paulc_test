


CREATE VIEW [dbo].[L6_SF_Customer]
AS
SELECT * FROM L4_SF_Customer where modifieddatetime > (select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_Customer')

