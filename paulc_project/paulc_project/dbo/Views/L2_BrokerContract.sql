create view L2_BrokerContract
As
SELECT * FROM L1_BrokerContract bc
WHERE	ISNULL(bc.RowRank, 1) = 1