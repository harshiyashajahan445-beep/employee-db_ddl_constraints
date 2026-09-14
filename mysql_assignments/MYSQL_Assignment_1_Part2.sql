-- Ensuring clean database setup
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- Create 'departments' table
-- Constraints applied: 
-- 1. department_id is UNIQUE Primary Key
-- 2. department_name cannot be NULL and must be UNIQUE
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create 'location' table
-- Constraints applied:
-- 1. location_id should automatically increments sequentially (AUTO_INCREMENT)
-- 2. location string cannot be NULL and must be UNIQUE
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- Create 'employees' table
-- Constraints applied:
-- 1. employee_id is UNIQUE Primary Key
-- 2. employee_name cannot be NULL
-- 3. gender is restricted strictly to 'M' or 'F' via ENUM
-- 4. age must be >= 18 via CHECK constraint
-- 5. hire_date automatically takes today's date if omitted
-- 6. department_id & location_id enforce Foreign Key links to parent tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    CONSTRAINT fk_employee_department 
        FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_employee_location 
        FOREIGN KEY (location_id) REFERENCES location(location_id)
);

DESCRIBE employees;
