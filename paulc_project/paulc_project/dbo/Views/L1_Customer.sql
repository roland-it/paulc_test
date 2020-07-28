




/*
* 05/01/2020 BDW Description error.  Enclosed column name in brackets
*/
CREATE view [dbo].[L1_Customer]
AS
SELECT
dpt.Name Name,
dpt.KNOWNAS,
ct.*,
cg.CHAINID,
cg.[Description] [ChainName],
lob.[Description] LOBName,
cd.[SUBSEGMENTDESCRIPTION] 
from CUSTTABLE ct  left outer join DIRPARTYTABLE dpt on ct.party = dpt.recid 
LEFT
	JOIN	dbo.LineOfBusiness						lob
	ON		ct.LineOfBusinessId = lob.LineOfBusinessId
	AND		ct.DataAreaId = lob.DataAreaId
	AND		ct.[Partition] = lob.[Partition]
	LEFT
	JOIN	dbo.SmmBusRelChainGroup				cg
	ON		ct.CompanyChainId = cg.ChainId
	AND		ct.DataAreaId = cg.DataAreaId
	AND		ct.[Partition] = cg.[Partition]


LEFT
	JOIN	dbo.smmBusRelSubSegmentGroup			cd
	ON		ct.SegmentId = cd.SegmentId
	AND		ct.SubsegmentId = cd.SubsegmentId
	AND		ct.DataAreaId = cd.DataAreaId
	AND		ct.[Partition] = cd.[Partition]




