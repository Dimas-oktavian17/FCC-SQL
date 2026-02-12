#!/usr/bin/env bash
# Import necessary modules
source ./controllers/create.sh
source ./controllers/read.sh
source ./controllers/update.sh
source ./controllers/delete.sh
source ./config.sh
source ./seed/seed.sh
# Test database connection
test_connection
#  Seed database
seed_database
# Main menu loop
while true; do
    echo "Employee Management System"
    echo "1. Add Employee"
    echo "2. View Employees"
    echo "3. Search Employee"
    echo "4. Update Employee"
    echo "5. Delete Employee"
    echo "6. Generate Report"
    echo "7. Exit"
    read -p "Choose an option: " choice
    case $choice in
        1) create ;;
        2) view_employees ;;
        3) read -p "Enter name or email to search: " query
           search_employee "$query" ;;
        4) update ;;
        5) delete ;;
        6) generate_report >> "reports/report_$(date +%Y%m%d).txt"; echo "Report generated: reports/report_$(date +%Y%m%d).txt" ;;
        7) echo "Exiting..."; source ./backup.sh; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    done