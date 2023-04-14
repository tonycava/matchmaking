#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER docker;
	DROP DATABASE IF EXISTS matchmaking;
	CREATE DATABASE matchmaking;
	GRANT ALL PRIVILEGES ON DATABASE matchmaking TO docker;
EOSQL
