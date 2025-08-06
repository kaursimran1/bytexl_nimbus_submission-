-- Drop tables if they already exist
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Departments;

-- Create Departments table (3NF)
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE -- ensures no duplicate names
);

-- Create Courses table (3NF)
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert sample departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics');

-- Insert sample courses (at least 2 per department)
INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'DBMS', 1),
(102, 'Operating Systems', 1),
(103, 'Power Systems', 2),
(104, 'Digital Circuits', 2),
(105, 'Thermodynamics', 3),
(106, 'Fluid Mechanics', 3),
(107, 'Structural Engineering', 4),
(108, 'Surveying', 4),
(109, 'Embedded Systems', 5),
(110, 'VLSI Design', 5);
-- Get department names that offer more than two courses
SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);
-- Just run the query directly (no GRANT needed)
SELECT * FROM Courses;
