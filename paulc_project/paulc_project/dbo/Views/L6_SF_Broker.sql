
CREATE VIEW [dbo].L6_SF_Broker
AS
SELECT * FROM L4_SF_Broker where modifieddatetime > (select modifieddatetime from Incremental_Tracking where view_name = 'L4_SF_Broker')

