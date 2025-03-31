--608. Tree Node
SELECT id,
CASE WHEN p_id is NULL THEN 'Root' 
     WHEN id in (select p_id FROM Tree) THEN 'Inner'
     Else 'Leaf' END AS 'type'
FROM Tree;