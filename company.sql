--CREATE DATABASE
CREATE DATABASE company_db;
--CREATE TABLE
CREATE TABLE employees(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  department_id INT
  );

CREATE TABLE departments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  dep_name VARCHAR(50)
  );

CREATE TABLE projects(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  project_name VARCHAR(50),
  employer_id
  );

--INSERT INTO
INSERT INTO employees(name,age)VALUES
('John',31), --1
('Anna',24), --2
('Georgia', 27), --3
('Katseye', 27),  --4
('Timu',19), --5
('Sofia', 18);  --6

INSERT INTO departments(dep_name)VALUES
('It'), --1
('Finance'),  --2
('Marketing'),  --3
('Cybersecurity');  --4

INSERT INTO projects(project_name)VALUES
('App'),  --1
('Safety'),  --2
('Social-Media'),  --3
('Cash');  --4

--UPDATE TABLE
UPDATE employees
SET department_id = 2
WHERE name = 'John' AND age = 31;

UPDATE employees
SET department_id = 1
WHERE name LIKE '%A%';

UPDATE employees
SET department_id = 3
WHERE id = 4 or name = 'Katseye';

UPDATE employees
SET department_id = 4
WHERE id = 3;

UPDATE employees
SET department_id = 1
WHERE id = 6 or name = 'Sofia';

UPDATE employees
SET department_id = 2
WHERE id = 5;

/* ('John',31), --1, 2(department_id)
('Anna',24), --2, 1(department_id)
('Georgia', 27), --3. 4(department_id)
('Katseye', 27),  --4. 3(department_id)
('Timu',19), --5, 2(department_id)
('Sofia', 18);  --6, 1(department_id)*/

--ALTER TABLE
ALTER TABLE projects
DROP COLUMN employer_id;

ALTER TABLE employees
ADD COLUMN project_id INT;

--UPDATE TABLE
UPDATE employees
SET project_id = 1
WHERE name = 'Anna';

UPDATE employees
SET project_id = 2
WHERE name = 'John';

UPDATE employees
SET project_id = 3
WHERE name = 'Katseye' and age=27;

UPDATE employees
SET project_id = 4
WHERE name = 'Georgia';

UPDATE employees
SET project_id = 1
WHERE name = 'Sofia';

UPDATE employees
SET project_id = 2
WHERE age = 19;

--WHERE FUNCTION
SELECT * FROM employees
WHERE age>24;

--AVG FUNCTION
SELECT AVG(age) AS average_age FROM employees;
--GROUP BY
SELECT project_id,COUNT(name) FROM employees
GROUP BY project_id;
--LIMIT
SELECT * FROM projects
LIMIT 2;
--INSERT INTO
INSERT INTO projects(project_name)VALUES
('Cash');
--DISTINCT
SELECT DISTINCT project_name FROM projects;
--INNER JOIN
SELECT employees.name, departments.dep_name FROM employees
INNER JOIN departments
ON employees.deparments_id = departments.id;
