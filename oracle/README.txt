# # # Checking System
listener: alias to check listener and oracle process status
lservice: alias to check listener and oracle process status
sqlplus: alias to connect to OracleDB
 
# # # Oracle Control
oraclestart: alias to start OracleDB manually
oraclenew: alias to configure a NEW OracleDB if none exist
 
# # # Accessing Tables with SQL Plus
Show Tables: SELECT USERNAME FROM ALL_USERS ORDER BY USERNAME; 
Show Tablespaces: SELECT TABLESPACE_NAME FROM USER_TABLESPACES; 
Show PDB: SELECT PDB_ID, PDB_NAME, STATUS FROM DBA_PDBS ORDER BY PDB_ID; 
Show All Tables: SELECT table_name, owner, tablespace_name FROM all_tables; 
 
# # # Maintenance
rman0: alias to start Recovery Manager
VALIDATE DATABASE;
VALIDATE CHECK LOGICAL DATABASE;
BACKUP VALIDATE DATABASE ARCHIVELOG ALL;
BACKUP VALIDATE CHECK LOGICAL DATABASE ARCHIVELOG ALL;
 
help0: Re-run this page!
