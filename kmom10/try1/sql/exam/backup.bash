#!/usr/bin/env bash
DATABASE=${1:-exam}

printf "Taking a backup of the database '%s'.\n" "$DATABASE"

mysqldump --routines --result-file=backup.sql "$DATABASE"
ls -l backup.sql

#run
# bash backup.bash