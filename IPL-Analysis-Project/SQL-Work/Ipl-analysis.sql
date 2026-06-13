CREATE DATABASE Ipl
Use Ipl

-- Top 10 Run Scorers

SELECT TOP 10
       batsman,
       SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC;

--Top Wicket Takers

SELECT TOP 10 bowler,
       COUNT(player_dismissed) AS wickets
FROM deliveries
WHERE dismissal_kind NOT IN ('run out', 'retired hurt')
GROUP BY bowler
ORDER BY wickets DESC;

--Teams With Most Wins

SELECT winner,
       COUNT(*) AS total_wins
FROM matches
GROUP BY winner
ORDER BY total_wins DESC;

-- Toss Impact Analysis

SELECT
    CASE
        WHEN toss_winner = winner THEN 'Won Match'
        ELSE 'Lost Match'
    END AS toss_impact,

    COUNT(*) AS total_matches

FROM matches

GROUP BY
    CASE
        WHEN toss_winner = winner THEN 'Won Match'
        ELSE 'Lost Match'
    END;

   -- Highest Team Scores

   SELECT TOP 10 batting_team,
       match_id,
       SUM(total_runs) AS total_score
FROM deliveries
GROUP BY batting_team, match_id
ORDER BY total_score DESC;

--  Most Sixes 

SELECT TOP 10 batsman,
       COUNT(*) AS total_sixes
FROM deliveries
WHERE batsman_runs = 6
GROUP BY batsman
ORDER BY total_sixes DESC;

-- Most Fours

SELECT TOP 10 batsman,
       COUNT(*) AS total_fours
FROM deliveries
WHERE batsman_runs = 4
GROUP BY batsman
ORDER BY total_fours DESC;

-- Matches Played Per Season

SELECT season,
COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY season;

-- Most Player of the Match Awards

SELECT TOP 10  player_of_match,
       COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC;

-- Venue Hosting Most Matches

SELECT venue,
       COUNT(*) AS total_matches
FROM matches
GROUP BY venue
ORDER BY total_matches DESC;