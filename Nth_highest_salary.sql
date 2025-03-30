--177. Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT salary FROM
      (
        SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM Employee
      )ranked
      WHERE rnk = N
      limit 1


  );
END
