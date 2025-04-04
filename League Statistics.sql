--1841 League Statistics
WITH all_matches AS (
    SELECT home_team_id AS team_id,
           home_team_goals AS goals_for,
           away_team_goals AS goals_against,
           CASE
               WHEN home_team_goals > away_team_goals THEN 3
               WHEN home_team_goals = away_team_goals THEN 1
               ELSE 0
           END AS points
    FROM Matches
    UNION ALL
    SELECT away_team_id AS team_id,
           away_team_goals AS goals_for,
           home_team_goals AS goals_against,
           CASE
               WHEN away_team_goals > home_team_goals THEN 3
               WHEN away_team_goals = home_team_goals THEN 1
               ELSE 0
           END AS points
    FROM Matches
),
team_stats AS (
    SELECT
        team_id,
        COUNT(*) AS matches_played,
        SUM(points) AS points,
        SUM(goals_for) AS goal_for,
        SUM(goals_against) AS goal_against,
        SUM(goals_for - goals_against) AS goal_diff
    FROM all_matches
    GROUP BY team_id
)

SELECT
    t.team_name,
    COALESCE(s.matches_played, 0) AS matches_played,
    COALESCE(s.points, 0) AS points,
    COALESCE(s.goal_for, 0) AS goal_for,
    COALESCE(s.goal_against, 0) AS goal_against,
    COALESCE(s.goal_diff, 0) AS goal_diff
FROM Teams t
LEFT JOIN team_stats s
  ON t.team_id = s.team_id
ORDER BY
    points DESC,
    goal_diff DESC,
    team_name;
