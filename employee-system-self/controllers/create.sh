#!/usr/bin/env bash
set -e
# Function create
create() {
    echo -e "\n--- Add New Employee ---"
    echo -e "\n--- Format: Name, Email, Department, Salary, Hire Date ---"
    read -r -p "Enter details: " name email department salary hire_date
    if [[ -z "$name" || -z "$email" || -z "$department" || -z "$salary" || -z "$hire_date" ]]; then
        echo "All fields are required. Please try again."
        create
    fi
    # Basic name validation
    if [[ ${#name} -lt 3 ]]; then
        echo "Name must be at least 3 characters long. Please try again."
        create
    elif ! [[ "$name" =~ ^[a-zA-Z]+$ ]]; then
        echo "Name can contain only letters. Please try again."
        create
    fi
    # email validation
    if ! [[ "$email" =~ ^[a-zA-Z0-9_.]+@[a-zA-Z0-9_.]+[.]+[a-zA-Z]+$ ]]; then
        echo "Invalid email format. Please try again."
        create
    fi
    # Basic department validation
    if [[ ${#department} -lt 2 ]]; then
        echo "Department must be at least 2 characters long. Please try again."
        create
    elif ! [[ "$department" =~ ^[a-zA-Z]+$ ]]; then
        echo "Department can contain only letters. Please try again."
        create
    fi
    # Check if salary is a number  
    if ! [[ "$salary" =~ ^[0-9]+$ ]]; then
        echo "Salary must be a number. Please try again."
        create
    elif [[ "$salary" -le 0 ]]; then
        echo "Salary must be greater than zero. Please try again."
        create
    fi
    # Validate date format (YYYY-MM-DD)
    if ! [[ "$hire_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Hire Date must be in YYYY-MM-DD format. Please try again."
        create
    fi
    
    IS_VALID_EMAIL=$(execute_query "SELECT id FROM employees WHERE email = '$email';")
    if [[ -n "$IS_VALID_EMAIL" ]]; then
        echo "Email already exists. Please try again use another email."
        create
    fi
    add_employee "$name" "$email" "$department" "$salary" "$hire_date"
}
# Function to add a new employee
add_employee() {    
    execute_query_return "INSERT INTO employees (name, email, department, salary, hire_date) VALUES ('$1', '$2', '$3', '$4', '$5');"
    echo -e "\n--- Successfully added employee: $1 ---"
    source ./main.sh
}

export -f add_employee
export -f create