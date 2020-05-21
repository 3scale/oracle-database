SHUTDOWN IMMEDIATE;
STARTUP;

ALTER PLUGGABLE DATABASE systempdb OPEN READ ONLY;

DECLARE
	sql_stmt          VARCHAR2(1000);
	type array_t is varray(2) of varchar2(10);
	array array_t := array_t('test', 'production');

	BEGIN
		FOR i IN 1..array.count LOOP
			sql_stmt :=  'CREATE PLUGGABLE DATABASE systempdb' || array(i) ||
			q'[ ADMIN USER rails IDENTIFIED BY railspass  FILE_NAME_CONVERT=('/opt/oracle/oradata/THREESCALE/pdbseed',]' ||
				q'['/opt/oracle/oradata/THREESCALE/systempdb]' || array(i) || q'[')]';
			EXECUTE IMMEDIATE sql_stmt;

	    END LOOP;
END;
/
ALTER PLUGGABLE DATABASE ALL OPEN READ WRITE;
ALTER SESSION SET CONTAINER=systempdbtest;
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;
ALTER SESSION SET CONTAINER=systempdbproduction;
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;
ALTER SESSION SET CONTAINER=CDB$ROOT;
ALTER PLUGGABLE DATABASE ALL SAVE STATE;
EXIT;

