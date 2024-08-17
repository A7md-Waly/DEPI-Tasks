CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);





INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (1, 'Ahmed', 'Gamel', '2024-08-17'),
       (2, 'Alaa', 'Awd', '2022-01-10'),
	   (3, 'Osama', 'Yousef', '2024-05-12');


INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Data Engineering', 3),
       (102, 'Syber Security', 3),
       (103, 'Data Science', 4);


SELECT * FROM Students;

SELECT * FROM Courses;


UPDATE Courses
SET Credits = 4
WHERE CourseName = 'Data Engineering';


DELETE FROM Students
WHERE FirstName = 'Alaa' AND LastName = 'Awd';



SELECT * FROM Students
WHERE EnrollmentDate > '2023-09-01';


SELECT * FROM Courses
WHERE Credits > 3;



SELECT COUNT(*) TotalStudents FROM Students;

SELECT AVG(Credits) AverageCredits FROM Courses;



ALTER TABLE Courses ADD CONSTRAINT chk_Credits CHECK (Credits >= 0);

------------

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID)
VALUES (1, 1, 101),  
       (2, 3, 102); 
       
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
------------

CREATE FUNCTION GetCourseNameLength(@CourseName VARCHAR(100))
RETURNS INT
AS
BEGIN
    RETURN LEN(@CourseName);
END;


----------------

SELECT * FROM Students
WHERE StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.Credits > 3
);
-----------------------

CREATE VIEW StudentCourseView AS
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
------------------------------

CREATE INDEX idx_LastName ON Students(LastName);

--------------------------

begin try
	begin transaction

INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (3, 'Sherbo', 'Mohamed', '2024-02-16')

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (104, 'Data Analysis', 3)
end try
begin catch
	ROLLBACK
	
end catch;
-----------------------------------

CREATE TABLE diff_data (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Birthdate DATE,
    grade FLOAT,
);
----------------

INSERT INTO diff_data (ID, Name, Birthdate, grade)
VALUES (1, 'waly', '2015-05-20', 85.5),
       (2, 'lol', '2023-11-30', 90.0);


















