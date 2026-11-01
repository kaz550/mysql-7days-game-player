-- Day 2 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- 初回実行用。5人登録後、アオイの所持金を更新しソラを削除。再実行でデータが重複・変化します。

CREATE DATABASE IF NOT EXISTS game_player_db CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE game_player_db;

CREATE TABLE IF NOT EXISTS players (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    level INT UNSIGNED NOT NULL DEFAULT 1,
    experience INT UNSIGNED NOT NULL DEFAULT 0,
    gold INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

SHOW TABLES;
DESCRIBE players;

INSERT INTO players (player_name, level, experience, gold) VALUES
('アオイ', 5, 1200, 300),
('レン', 12, 8500, 1200),
('ミオ', 8, 3200, 650),
('ソラ', 1, 0, 100),
('ユウ', 15, 12000, 2400);

SELECT id, player_name, level, experience, gold FROM players ORDER BY id;

UPDATE players SET gold = gold + 200 WHERE player_name = 'アオイ';
SELECT player_name, gold FROM players WHERE player_name = 'アオイ';

DELETE FROM players WHERE player_name = 'ソラ';
SELECT player_name FROM players ORDER BY id;
