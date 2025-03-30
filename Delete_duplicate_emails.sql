--196. Delete Duplicate Emails
DELETE p1
FROM Person p1 JOIN Person P2
WHERE p1.email = p2.email and p1.id>p2.id