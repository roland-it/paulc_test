

CREATE VIEW [dbo].L6_SF_SalesLine
AS
SELECT * FROM L4_SF_SalesLine where modifieddatetime > (select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_SalesLine')

