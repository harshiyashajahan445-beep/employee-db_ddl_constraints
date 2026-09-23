USE employee;
SELECT * FROM employees;

-- 1. Distinct

SELECT DISTINCT salary 
FROM employees;

-- 2. Alias

SELECT age AS Employee_Age, 
 salary AS Employee_Salary 
FROM employees;

-- 3a. Retrieve employees with salary > 50000 hired before 2016-01-01
SELECT * 
FROM employees 
WHERE salary > 50000 
  AND hire_date < '2016-01-01';
-- WHERE Clause & Operators
-- 3b. Find employees whose designation is missing and set to "Data Scientist"
UPDATE employees 
SET designation = 'Data Scientist' 
WHERE designation IS NULL OR designation = '';

SET SQL_SAFE_UPDATES = 0;

-- Step 2: Run your UPDATE query again
UPDATE employees 
SET designation = 'Data Scientist' 
WHERE designation IS NULL OR designation = '';

SET SQL_SAFE_UPDATES = 1;

-- Sorting and Grouping Data
-- ORDER BY: Sort by department_id ASC and salary DESC
SELECT * 
FROM employees 
ORDER BY department_id ASC, salary DESC;

-- LIMIT: Display first 5 employees hired in 2018
SELECT * 
FROM employees 
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC 
LIMIT 5;

-- Aggregate Functions: Sum of salaries in Finance department
SELECT SUM(e.salary) AS total_finance_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Aggregate Functions: Minimum age among all employees
SELECT MIN(age) AS minimum_age 
FROM employees;

-- GROUP BY: Maximum salary for each location
SELECT l.location_id, 
       l.location, 
       MAX(e.salary) AS max_salary
FROM location l
LEFT JOIN employees e ON l.location_id = e.location_id
GROUP BY l.location_id, l.location;

-- GROUP BY: Average salary for designations containing 'Analyst'
SELECT designation, 
       AVG(salary) AS avg_salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

-- HAVING: Departments with less than 3 employees
SELECT d.department_id, 
       d.department_name, 
       COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;

-- HAVING: Locations with female employees whose average age is below 30
SELECT l.location_id, 
       l.location, 
       AVG(e.age) AS avg_female_age
FROM location l
JOIN employees e ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY l.location_id, l.location
HAVING AVG(e.age) < 30;

-- Joins
-- Inner Join: Employee names, designations, and department names
SELECT e.employee_name, 
       e.designation, 
       d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- Left Join: All departments with total employee count
SELECT d.department_id, 
       d.department_name, 
       COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Right Join: All locations with assigned employee names
SELECT e.employee_name, 
       l.location
FROM employees e
RIGHT JOIN location l ON e.location_id = l.location_id;
