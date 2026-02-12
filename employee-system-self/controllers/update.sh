#!/usr/bin/env bash
set -e
source ./controllers/read.sh
source ./validation/validate.sh
# Function create
update() {
    echo -e "\n--- Update Employee ---"
   
   echo "Type of update: <employee_id>"
   read -r employee_id
   if [[ -z "$employee_id" ]] || ! [[ "$employee_id" =~ ^[0-9]+$ ]]; 
   then
         echo "Employee ID is required and must be a number. Please try again."
         update
   else
        if [[ -z "$(get_employee_by_id "$employee_id")" ]];
        then
            echo "Employee with ID $employee_id does not exist."
            update
        else
            echo "Enter new salary:"
            read -r new_salary
            if validate_salary "$new_salary"; then
                update_employee "$employee_id" "$new_salary"
            else
                update
        fi
        fi
   fi
}
# Function to update an existing employee
update_employee() {    
    execute_query_return "UPDATE employees SET salary='$2' WHERE id=$1;"
    echo -e "\n--- Successfully updated employee ID: $1 ---"
    source ./main.sh
}

export -f update_employee
export -f update