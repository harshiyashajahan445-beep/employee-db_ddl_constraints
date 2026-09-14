-- Create the database container named 'employee'
CREATE DATABASE IF NOT EXISTS employee;

USE employee;
-- Create the 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
-- Create the 'location' table
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);
-- Create the 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2)
);

-- ALTER
ALTER TABLE employees 
ADD COLUMN email VARCHAR(100);

ALTER TABLE employees 
MODIFY COLUMN designation VARCHAR(255);

ALTER TABLE employees 
DROP COLUMN age;

ALTER TABLE employees 
RENAME COLUMN hire_date TO date_of_joining;

-- rename
RENAME TABLE departments TO Departments_Info;

RENAME TABLE location TO Locations;

-- truncate
-- Remove all row records from the employees table while maintaining its structure
TRUNCATE TABLE employees;

-- DROP 
-- Delete the employees table permanently
DROP TABLE IF EXISTS employees;

-- Delete the entire employee database
DROP DATABASE IF EXISTS employee;

