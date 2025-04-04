--2004. The Number of Seniors and Juniors to Join the Company
WITH SeniorCTE AS (
    SELECT
        employee_id,
        SUM(salary) OVER (ORDER BY salary, employee_id) AS cumulative_salary
    FROM Candidates
    WHERE experience = 'Senior'
),
MaxSeniorSalary AS (
    SELECT
        MAX(cumulative_salary) AS max_senior_salary
    FROM SeniorCTE
    WHERE cumulative_salary <= 70000
),
JuniorCTE AS (
    SELECT
        employee_id,
        SUM(salary) OVER (ORDER BY salary, employee_id) AS cumulative_salary
    FROM Candidates
    WHERE experience = 'Junior'
),
MaxJuniorCount AS (
    SELECT
        COUNT(*) AS junior_count
    FROM JuniorCTE
    WHERE cumulative_salary <= (70000 - COALESCE((SELECT max_senior_salary FROM MaxSeniorSalary), 0))
)
SELECT
    'Senior' AS experience,
    COUNT(*) AS accepted_candidates
FROM SeniorCTE
WHERE cumulative_salary <= 70000
UNION ALL
SELECT
    'Junior' AS experience,
    junior_count
FROM MaxJuniorCount;
