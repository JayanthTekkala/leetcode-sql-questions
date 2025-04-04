--2142. The Number of Passengers in Each Bus
SELECT b.bus_id,
       COUNT(p.passenger_id) AS passengers_cnt
FROM Buses b
LEFT JOIN Passengers p
  ON p.arrival_time <= b.arrival_time
  AND NOT EXISTS (
    SELECT 1
    FROM Buses b2
    WHERE b2.arrival_time >= p.arrival_time
      AND b2.arrival_time < b.arrival_time
  )
GROUP BY b.bus_id
ORDER BY b.bus_id;
