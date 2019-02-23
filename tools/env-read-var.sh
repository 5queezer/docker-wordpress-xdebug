#!/usr/bin/env bash
set -euo pipefail

#/ Reads a variable from a dotenv file and prints it to stdout
#/
#/ Usage:   ./env-read-var.sh <variable_name> <dotenv_file>
#/ Example: ./env-read-var.sh MYSQL_USER ../.env

usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
if [ "${1:-}" == "" ]; then usage; exit 1; fi

read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

read_var $1 $2