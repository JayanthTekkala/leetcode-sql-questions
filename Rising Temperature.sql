--197. Rising Temperature
SELECT w1.id
FROM Weather w1 INNER JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w2.temperature <w1.temperature;