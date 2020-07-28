create view L2_DirPartyNamePrimaryAddressView	
AS
SELECT * FROM DirPartyNamePrimaryAddressView	
WHERE (ValidFrom = '1/1/1900' AND ValidTo = '1/1/1900')	OR
			(GETUTCDATE() BETWEEN ValidFrom AND ValidTo)	