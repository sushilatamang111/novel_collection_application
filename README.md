# 小説コレクションアプリケーション

小説のコレクションを表示し、検索するシンプルなJavaウェブアプリケーションです。ユーザーは小説の詳細情報（価格、説明、評価、画像）を閲覧できます。

## 機能
- **検索機能：** 小説名や説明で検索できます。
- **アイテム詳細：** 小説のID、名前、価格、説明、評価、画像を表示します。
- **レスポンシブUI：** Bootstrapで構築されています。

## 使用技術
- Java（Servlets）
- JSP（Java Server Pages）
- SQLiteデータベース
- Bootstrap

## 必要要件
- Java 8以上
- SQLiteデータベース
- Apache Tomcat（または他のServletコンテナ）

## セットアップ手順
1. リポジトリをクローン：  
   `git clone https://github.com/your-username/novel-collection.git`
2. Apache Tomcatをセットアップし、アプリケーションをデプロイします。
3. `webapp13.db` SQLiteデータベースが`WEB-INF`ディレクトリに配置されていることを確認します。

## データベース構造
データベースには以下の列を持つ`items`テーブルがあります：
- `itemid`（INTEGER, 主キー）
- `itemname`（TEXT）
- `price`（INTEGER）
- `image`（TEXT）
- `detail`（TEXT）
- `rating`（INTEGER）

## 使用方法
- ブラウザでアプリケーションを開き、小説を検索して詳細を表示します。
