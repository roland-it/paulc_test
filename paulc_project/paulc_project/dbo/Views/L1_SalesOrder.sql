

CREATE view [dbo].[L1_SalesOrder]
AS
SELECT st.*,ss.Name [SalesOrderStatus], sty.Name [SalesOrderType], ds.Description [SalesDocumentStatus]
FROM dbo.salestable st
JOIN	dbo.AXEnums									ss
	ON		ss.[Type] = 'SalesStatus'
	AND		st.SalesStatus = ss.[Value]
	JOIN	dbo.AXEnums									sty
	ON		sty.[Type] = 'SalesType'
	AND		sty.[Value] = st.SalesType
 JOIN	  dbo.AXEnums									ds
	ON		ds.[Type] = 'DocumentStatus'
	AND		ds.[Value] = st.DocumentStatus
	

