-- Day 7 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- Day 2を一度実行した状態でのトランザクションと接続設定確認。バックアップや権限操作は別手順。

USE game_player_db;

START TRANSACTION;
UPDATE players SET gold=gold+100 WHERE player_name='アオイ';
SELECT player_name,gold FROM players WHERE player_name='アオイ';
ROLLBACK;
SELECT player_name,gold FROM players WHERE player_name='アオイ';

SELECT DATABASE();

SHOW VARIABLES LIKE 'require_secure_transport';
SHOW VARIABLES LIKE 'tls_version';
