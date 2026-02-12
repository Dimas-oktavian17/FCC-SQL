#!/usr/bin/env bash
set -e
source ./controllers/read.sh
source ./validation/validate.sh
# Function create
delete() {
    echo -e "\n--- Delete Employee ---"
   
   echo "Type of delete: <employee_id>"
   read -r employee_id
   if [[ -z "$employee_id" ]] || ! [[ "$employee_id" =~ ^[0-9]+$ ]]; 
   then
         echo "Employee ID is required and must be a number. Please try again."
         update
   else
        if [[ -z "$(get_employee_by_id "$employee_id")" ]];
        then
            echo "Employee with ID $employee_id does not exist."
            delete
        else
            echo "Are you sure you want to delete employee ID: $employee_id? (1/2)"
            echo "1. YES"
            echo "2. NO"
            read -p "Choose an option: " choice
            case $choice in
                1) delete_employee "$employee_id" ;;
                2) echo "Deletion cancelled."; source ./main.sh ;;
                *) echo "Invalid option. Please try again."; delete ;;
            esac
        fi
   fi
}
# Function to delete an existing employee
delete_employee() {    
    execute_query_return "DELETE FROM employees WHERE id=$1;"
    echo -e "\n--- Successfully deleted employee ID: $1 ---"
    source ./main.sh
}

export -f delete_employee
export -f delete