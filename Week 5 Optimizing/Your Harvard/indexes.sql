create index students_id on students(id);

-- Indexes for courses table
create index courses_department_number_semester on courses(department, number, semester);
create index courses_title_semester on courses(title, semester);

-- Indexes for enrollments table
create index enrollments_student_id on enrollments(student_id);
create index enrollments_course_id on enrollments(course_id);

-- Indexes for satisfies table
create index satisfies_course_id on satisfies(course_id);
create index satisfies_requirement_id on satisfies(requirement_id);

-- Indexes for queries involving students and enrollments
create index enrollments_student_id_course_id on enrollments(student_id, course_id);

-- Indexes for queries involving courses and enrollments
create index enrollments_course_id_student_id on enrollments(course_id, student_id);

-- Indexes for queries involving courses and satisfies
create index satisfies_course_id_requirement_id on satisfies(course_id, requirement_id);

-- Indexes for queries involving requirements and satisfies
create index satisfies_requirement_id_course_id on satisfies(requirement_id, course_id);
