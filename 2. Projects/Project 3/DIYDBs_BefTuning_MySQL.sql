#1. List the name of the student with id equal to v1 (id).
SELECT SQL_NO_CACHE s.name
FROM Student s
WHERE (s.id = 482081);
 
#2. List the names of students with id in the range of v2(id) to v3 (inclusive)
SELECT SQL_NO_CACHE s.name
FROM Student s
WHERE (s.id <= 205181) AND (s.id >= 205000);

#3. List the names of the students who have taken course v4 (crsCode).
SELECT SQL_NO_CACHE s.name
FROM Transcript t
INNER JOIN Course c ON t.crsCode = c.crsCode
INNER JOIN Student s ON t.studId = s.id
WHERE c.crsCode = 166690;

#4. List the names of students who have taken a course taught by professor v5 (name)
SELECT SQL_NO_CACHE s.name
FROM Transcript t
INNER JOIN Teaching te ON t.crsCode = te.crsCode
INNER JOIN Professor p ON te.profId = p.id
INNER JOIN Student s ON t.studId = s.id
WHERE p.name = 'name996317';

#5. List the names of students who have taken a course from department v6(deptId), but not v7.
SELECT SQL_NO_CACHE s.name
FROM Transcript t
INNER JOIN Student s ON t.studId = s.id
INNER JOIN Course c ON t.crsCode = c.crsCode
WHERE (s.id IN 
    (SELECT s.id
     FROM Transcript t 
     INNER JOIN Student s ON t.studId = s.id
     INNER JOIN Course c ON t.crsCode = c.crsCode
     INNER JOIN Department d ON c.deptId = d.id
     WHERE d.id = 80028
    ))	
    AND (s.id NOT IN 
    (SELECT s.id
     FROM Transcript t 
     INNER JOIN Student s ON t.studId = s.id
     INNER JOIN Course c ON t.crsCode = c.crsCode
     INNER JOIN Department d ON c.deptId = d.id
     WHERE d.id = 971318
    ))
GROUP BY s.id;

#6. List the names of students who have taken all courses offered by department v8 (deptId)
SELECT SQL_NO_CACHE s.name
FROM 
    (SELECT ss.id, COUNT(*) AS courses
     FROM
         (SELECT s.id, c.crsCode, d.id AS did
          FROM Transcript t
          INNER JOIN Student s ON t.studId = s.id
          INNER JOIN Course c ON t.crsCode = c.crsCode
          INNER JOIN Department d ON c.deptId = d.id
          GROUP BY s.id, c.crsCode  
         ) AS ss
     WHERE ss.did = 25784
     GROUP BY ss.id
    ) AS st
INNER JOIN Student s ON st.id = s.id
WHERE st.courses IN
    (SELECT COUNT(*)
     FROM Course c
     INNER JOIN Department d ON c.deptId = d.id
     WHERE d.id = 25784
    ); 
