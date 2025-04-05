--607. Sales Person
SELECT name
FROM SalesPerson s
WHERE NOT EXISTS(
    SELECT 1
    FROM ORDERS o INNER JOIN COMPANY c
    ON o.com_id = c.com_id
    WHERE o.sales_id = s.sales_id and c.name= 'RED'
)