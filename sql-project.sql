-- Step 1: Create the Employees Table without the department_id foreign key
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(15, 2) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Step 2: Create the Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT,
    CONSTRAINT fk_manager
        FOREIGN KEY(manager_id)
        REFERENCES employees(employee_id)
);

-- Step 3: Alter the Employees Table to add the department_id foreign key
ALTER TABLE employees
ADD COLUMN department_id INT,
ADD CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id);

-- Step 4: Create the Projects Table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(20, 2)
);

-- Step 5: Create the Assignments Table
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    hours_worked INT CHECK (hours_worked >= 0),
    role VARCHAR(50),
    assignment_date DATE NOT NULL,
    CONSTRAINT fk_employee
        FOREIGN KEY(employee_id) 
        REFERENCES employees(employee_id),
    CONSTRAINT fk_project
        FOREIGN KEY(project_id) 
        REFERENCES projects(project_id)
);

-- Step 6: Create the Department Managers Relation Table
CREATE TABLE department_managers (
    department_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_department_manager
        FOREIGN KEY(department_id)
        REFERENCES departments(department_id),
    CONSTRAINT fk_manager_employee
        FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id)
);

-- Step 7: Insert Data into Departments Table
INSERT INTO departments (department_name, location, manager_id)
VALUES 
('Human Resources', 'New York', NULL),
('Engineering', 'San Francisco', NULL),
('Marketing', 'Los Angeles', NULL),
('Sales', 'Chicago', NULL),
('Finance', 'Boston', NULL);

-- Step 8: Insert Data into Employees Table
INSERT INTO employees (first_name, last_name, department_id, hire_date, salary, email)
VALUES 
('John', 'Doe', 2, '2018-05-10', 75000, 'john.doe@company.com'),
('Jane', 'Smith', 3, '2019-03-15', 80000, 'jane.smith@company.com'),
('Michael', 'Brown', 1, '2020-11-01', 60000, 'michael.brown@company.com'),
('Emily', 'Davis', 2, '2017-02-23', 95000, 'emily.davis@company.com'),
('William', 'Jones', 4, '2021-07-20', 55000, 'william.jones@company.com'),
('Jessica', 'Wilson', 5, '2016-09-30', 72000, 'jessica.wilson@company.com'),
('Daniel', 'Garcia', 3, '2018-01-18', 78000, 'daniel.garcia@company.com');

-- Step 9: Insert Data into Projects Table
INSERT INTO projects (project_name, start_date, end_date, budget)
VALUES 
('Project Alpha', '2022-01-01', '2022-12-31', 500000),
('Project Beta', '2023-02-15', NULL, 300000),
('Project Gamma', '2021-06-01', '2022-05-31', 750000),
('Project Delta', '2022-09-01', '2023-08-31', 400000),
('Project Epsilon', '2020-03-01', '2021-02-28', 600000);

-- Step 10: Insert Data into Assignments Table
INSERT INTO assignments (employee_id, project_id, hours_worked, role, assignment_date)
VALUES 
(1, 1, 150, 'Developer', '2022-01-10'),
(2, 2, 200, 'Team Lead', '2023-02-20'),
(3, 3, 100, 'HR Specialist', '2021-06-10'),
(4, 4, 250, 'Senior Developer', '2022-09-05'),
(5, 5, 180, 'Sales Manager', '2020-03-05'),
(1, 2, 50, 'Developer', '2023-03-01'),
(6, 3, 120, 'Financial Analyst', '2021-07-01');

-- Step 11: Assign Managers to Departments
INSERT INTO department_managers (department_id, employee_id, start_date)
VALUES 
(1, 3, '2020-11-01'),
(2, 4, '2017-02-23'),
(3, 2, '2019-03-15'),
(4, 5, '2021-07-20'),
(5, 6, '2016-09-30');
-- Step 1: Create the Employees Table without the department_id foreign key
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(15, 2) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Step 2: Create the Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT,
    CONSTRAINT fk_manager
        FOREIGN KEY(manager_id)
        REFERENCES employees(employee_id)
);

-- Step 3: Alter the Employees Table to add the department_id foreign key
ALTER TABLE employees
ADD COLUMN department_id INT,
ADD CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id);

-- Step 4: Create the Projects Table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(20, 2)
);

-- Step 5: Create the Assignments Table
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    hours_worked INT CHECK (hours_worked >= 0),
    role VARCHAR(50),
    assignment_date DATE NOT NULL,
    CONSTRAINT fk_employee
        FOREIGN KEY(employee_id) 
        REFERENCES employees(employee_id),
    CONSTRAINT fk_project
        FOREIGN KEY(project_id) 
        REFERENCES projects(project_id)
);

-- Step 6: Create the Department Managers Relation Table
CREATE TABLE department_managers (
    department_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_department_manager
        FOREIGN KEY(department_id)
        REFERENCES departments(department_id),
    CONSTRAINT fk_manager_employee
        FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id)
);

-- Step 7: Insert Data into Departments Table
INSERT INTO departments (department_name, location, manager_id)
VALUES 
('Human Resources', 'New York', NULL),
('Engineering', 'San Francisco', NULL),
('Marketing', 'Los Angeles', NULL),
('Sales', 'Chicago', NULL),
('Finance', 'Boston', NULL);

-- Step 8: Insert Data into Employees Table
INSERT INTO employees (first_name, last_name, department_id, hire_date, salary, email)
VALUES 
('John', 'Doe', 2, '2018-05-10', 75000, 'john.doe@company.com'),
('Jane', 'Smith', 3, '2019-03-15', 80000, 'jane.smith@company.com'),
('Michael', 'Brown', 1, '2020-11-01', 60000, 'michael.brown@company.com'),
('Emily', 'Davis', 2, '2017-02-23', 95000, 'emily.davis@company.com'),
('William', 'Jones', 4, '2021-07-20', 55000, 'william.jones@company.com'),
('Jessica', 'Wilson', 5, '2016-09-30', 72000, 'jessica.wilson@company.com'),
('Daniel', 'Garcia', 3, '2018-01-18', 78000, 'daniel.garcia@company.com');

-- Step 9: Insert Data into Projects Table
INSERT INTO projects (project_name, start_date, end_date, budget)
VALUES 
('Project Alpha', '2022-01-01', '2022-12-31', 500000),
('Project Beta', '2023-02-15', NULL, 300000),
('Project Gamma', '2021-06-01', '2022-05-31', 750000),
('Project Delta', '2022-09-01', '2023-08-31', 400000),
('Project Epsilon', '2020-03-01', '2021-02-28', 600000);

-- Step 10: Insert Data into Assignments Table
INSERT INTO assignments (employee_id, project_id, hours_worked, role, assignment_date)
VALUES 
(1, 1, 150, 'Developer', '2022-01-10'),
(2, 2, 200, 'Team Lead', '2023-02-20'),
(3, 3, 100, 'HR Specialist', '2021-06-10'),
(4, 4, 250, 'Senior Developer', '2022-09-05'),
(5, 5, 180, 'Sales Manager', '2020-03-05'),
(1, 2, 50, 'Developer', '2023-03-01'),
(6, 3, 120, 'Financial Analyst', '2021-07-01');

-- Step 11: Assign Managers to Departments
INSERT INTO department_managers (department_id, employee_id, start_date)
VALUES 
(1, 3, '2020-11-01'),
(2, 4, '2017-02-23'),
(3, 2, '2019-03-15'),
(4, 5, '2021-07-20'),
(5, 6, '2016-09-30');
------------------------------------------------------


-- 1-Advanced Select Queries
SELECT e.first_name, e.last_name,a.hours_worked 
FROM employees e INNER JOIN assignments a
ON e.employee_id = a.employee_id;


SELECT e.employee_id, e.first_name || ' ' || e.last_name employee_name, 
       AVG(hours_worked) AS average_hours_worked
FROM employees e INNER JOIN assignments a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id, employee_name;


-- 2-Multiple Column Aliases
SELECT employees.employee_id, 
       first_name || ' ' || last_name employee_name, 
       hours_worked AS "Total Hours Worked", 
       department_name AS "Department"
FROM employees JOIN departments 
ON employees.department_id = departments.department_id
JOIN assignments 
ON employees.employee_id = assignments.employee_id;


-- 3-Complex Order By
SELECT employees.employee_id, 
       first_name || ' ' || last_name employee_name, 
       department_name, 
       hours_worked
FROM employees JOIN departments 
ON employees.department_id = departments.department_id
JOIN assignments 
ON employees.employee_id = assignments.employee_id
ORDER BY department_name ASC,hours_worked DESC;


-- 4-Distinct with Aggregation
SELECT DISTINCT department_name,
       COUNT(employee_id) OVER (PARTITION BY department_name) AS total_employees
FROM employees JOIN departments
ON employees.department_id = departments.department_id;
--------------------------------------------



--1-----

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name;

--2--------------------------------
SELECT e.first_name, e.last_name, d.department_name, a.hours_worked
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN assignments a ON e.employee_id = a.employee_id
WHERE 
    (d.department_name = 'Engineering' AND a.hours_worked > 50) 
    OR 
    (d.department_name = 'Marketing' AND a.hours_worked < 20);
---3----------------------------
SELECT e.employee_id, e.first_name, e.last_name, SUM(a.hours_worked) AS total_hours
FROM employees e
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING SUM(a.hours_worked) >= 100
ORDER BY total_hours DESC
LIMIT 5;

----4--------------------------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name, d.department_name;

--=5===========================================
WITH EngineeringProjectRange AS (
    SELECT MIN(a.project_id) AS min_project_id, MAX(a.project_id) AS max_project_id
    FROM assignments a
    JOIN employees e ON a.employee_id = e.employee_id
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = 'Engineering'
)
SELECT p.*
FROM projects p
WHERE p.project_id BETWEEN (SELECT min_project_id FROM EngineeringProjectRange) 
                      AND (SELECT max_project_id FROM EngineeringProjectRange);
--=6=================================

SELECT first_name, last_name, email
FROM employees
WHERE first_name LIKE '%J%'; 
--==7======================
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Human Resources';
----------------------------------


--1--Complex Joins Overview
--1.1------------
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
INNER JOIN departments d
ON e.department_id = d.department_id;



---1.2------------
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id;


--1.3-----------
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
right JOIN departments  d
ON e.department_id = d.department_id;

--1.4----------
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
FULL OUTER JOIN departments d 
ON e.department_id = d.department_id;

1.5------------
SELECT employee_id ,hire_date , salary , department_name
FROM Employees
CROSS JOIN departments; 

--1.6-------------
SELECT *
FROM Employees
NATURAL JOIN departments;


---2--Nested Joins with Table Aliases---
SELECT  d.department_name AS DepartmentName, p.project_name AS ProjectName
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
INNER JOIN Projects p ON p.department_id = d.department_id;


---3-- Inner Join with Aggregation
SELECT d.department_name, e.employee_id, 
SUM(p.hours_worked) AS TotalHoursWorked
FROM Employees e
INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN Projects p 
ON e.employee_id = p.employee_id
GROUP BY d.department_name, e.employee_id;



--4--Left Join with Conditional Logic
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name <> 'HR' OR d.department_name IS NULL;

---or----------
SELECT e.employee_id , d.department_name
FROM Employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IS NULL OR d.department_name <> 'HR';


---5--Self-Join with Complex Conditions
SELECT 
    a1.employee_id AS employee_1,
    a2.employee_id AS employee_2,
    a1.project_id,
    a1.hours_worked AS hours_worked_1,
    a2.hours_worked AS hours_worked_2
FROM  assignments a1
JOIN assignments a2 
ON a1.project_id = a2.project_id 
    AND a1.employee_id < a2.employee_id
    AND ABS(a1.hours_worked - a2.hours_worked) <= 5;



--6--Full Outer Join with Data Integrity Checks
SELECT employee_id ,hire_date , salary , department_name
FROM Employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id 
IS NULL OR d.department_id IS NULL;
--------------------------------------------



-- Step 1: Create the Employees Table without the department_id foreign key
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(15, 2) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Step 2: Create the Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT,
    CONSTRAINT fk_manager
        FOREIGN KEY(manager_id)
        REFERENCES employees(employee_id)
);

-- Step 3: Alter the Employees Table to add the department_id foreign key
ALTER TABLE employees
ADD COLUMN department_id INT,
ADD CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id);

-- Step 4: Create the Projects Table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(20, 2)
);

-- Step 5: Create the Assignments Table
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    hours_worked INT CHECK (hours_worked >= 0),
    role VARCHAR(50),
    assignment_date DATE NOT NULL,
    CONSTRAINT fk_employee
        FOREIGN KEY(employee_id) 
        REFERENCES employees(employee_id),
    CONSTRAINT fk_project
        FOREIGN KEY(project_id) 
        REFERENCES projects(project_id)
);

-- Step 6: Create the Department Managers Relation Table
CREATE TABLE department_managers (
    department_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_department_manager
        FOREIGN KEY(department_id)
        REFERENCES departments(department_id),
    CONSTRAINT fk_manager_employee
        FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id)
);

-- Step 7: Insert Data into Departments Table
INSERT INTO departments (department_name, location, manager_id)
VALUES 
('Human Resources', 'New York', NULL),
('Engineering', 'San Francisco', NULL),
('Marketing', 'Los Angeles', NULL),
('Sales', 'Chicago', NULL),
('Finance', 'Boston', NULL);

-- Step 8: Insert Data into Employees Table
INSERT INTO employees (first_name, last_name, department_id, hire_date, salary, email)
VALUES 
('John', 'Doe', 2, '2018-05-10', 75000, 'john.doe@company.com'),
('Jane', 'Smith', 3, '2019-03-15', 80000, 'jane.smith@company.com'),
('Michael', 'Brown', 1, '2020-11-01', 60000, 'michael.brown@company.com'),
('Emily', 'Davis', 2, '2017-02-23', 95000, 'emily.davis@company.com'),
('William', 'Jones', 4, '2021-07-20', 55000, 'william.jones@company.com'),
('Jessica', 'Wilson', 5, '2016-09-30', 72000, 'jessica.wilson@company.com'),
('Daniel', 'Garcia', 3, '2018-01-18', 78000, 'daniel.garcia@company.com');

-- Step 9: Insert Data into Projects Table
INSERT INTO projects (project_name, start_date, end_date, budget)
VALUES 
('Project Alpha', '2022-01-01', '2022-12-31', 500000),
('Project Beta', '2023-02-15', NULL, 300000),
('Project Gamma', '2021-06-01', '2022-05-31', 750000),
('Project Delta', '2022-09-01', '2023-08-31', 400000),
('Project Epsilon', '2020-03-01', '2021-02-28', 600000);

-- Step 10: Insert Data into Assignments Table
INSERT INTO assignments (employee_id, project_id, hours_worked, role, assignment_date)
VALUES 
(1, 1, 150, 'Developer', '2022-01-10'),
(2, 2, 200, 'Team Lead', '2023-02-20'),
(3, 3, 100, 'HR Specialist', '2021-06-10'),
(4, 4, 250, 'Senior Developer', '2022-09-05'),
(5, 5, 180, 'Sales Manager', '2020-03-05'),
(1, 2, 50, 'Developer', '2023-03-01'),
(6, 3, 120, 'Financial Analyst', '2021-07-01');

-- Step 11: Assign Managers to Departments
INSERT INTO department_managers (department_id, employee_id, start_date)
VALUES 
(1, 3, '2020-11-01'),
(2, 4, '2017-02-23'),
(3, 2, '2019-03-15'),
(4, 5, '2021-07-20'),
(5, 6, '2016-09-30');

-- Group 1: Complex Data Querying and Aggregation
-- 1-Advanced Select Queries
SELECT e.first_name, e.last_name,a.hours_worked 
FROM employees e INNER JOIN assignments a
ON e.employee_id = a.employee_id;


SELECT e.employee_id, e.first_name || ' ' || e.last_name employee_name, 
       AVG(hours_worked) AS average_hours_worked
FROM employees e INNER JOIN assignments a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id, employee_name;


-- 2-Multiple Column Aliases
SELECT employees.employee_id, 
       first_name || ' ' || last_name employee_name, 
       hours_worked AS "Total Hours Worked", 
       department_name AS "Department"
FROM employees JOIN departments 
ON employees.department_id = departments.department_id
JOIN assignments 
ON employees.employee_id = assignments.employee_id;


-- 3-Complex Order By
SELECT employees.employee_id, 
       first_name || ' ' || last_name employee_name, 
       department_name, 
       hours_worked
FROM employees JOIN departments 
ON employees.department_id = departments.department_id
JOIN assignments 
ON employees.employee_id = assignments.employee_id
ORDER BY department_name ASC,hours_worked DESC;


-- 4-Distinct with Aggregation
SELECT DISTINCT department_name,
       COUNT(employee_id) OVER (PARTITION BY department_name) AS total_employees
FROM employees JOIN departments
ON employees.department_id = departments.department_id;



-- Group 2: Advanced Filtering and Conditional Logic
-- 1-Where Clause with Subqueries
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name;

-- 2-Complex AND & OR Conditions
SELECT e.first_name, e.last_name, d.department_name, a.hours_worked
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN assignments a ON e.employee_id = a.employee_id
WHERE 
    (d.department_name = 'Engineering' AND a.hours_worked > 50) 
    OR 
    (d.department_name = 'Marketing' AND a.hours_worked < 20);

-- 3-Conditional Fetch with Complex Logic
SELECT e.employee_id, e.first_name, e.last_name, SUM(a.hours_worked) AS total_hours
FROM employees e
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING SUM(a.hours_worked) >= 100
ORDER BY total_hours DESC
LIMIT 5;

-- 4-Advanced In Clause
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN assignments a ON e.employee_id = a.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name, d.department_name;

-- 5-Complex Between Clause
WITH EngineeringProjectRange AS (
    SELECT MIN(a.project_id) AS min_project_id, MAX(a.project_id) AS max_project_id
    FROM assignments a
    JOIN employees e ON a.employee_id = e.employee_id
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = 'Engineering'
)
SELECT p.*
FROM projects p
WHERE p.project_id BETWEEN (SELECT min_project_id FROM EngineeringProjectRange) 
                      AND (SELECT max_project_id FROM EngineeringProjectRange);

-- 6-Pattern Matching with Like 
SELECT first_name, last_name, email
FROM employees
WHERE first_name LIKE '%J%';

-- 7-Is Null with Conditional Logic
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Human Resources';


-- Group 3: Complex Joins and Table Relationships
-- 1-Complex Joins Overview




-- Group 4: Data Integration and Analysis
-- 1-Cross Join with Conditional Logic
SELECT DISTINCT E.employee_id, 
 E.first_name || ' ' || E.last_name AS FullName, 
 P.project_id, P.project_name
FROM Employees AS E
CROSS JOIN Projects AS P
JOIN Assignments A ON E.employee_id = A.employee_id
JOIN Projects AS P2 ON A.project_id = P2.project_id 
WHERE P2.project_name LIKE CONCAT('%', SUBSTRING(P.project_name, 1, 3), '%');


-- 2-Natural Join with Data Validation
SELECT *
FROM employees NATURAL JOIN departments;

SELECT E.employee_id, 
  E.first_name||' '|| E.last_name AS FullName
FROM employees AS E
LEFT JOIN departments AS D 
  ON E.department_id = D.department_id
WHERE D.department_id IS NULL;
--3-Data Integration with Subqueries
SELECT E.first_name||' '|| E.last_name AS FullName,
  D.department_name,
  A.hours_worked
FROM employees AS E
JOIN departments AS D
ON E.department_id=D.department_id
JOIN assignments AS A
ON E.employee_id=A.employee_id;

--4 Final Data Analysis
--Calculate Payment per Hour
SELECT E.first_name||' ' || E.last_name AS FullName,
  D.department_name,
  ROUND(E.salary/A.hours_worked,2) AS hourPayment
FROM employees AS E
JOIN departments AS D
ON E.department_id=D.department_id
JOIN assignments AS A
ON E.employee_id=A.employee_id
ORDER BY hourPayment DESC;

-- employees with highest workload
SELECT
  D.department_name,
  SUM(A.hours_worked) AS hourWorkLoad
FROM employees AS E
JOIN departments AS D
ON E.department_id=D.department_id
JOIN assignments AS A
ON E.employee_id=A.employee_id
GROUP BY E.first_name ||' '|| E.last_name, D.department_name
ORDER BY hourWorkLoad DESC;




