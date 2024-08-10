CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INTEGER REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL
);

CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(employee_id),
    project_id INTEGER REFERENCES projects(project_id),
    hours_worked INTEGER NOT NULL
);
--------------------------------------------

INSERT INTO departments (department_name) VALUES 
('Human Resources'), 
('Engineering'), 
('Marketing');

INSERT INTO employees (first_name, last_name, department_id) VALUES 
('John', 'Doe', 1), 
('Jane', 'Smith', 2), 
('Alice', 'Johnson', 3), 
('Bob', 'Brown', 2);

INSERT INTO projects (project_name) VALUES 
('Project Alpha'), 
('Project Beta'), 
('Project Gamma');

INSERT INTO assignments (employee_id, project_id, hours_worked) VALUES 
(1, 1, 20), 
(2, 2, 30), 
(3, 3, 25), 
(4, 1, 15), 
(2, 3, 10);

--------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
-------------------------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

------------------------
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
FULL OUTER JOIN employees e ON d.department_id = e.department_id;

--------------
SELECT e.first_name, p.project_name
FROM employees e
CROSS JOIN projects p;
-------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
NATURAL JOIN departments d;



