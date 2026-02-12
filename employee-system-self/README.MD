# PROJECT: Employee Management System

**Due: Tomorrow EOD**

  

## Project Description

Build a bash script that manages employee database with CRUD operations, auto-backup, and reporting.

  

---

  

## Features (MVP)

1. Interactive menu

2. Add/View/Update/Delete employees

3. Search employees

4. Auto backup every run

5. Daily report generation

  

---

  

## Database Schema

```sql

CREATE TABLE employees (

  id INT PRIMARY KEY AUTO_INCREMENT,

  name VARCHAR(100) NOT NULL,

  email VARCHAR(100) UNIQUE NOT NULL,

  department VARCHAR(50),

  salary DECIMAL(10,2),

  hire_date DATE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

```

  

---

  

## Sprint Tasks (Today → Tomorrow)

  

### Task 1: Setup (30 min) ✅

- [x] Create `employee_db` database  [completion:: 2026-02-12]

- [x] Create employees table  [completion:: 2026-02-12]

- [x] Insert 5 sample employees  [completion:: 2026-02-12]

- [x] Test: `SELECT * FROM employees;`  [completion:: 2026-02-12]

  

### Task 2: Config & Utils (30 min) ✅

- [x] Create `config.sh` (DB credentials)  [completion:: 2026-02-12]

- [x] Create `backup.sh` (mysqldump with timestamp)  [completion:: 2026-02-12]

- [x] Test: Run backup, check .sql file created  [completion:: 2026-02-12]

  

### Task 3: CRUD Operations (2 hours) ✅

- [x] Create `add_employee()` function  [completion:: 2026-02-12]

  - Input: name, email, dept, salary, hire_date

  - Validate: email not duplicate

- [x] Create `view_employees()` function  [completion:: 2026-02-12]

  - Display all in table format

- [x] Create `search_employee()` function  [completion:: 2026-02-12]

  - Search by name or email (LIKE)

- [x] Create `update_employee()` function  [completion:: 2026-02-12]

  - Get ID, update salary/department

- [x] Create `delete_employee()` function  [completion:: 2026-02-12]

  - Get ID, confirm, delete

  

### Task 4: Main Menu (1 hour) ✅

- [x] Create `main.sh` with menu:  [completion:: 2026-02-12]

  ```

  1. Add Employee

  2. View All

  3. Search

  4. Update

  5. Delete

  6. Generate Report

  7. Exit

  ```

- [x] Each option calls function  [completion:: 2026-02-12]

- [x] Loop until exit  [completion:: 2026-02-12]

- [x] Run backup on exit  [completion:: 2026-02-12]

  

### Task 5: Reporting (1 hour) ✅

- [x] Create `generate_report()` function  [completion:: 2026-02-12]

  - Total employees

  - Average salary

  - Employees per department

  - Recent hires (last 7 days)

  - Save to `reports/report_YYYYMMDD.txt`

  

### Task 6: Testing & Cleanup (30 min) ✅

- [x] Test all menu options  [completion:: 2026-02-12]

- [x] Test edge cases (duplicate email, invalid ID)  [completion:: 2026-02-12]

- [x] Add error messages  [completion:: 2026-02-12]

- [x] Create README.md with usage  [completion:: 2026-02-12]

  

---

  

## File Structure

```

employee-system/

├── config.sh

├── backup.sh

├── main.sh

├── backups/

└── reports/

```

  

---

  

## Bash Concepts Covered

✅ Variables & user input

✅ Functions

✅ Conditionals (if/else)

✅ Loops (menu loop)

✅ MySQL queries from bash

✅ Read CSV/input

✅ File operations (backup)

✅ Date/time formatting

✅ Error handling

✅ String manipulation

  

---

  

## Success Criteria

- [x] Can add employee via menu  [completion:: 2026-02-12]

- [x] Can view all employees formatted  [completion:: 2026-02-12]

- [x] Can search by name  [completion:: 2026-02-12]

- [x] Can update salary  [completion:: 2026-02-12]

- [x] Can delete employee  [completion:: 2026-02-12]

- [x] Backup created on exit  [completion:: 2026-02-12]

- [x] Report shows correct stats  [completion:: 2026-02-12]

- [x] No crashes on invalid input  [completion:: 2026-02-12]

  

---

  

## Delivery

**Tomorrow EOD submit:**

- GitHub repo link

- README with setup instructions

- Demo video (1 min showing menu)