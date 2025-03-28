-- 1112. Highest Grade For Each Student

/*
Write a SQL query to find the highest grade with its corresponding course for each student.
    In case of a tie, you should find the course with the smallest course_id.
    The output must be sorted by increasing student_id.

Enrollments table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 2          | 2         | 95    |
| 2          | 3         | 95    |
| 1          | 1         | 90    |
| 1          | 2         | 99    |
| 3          | 1         | 80    |
| 3          | 2         | 75    |
| 3          | 3         | 82    |
+------------+-----------+-------+


Result table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 1          | 2         | 99    |
| 2          | 2         | 95    |
| 3          | 3         | 82    |
+------------+-----------+-------+

*/

-- use RANK() and pull results where rank = 1

WITH ranked_stud AS (
    SELECT student_id, course_id, grade, 
        dense_rank() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rnk
    FROM Enrollments
)

SELECT student_id, course_id, grade
FROM ranked_stud
WHERE rnk = 1
ORDER BY 1;

-- OR

SELECT student_id, course_id, grade
FROM (SELECT student_id, course_id, grade, dense_rank() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rnk
    FROM Enrollments) subq
WHERE rnk = 1
ORDER BY 1;