-- Day 4 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- Day 2を一度実行した状態での集計。Day 5のbattle_resultsを使う発展例は含めません。

SELECT COUNT(*) AS total_players, ROUND(AVG(level),2) AS average_level,
MAX(level) AS max_level, MIN(level) AS min_level, SUM(gold) AS total_gold
FROM players;

SELECT CASE WHEN level < 10 THEN '初級' ELSE '上級' END AS level_group,
COUNT(*) AS player_count FROM players GROUP BY level_group;
SELECT level, COUNT(*) AS player_count FROM players
GROUP BY level HAVING COUNT(*) >= 2;

SELECT player_name, level,
DENSE_RANK() OVER (ORDER BY level DESC) AS level_rank
FROM players ORDER BY level_rank, id;

USE game_player_db;
SELECT COUNT(*) AS player_count,
       SUM(gold) AS total_gold,
       ROUND(AVG(level), 2) AS avg_level,
       MIN(level) AS min_level,
       MAX(level) AS max_level
FROM players;

SELECT CASE WHEN level < 10 THEN '初級'
            ELSE '上級' END AS level_group,
       COUNT(*) AS player_count
FROM players
GROUP BY level_group
ORDER BY level_group;

SELECT CASE WHEN level < 10 THEN '初級'
            ELSE '上級' END AS level_group,
       COUNT(*) AS player_count
FROM players
WHERE gold >= 500
GROUP BY level_group
HAVING COUNT(*) >= 2;

SELECT player_name, level,
       DENSE_RANK() OVER (ORDER BY level DESC) AS level_rank
FROM players
ORDER BY level_rank, id;
