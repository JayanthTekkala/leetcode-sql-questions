--570. Managers with at Least 5 Direct Reports
SELECT e.name
FROM Employee e
JOIN (
SELECT managerId
FROM Employee e
WHERE managerId IS NOT NULL
GROUP BY managerId
HAVING COUNT(managerId)>=5
) m on e.id = m.managerId
