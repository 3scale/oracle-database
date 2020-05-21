#!/bin/bash
cd "$ORACLE_HOME/rdbms/admin/"

"$ORACLE_HOME/perl/bin/perl" catcon.pl -d "$ORACLE_HOME/rdbms/admin" -l /tmp -b utl32k_output utl32k.sql
