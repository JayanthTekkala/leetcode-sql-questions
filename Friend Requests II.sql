--602. Friend Requests II: Who Has the Most Friends
With friendList AS(
    SELECT requester_id AS id, accepter_id AS friend
    FROM RequestAccepted 
    UNION ALL
    SELECT accepter_id as id, requester_id AS friend
    FROM RequestAccepted
),

friendCount AS(
    SELECT id, COUNT(friend) AS numOfFriends
    FROM friendList
    GROUP BY id
),

maxCount AS(
    SELECT MAX(numofFriends) AS maxFriends
    FROM friendCount
    
)

SELECT fc.id, fc.numOfFriends AS num
FROM friendCount fc JOIN maxCount mc
ON fc.numOfFriends = mc.maxFriends;