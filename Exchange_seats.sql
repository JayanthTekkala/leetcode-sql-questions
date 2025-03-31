--626. Exchange Seats
SELECt id,
CASE WHEN id%2 =1 AND id+1<=(SELECT MAX(id) FROM Seat)
          THEN (SELECT STUDENT FROM Seat WHERE id = s.id+1)
     When id%2 =0
          THEN (SELECT STUDENT FROM Seat WHERE id = s.id-1)
     ELSE Student
     END AS student
FROM Seat s
ORDER BY id;