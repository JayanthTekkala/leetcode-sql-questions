--577. Employee Bonus
SELECT e.name, b.bonus
FROM Employee e LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE bonus<1000 or bonus is null;