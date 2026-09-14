# employee-db_ddl_constraints
DDL Commands, Alterations, and Constraints
# Employee Database (MySQL DDL & Relational Constraints)

This project focuses on designing and implementing a relational schema for an employee management system using MySQL Workbench. It demonstrates fundamental  (DDL) operations, structure modifications, and constraints.

## Repository Contents

* **`mysql_assignment1.sql`**: Covers initial table creations, structural updates using `ALTER`, column renames, table truncation, and `DROP` commands.
* **`MySQL_Assignment_Part2.sql`**: Contains the complete schema recreation featuring relational constraints (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, and `DEFAULT`).

## Database Structure & Schema
The schema connects three central entities:

1. **`departments`**: Holds department records with non-null and unique name requirements.
2. **`location`**: Manages office locations using sequential auto-incrementing identifiers.
3. **`employees`**: Stores core personnel details, enforcing age limits (`>= 18`) and automatic current-date entries for joining dates.

### Implemented Relational Logic
* **Foreign Key References**: Establishes links from `employees.department_id` and `employees.location_id` to their respective parent tables.
* **Data Validation**: Enforces column-level data integrity constraints directly within table creation scripts.

## Setup & Execution

1. Launch **MySQL Workbench** and establish a local database connection.
2. Execute `mysql_assignment1.sql` sequentially to review basic schema operations and modifications.
3. Run `MySQL_Assignment_Part2.sql` to generate the finalized relational schema with full constraint enforcement.
4. Run `DESCRIBE employees;` to inspect field definitions and primary/foreign key mappings.
