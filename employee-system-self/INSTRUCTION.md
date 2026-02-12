# Employee System - Quick Start Guide

## Setup

### 1. Create `.env` file
Create a file named `.env` in the `employee-system` folder with your database details:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=satelkermel123
DB_NAME=bash_fcc
DB_PORT=3306
```

### 2. Make scripts executable
```bash
chmod +x main.sh config.sh backup.sh
chmod +x seed/seed.sh
```

## How to Use

### Run the main menu
```bash
./main.sh
```

### Run backups
```bash
./backup.sh
```

### Test database connection
```bash
source config.sh
test_connection
```

## Available Functions (in config.sh)

### Execute a query (no results)
```bash
source config.sh
execute_query "INSERT INTO employees (name, email) VALUES ('John', 'john@example.com')"
execute_query "DELETE FROM employees WHERE id=5"
```

### Execute a query (get results)
```bash
source config.sh
result=$(execute_query_return "SELECT * FROM employees")
echo "$result"
```

### Check database connection
```bash
source config.sh
test_connection
```

## File Structure

| File | Purpose |
|------|---------|
| `main.sh` | Main menu for employee management |
| `config.sh` | Database configuration & functions |
| `backup.sh` | Backup database |
| `backup.sh` | Restore backups |
| `seed/seed.sh` | Add sample data |

## Troubleshooting

**Connection failed?**
- Check `.env` file exists and has correct credentials
- Verify MySQL is running
- Run: `test_connection`

**Permission denied?**
- Make scripts executable: `chmod +x *.sh`

**Commands not found?**
- Make sure you run: `source config.sh` first
