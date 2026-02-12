#!/usr/bin/env bash
set -e

validate_salary() {
    if [[ -z "$1" ]] || ! [[ "$1" =~ ^[0-9]+$ ]]; 
    then
        echo "Salary is required and must be a number. Please try again."
        return 1
    else
        return 0
    fi
}
export -f validate_salary