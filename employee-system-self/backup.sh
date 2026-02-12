#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status
set -e
# Load Environment Variables
[ -f .env ] && source .env
# Export the password to the environment so MySQL picks it up automatically
# This removes the security warning and keeps the command line clean
export MYSQL_PWD="$DB_PASSWORD"
# Backup Script for Employee System
backup() {
    if [ ! -d "backups" ]; then
        mkdir backups
    else
    # Backup only if a backup with the current timestamp doesn't already exist
    if [ ! -f "backups/employee_system_backup_$(date +%Y%m%d_%H%M%S).sql" ]; then
        # Dump with format YYYYMMDD_HHMMSS
        mysqldump -h "$DB_HOST" \
                  -u "$DB_USER" \
                  --single-transaction \
                  --quick \
                  --lock-tables=false \
                   "$DB_NAME" \
                   -P "$DB_PORT" > "backups/employee_system_backup_$(date +%Y%m%d_%H%M%S).sql"
     if [ $? -eq 0 ]; then
            echo "Backup successful: backups/employee_system_backup_$(date +%Y%m%d_%H%M%S).sql"
        else
            echo "Backup failed"
    fi
    fi
    fi
}

backup