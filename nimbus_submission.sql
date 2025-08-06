-- ============================================
-- Department-Course Task (Revised for Existing Schema)
-- ============================================

-- ============
-- PART A: Create Courses Table (Foreign Key on dept_name)
-- ============

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_name VARCHAR(50),
    FOREIGN KEY (dept_name) REFERENCES Departments(dept_name)
);

-- ============
-- PART B: Insert Sample Data into Courses Table
-- ============

INSERT INTO Courses (course_id, course_name, dept_name) VALUES
(101, 'DBMS', 'Computer Science'),
(102, 'Operating Systems', 'Computer Science'),
(103, 'Power Systems', 'Electrical'),
(104, 'Digital Circuits', 'Electrical'),
(105, 'Thermodynamics', 'Mechanical'),
(106, 'Fluid Mechanics', 'Mechanical'),
(107, 'Structural Engineering', 'Civil'),
(108, 'Surveying', 'Civil'),
(109, 'Embedded Systems', 'Electronics'),
(110, 'VLSI Design', 'Electronics');

-- ============
-- PART C: Retrieve Departments Offering More Than Two Courses
-- ============

SELECT dept_name
FROM Departments
WHERE dept_name IN (
    SELECT dept_name
    FROM Courses
    GROUP BY dept_name
    HAVING COUNT(*) > 2
);

-- ============
-- PART D: Grant SELECT Access on Courses Table to viewer_user
-- ============

GRANT SELECT ON Courses TO viewer_user;
