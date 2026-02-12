#!/usr/bin/env bash
set -e
# Import configuration
source ./config.sh
# Function to view all employees
view_employees() {
    execute_query_return "
    SELECT * 
    FROM employees;"
}

search_employee() {
    execute_query_return "
    SELECT * 
    FROM employees
    WHERE name LIKE '$1%' OR email LIKE '%$1%';"
}
get_employee_by_id() {
    execute_query_return "
    SELECT id
    FROM employees
    WHERE id = $1;"
}
generate_report() {
    # Generate a simple report of employee count and average salary
    echo -e "\n--- Employee Report ---\n"
    local total_employees=$(execute_query_return "SELECT COUNT(*) FROM employees;")
    local average_salary=$(execute_query_return "SELECT AVG(salary) FROM employees;")
    local employees_by_department=$(execute_query_return "SELECT COUNT(*), department
        from employees
        GROUP BY department;")
    local recent_hires=$(execute_query_return "SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
  AND hire_date < CURDATE();;")

    echo "Total Employees: $total_employees"
    echo "Average Salary: $average_salary"
    echo -e "\nEmployees by Department:\n$employees_by_department"
    echo -e "\nRecent Hires (Last 7 Days):\n$recent_hires"
}
export -f view_employees
export -f search_employee
export -f get_employee_by_id
export -f generate_report