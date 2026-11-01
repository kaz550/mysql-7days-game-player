-- Day 7 最小権限の例。管理者権限で学習環境にのみ実行。
-- CHANGE_TO_A_STRONG_PASSWORDを実際の強いパスワードに変更すること。
-- MySQL 8.4 LTSで未実機検証。

USE game_player_db;
CREATE USER 'game_app'@'localhost' IDENTIFIED BY 'CHANGE_TO_A_STRONG_PASSWORD';
GRANT SELECT,INSERT,UPDATE,DELETE ON game_player_db.* TO 'game_app'@'localhost';
SHOW GRANTS FOR 'game_app'@'localhost';
