#!/bin/bash

path=$(realpath $0)
script_dir="$(dirname $path)"

docker run \
	--security-opt apparmor=docker-default \
	--name oracle-custom \
	-e ORACLE_SID=threescale \
	-e ORACLE_PDB=systempdb \
	-e ORACLE_CHARACTERSET=AL32UTF8 \
	-v $script_dir/setup:/opt/oracle/scripts/setup \
	oracle/database:19.3.0-ee
