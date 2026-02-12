#!/usr/bin/env bash
set -e
# Import configuration
source ./config.sh
# Seed Database Simpler Version
seed_database() {
    IS_SEEDED=$(execute_query_return "SELECT COUNT(*) FROM employees;")
    if [[ $IS_SEEDED -eq 0 ]]; 
    then
    execute_query "INSERT INTO employees (name, email, department, salary, hire_date) VALUES
     ('John', 'john.doe@example.com', 'Engineering', 70000, '2023-01-15'),
     ('Jane', 'jane.smith@example.com', 'Marketing', 65000, '2023-02-20'),
     ('Bob', 'bob.johnson@example.com', 'Sales', 60000, '2023-03-10'),
     ('Alice', 'alice.wilson@example.com', 'HR', 55000, '2023-04-05'),
     ('Charlie', 'charlie.brown@example.com', 'IT', 50000, '2023-05-15');"
     echo -e "\nDatabase seeded successfully!\n"   
    else
        echo -e "\nDatabase already seeded. Skipping seeding process.\n"
    fi
}
    
export -f seed_database