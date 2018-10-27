#1. List the name of the student with id equal to v1 (id).
SELECT name
FROM Student
WHERE id = 482081;
 
#2. List the names of students with id in the range of v2(id) to v3 (inclusive)
SELECT name
FROM Student 
WHERE id BETWEEN 205000 AND 205181;

#3. List the names of the students who have taken course v4 (crsCode).
SELECT s.name
FROM Transcript t
INNER JOIN Student s ON t.studId = s.id
WHERE t.crsCode = 166690;

#4. List the names of students who have taken a course taught by professor v5 (name)
SELECT s.name
FROM Transcript t
INNER JOIN (Teaching te, Professor p, Student s) ON (t.crsCode = te.crsCode AND te.profId = p.id AND t.studId = s.id)
WHERE p.name = 'name996317';

#5. List the names of students who have taken a course from department v6(deptId), but not v7.
CREATE VIEW SinD AS SELECT s.id, c.deptid AS did
     FROM Transcript t 
     INNER JOIN Student s ON t.studId = s.id
     INNER JOIN Course c ON t.crsCode = c.crsCode;
SELECT s.name
FROM Student s 
WHERE s.id IN
     (SELECT id
      FROM SinD
     WHERE did = 80028
    )
    AND s.id NOT IN 
    (SELECT id
     FROM SinD
     WHERE did = 971318
    );

#6. List the names of students who have taken all courses offered by department v8 (deptId)
SELECT st.name
FROM 
    (SELECT s.id, s.name, COUNT(DISTINCT c.crsCode) AS courses
     FROM Transcript t
     INNER JOIN Student s ON t.studId = s.id
     INNER JOIN Course c ON t.crsCode = c.crsCode
     WHERE c.deptid = 25784  
     GROUP BY s.id
    ) AS st
WHERE st.courses IN
    (SELECT COUNT(*)
     FROM Course c
     WHERE c.deptid = 25784
    ); 
