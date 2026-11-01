-- Day 3 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- Day 2を一度実行した状態での検索。すべて読み取り専用。

USE game_player_db;
SELECT player_name, level, gold FROM players;
SELECT player_name, level FROM players WHERE level >= 10;
SELECT player_name FROM players WHERE player_name LIKE 'ア%';
SELECT player_name, level, gold FROM players WHERE level >= 8 AND gold >= 500;
SELECT player_name, level FROM players ORDER BY level DESC, id ASC LIMIT 3;

USE game_player_db;
SELECT player_name, level
FROM players
WHERE level >= 10
ORDER BY level DESC, id ASC;

SELECT player_name, level, gold
FROM players
WHERE (level >= 8 AND level < 15) AND gold >= 500
ORDER BY id;

SELECT player_name FROM players
WHERE player_name LIKE 'ア%';

SELECT player_name, level
FROM players
ORDER BY level DESC, id ASC
LIMIT 2 OFFSET 2;
