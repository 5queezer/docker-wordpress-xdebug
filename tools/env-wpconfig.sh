#!/usr/bin/env bash
set -euo pipefail

#/ $1: dotenv file location
#/ $2: wp-config.php file location

ENV_FILE="${1:-.env}"
WPCONFIG_FILE="${2:-wp-config.php}"
ENV_VAR_TOOL="$(dirname $0)/env-read-var.sh"

MYSQL_DATABASE=$($ENV_VAR_TOOL MYSQL_DATABASE "$ENV_FILE")
sed -i "s/\(define('DB_NAME',\s'\)\w*\(');\)/\1$MYSQL_DATABASE\2/g" $WPCONFIG_FILE 

MYSQL_USER=$($ENV_VAR_TOOL MYSQL_USER "$ENV_FILE")
sed -i "s/\(define('DB_USER',\s'\)\w*\(');\)/\1$MYSQL_USER\2/g" $WPCONFIG_FILE 

MYSQL_PASSWORD=$($ENV_VAR_TOOL MYSQL_PASSWORD "$ENV_FILE")
sed -i "s/\(define('DB_PASSWORD',\s'\)\w*\(');\)/\1$MYSQL_PASSWORD\2/g" $WPCONFIG_FILE 

MYSQL_HOST="mariadb"
sed -i "s/\(define('DB_HOST',\s'\)\w*\(');\)/\1$MYSQL_HOST\2/g" $WPCONFIG_FILE 

TABLE_PREFIX=$($ENV_VAR_TOOL TABLE_PREFIX "$ENV_FILE")
sed -i "s/\(\$table_prefix\s*=\s*'\)\w*\('\s*;\)/\1$TABLE_PREFIX\2/g" $WPCONFIG_FILE 
