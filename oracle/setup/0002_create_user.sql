ALTER SYSTEM SET max_string_size=extended SCOPE=SPFILE;
ALTER SYSTEM SET compatible='19.0.0' SCOPE=SPFILE;
ALTER SYSTEM SET archive_lag_target=0 SCOPE=BOTH;
ALTER SESSION SET CONTAINER=systempdb;
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;
CREATE USER rails IDENTIFIED BY railspass;
GRANT PDB_DBA TO rails WITH ADMIN OPTION;
ALTER SESSION SET CONTAINER=CDB$ROOT;
SHUTDOWN IMMEDIATE;
STARTUP UPGRADE;
ALTER PLUGGABLE DATABASE ALL OPEN UPGRADE;
EXIT;
