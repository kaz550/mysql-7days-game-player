-- Day 6 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- Day 2を一度実行した状態でのインデックスと実行計画。重複CREATE INDEXを避けるため各演習を別ファイル化予定。ここでは最初の一連の作成・削除を収録。

USE game_player_db;

CREATE INDEX idx_players_level ON players(level);
SHOW INDEX FROM players;
EXPLAIN SELECT id,player_name,level FROM players WHERE level >= 10;
CREATE INDEX idx_players_level_exp ON players(level,experience);
EXPLAIN SELECT id,player_name FROM players ORDER BY level DESC LIMIT 3;
DROP INDEX idx_players_level_exp ON players;
DROP INDEX idx_players_level ON players;
