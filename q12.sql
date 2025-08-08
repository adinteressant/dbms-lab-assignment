CREATE TABLE student_courses_1nf (
    student_id INT,
    student_name TEXT,
    course_id TEXT,
    course_name TEXT,
    instructor_name TEXT,
    instructor_dept TEXT,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_courses_1nf VALUES 
(1, 'Alice Smith', 'CS101', 'Programming', 'Dr. Johnson', 'Computer Science', 'A'),
(1, 'Alice Smith', 'MATH201', 'Calculus', 'Dr. Wilson', 'Mathematics', 'B'),
(2, 'Bob Davis', 'CS101', 'Programming', 'Dr. Johnson', 'Computer Science', 'B+'),
(3, 'Carol Brown', 'MATH201', 'Calculus', 'Dr. Wilson', 'Mathematics', 'A-');

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name TEXT NOT NULL
);

CREATE TABLE courses (
    course_id TEXT PRIMARY KEY,
    course_name TEXT NOT NULL,
    instructor_name TEXT NOT NULL,
    instructor_dept TEXT NOT NULL
);

CREATE TABLE enrollments (
    student_id INT,
    course_id TEXT,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert 2NF data
INSERT INTO students VALUES 
(1, 'Alice Smith'), (2, 'Bob Davis'), (3, 'Carol Brown');

INSERT INTO courses VALUES 
('CS101', 'Programming', 'Dr. Johnson', 'Computer Science'),
('MATH201', 'Calculus', 'Dr. Wilson', 'Mathematics');

INSERT INTO enrollments VALUES 
(1, 'CS101', 'A'), (1, 'MATH201', 'B'), 
(2, 'CS101', 'B+'), (3, 'MATH201', 'A-');

-- 3NF DECOMPOSITION - Remove transitive dependencies
CREATE TABLE students_3nf (
    student_id INT PRIMARY KEY,
    student_name TEXT NOT NULL
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name TEXT NOT NULL,
    instructor_dept TEXT NOT NULL
);

CREATE TABLE courses_3nf (
    course_id TEXT PRIMARY KEY,
    course_name TEXT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments_3nf (
    student_id INT,
    course_id TEXT,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students_3nf(student_id),
    FOREIGN KEY (course_id) REFERENCES courses_3nf(course_id)
);

-- Insert 3NF data
INSERT INTO students_3nf VALUES 
(1, 'Alice Smith'), (2, 'Bob Davis'), (3, 'Carol Brown');

INSERT INTO instructors VALUES 
(101, 'Dr. Johnson', 'Computer Science'),
(102, 'Dr. Wilson', 'Mathematics');

INSERT INTO courses_3nf VALUES 
('CS101', 'Programming', 101),
('MATH201', 'Calculus', 102);

INSERT INTO enrollments_3nf VALUES 
(1, 'CS101', 'A'), (1, 'MATH201', 'B'), 
(2, 'CS101', 'B+'), (3, 'MATH201', 'A-');

-- VERIFICATION QUERY - Reconstruct original view
SELECT 
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name,
    i.instructor_name,
    i.instructor_dept,
    e.grade
FROM students_3nf s
JOIN enrollments_3nf e ON s.student_id = e.student_id
JOIN courses_3nf c ON e.course_id = c.course_id
JOIN instructors i ON c.instructor_id = i.instructor_id
ORDER BY s.student_id, c.course_id;
