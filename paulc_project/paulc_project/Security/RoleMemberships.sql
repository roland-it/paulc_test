﻿ALTER ROLE [db_owner] ADD MEMBER [ROLANDFOOD\DATAREPO_DEV_Owners];


GO
ALTER ROLE [db_owner] ADD MEMBER [bcp_test];


GO
ALTER ROLE [db_owner] ADD MEMBER [ROLANDFOOD\TST_AOS];


GO
ALTER ROLE [db_owner] ADD MEMBER [ROLANDFOOD\dev_aos];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ROLANDFOOD\DATAREPO_DEV_RW];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ROLANDFOOD\DATAREPO_DEV_RW];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ROLANDFOOD\DATAREPO_DEV_RO];


GO
ALTER ROLE [db_datareader] ADD MEMBER [ROLANDFOOD\lmadmin];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROLANDFOOD\DATAREPO_DEV_RW];

