--2356. Number of Unique Subjects Taught by Each Teacher
SELECT DISTINCT teacher_id, COUNT(DISTINCT subject_ID) AS cnt
FROM Teacher 
GROUP BY teacher_id;