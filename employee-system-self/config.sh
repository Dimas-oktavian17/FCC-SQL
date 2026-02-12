#!/bin/bash

# Load Environment Variables
[ -f .env ] && source .env

# Export the password to the environment so MySQL picks it up automatically
# This removes the security warning and keeps the command line clean
export MYSQL_PWD="$DB_PASSWORD"

# Function to execute MySQL queries
execute_query() {
    local query="$1"
    mysql -h "$DB_HOST" -u "$DB_USER" -D "$DB_NAME" -P "$DB_PORT" -e "$query"
}

# Function to execute query and return result
execute_query_return() {
    local query="$1"
    mysql -h "$DB_HOST" -u "$DB_USER" -D "$DB_NAME" -P "$DB_PORT" -N -e "$query"
}

# Test connection
test_connection() {
    mysql -h "$DB_HOST" -u "$DB_USER" -e "SELECT 1" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✓ Database connection successful!"
        return 0
    else
        echo "✗ Database connection failed!"
        return 1
    fi
}

export -f execute_query
export -f execute_query_return
export -f test_connection