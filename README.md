# 1週間で学ぶ MySQL 基礎入門 — サンプルSQL

書籍のプレイヤー管理データベースを題材にした読者向けSQL配布リポジトリです。

**対象環境:** MySQL 8.4 LTS。**実機動作検証は未実施**です。掲載コードは学習用のサンプルで、本番環境では実行しないでください。

## ファイルと実行順

| 章 | ファイル | 内容 |
| --- | --- | --- |
| Day 1 | [day01/day01.sql](day01/day01.sql) | 接続後の環境確認 |
| Day 2 | [day02/day02.sql](day02/day02.sql) | DB・players作成、登録・更新・削除 |
| Day 3 | [day03/day03.sql](day03/day03.sql) | 条件検索・並べ替え・ページング |
| Day 4 | [day04/day04.sql](day04/day04.sql) | 集計・ランキング |
| Day 5 | [day05/day05.sql](day05/day05.sql) | テーブル結合・所持アイテム |
| Day 6 | [day06/day06.sql](day06/day06.sql) | インデックスとEXPLAIN |
| Day 7 | [day07/day07.sql](day07/day07.sql) | トランザクション |
| Day 7 | [day07/backup_restore_commands.txt](day07/backup_restore_commands.txt) | OSのターミナルでバックアップ・復元 |
| Day 7 | [day07/app_user_permissions.sql](day07/app_user_permissions.sql) | 管理者による学習用ユーザー作成 |

**実行順序:** MySQLクライアントに接続してDay 1のSQLを実行し、Day 2から順番に進めます。Day 3以降は前のDayのデータベースとデータが存在することを前提とします。個々のDayのSQLが単独で初期化から実行できるわけではありません。

**注意:** Day 2・5は初回実行用で、再実行すると重複データやテーブル作成エラーが発生する場合があります。Day 6はインデックスの作成と削除を含みます。Day 7のバックアップコマンドはSQL入力画面ではなくOSのターミナルで実行します。権限操作の例は管理者権限が必要で、仮パスワードを必ず変更してください。

書籍のMarkdown正本・出版データ・図版はこの公開リポジトリには含めません。サンプルの実行結果、初期化手順、独立実行性は今後検証・改善します。
