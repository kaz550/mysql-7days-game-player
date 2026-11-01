-- Day 5 / 1週間で学ぶ MySQL 基礎入門
-- MySQL 8.4 LTS向け。実機動作検証は未実施です。
-- Day 2を一度実行した状態での初回実行用。テーブル作成とデータ登録を含みます。

USE game_player_db;
CREATE TABLE characters (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 player_id BIGINT UNSIGNED NOT NULL,
 character_name VARCHAR(50) NOT NULL,
 FOREIGN KEY (player_id) REFERENCES players(id)
) ENGINE=InnoDB;
CREATE TABLE items (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 item_name VARCHAR(60) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE inventories (
 player_id BIGINT UNSIGNED NOT NULL,
 item_id BIGINT UNSIGNED NOT NULL,
 quantity INT UNSIGNED NOT NULL DEFAULT 1,
 PRIMARY KEY (player_id,item_id),
 FOREIGN KEY (player_id) REFERENCES players(id),
 FOREIGN KEY (item_id) REFERENCES items(id)
) ENGINE=InnoDB;
CREATE TABLE battle_results (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 player_id BIGINT UNSIGNED NOT NULL,
 result ENUM('WIN','LOSE','DRAW') NOT NULL,
 score INT UNSIGNED NOT NULL DEFAULT 0,
 FOREIGN KEY (player_id) REFERENCES players(id)
) ENGINE=InnoDB;
INSERT INTO characters(player_id,character_name)
SELECT id, CONCAT(player_name,'の勇者') FROM players;
INSERT INTO items(item_name) VALUES ('木の剣'),('回復薬'),('鉄の盾');
INSERT INTO inventories(player_id,item_id,quantity)
SELECT p.id,i.id,3 FROM players p CROSS JOIN items i
WHERE p.player_name='アオイ' AND i.item_name='回復薬';
INSERT INTO battle_results(player_id,result,score)
SELECT id,'WIN',100 FROM players WHERE player_name='レン';
INSERT INTO battle_results(player_id,result,score)
SELECT id,'DRAW',50 FROM players WHERE player_name='アオイ';
SELECT p.player_name,c.character_name FROM players p
INNER JOIN characters c ON c.player_id=p.id;
SELECT p.player_name,b.result,b.score FROM players p
LEFT JOIN battle_results b ON b.player_id=p.id ORDER BY p.id,b.id;
SELECT p.player_name,i.item_name,v.quantity FROM inventories v
JOIN players p ON p.id=v.player_id JOIN items i ON i.id=v.item_id;
SELECT player_name,level FROM players
WHERE level > (SELECT AVG(level) FROM players);

USE game_player_db;
SELECT p.player_name
FROM players AS p
LEFT JOIN battle_results AS b ON b.player_id = p.id
WHERE b.id IS NULL
ORDER BY p.id;

SELECT p.player_name, i.item_name, v.quantity
FROM inventories AS v
JOIN players AS p ON p.id = v.player_id
JOIN items AS i ON i.id = v.item_id
ORDER BY p.id, i.id;

SELECT player_name, level
FROM players
WHERE level > (SELECT AVG(level) FROM players)
ORDER BY level DESC, id;
