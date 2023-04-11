-- Create 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    student_email VARCHAR(50)
);

-- Create 'classrooms' table
CREATE TABLE classrooms (
    classroom_id INT PRIMARY KEY,
    classroom_name VARCHAR(50),
    classroom_location VARCHAR(50)
);

-- Create 'courses' table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    course_duration INT
);

-- Create 'subjects' table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    subject_duration INT
);

-- Create 'schedules' table
CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY,
    schedule_start_time DATETIME,
    schedule_end_time DATETIME
);

-- Create 'students_classrooms' table
CREATE TABLE students_classrooms (
    student_classroom_id INT PRIMARY KEY,
    student_id INT,
    classroom_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id)
);

-- Create 'classroom_course_association' table
CREATE TABLE classroom_course_association (
    classroom_course_id INT PRIMARY KEY,
    classroom_id INT,
    course_id INT,
    schedule_id INT,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);

-- Create 'subjects_course_association' table
CREATE TABLE subjects_course_association (
    subject_course_id INT PRIMARY KEY,
    subject_id INT,
    course_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);