
CREATE VIEW [dbo].L6_SF_SalesOrder
AS
SELECT * FROM L4_SF_SalesOrder where modifieddatetime > (select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_SalesOrder')
