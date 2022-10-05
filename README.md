*アプリケーション名*

Succulent Tweet 

# アプリーション概要

サボテン・多肉植物専用の画等投稿型コミュニケーションアプリです

# URL

# テスト用アカウント
・ Basic認証パスワード :
・ Basic認証ID :
・ メールアドレス :
・ パスワード :

*利用方法*

# 画像投稿

1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、テキスト、画像を入力し投稿する
3. 投稿した画像から詳細ページに遷移する
4. 詳細ページでは登録したユーザーのみコメントすることができる

# 図鑑機能

1. 一覧ページから遷移し自身が投稿した植物を編集できる
2. ユーザーは項目ごとに分けて閲覧が可能


*アプリケーションを作成した背景*

趣味でサボテン、多肉植物を育成しており日ごろから育成動画や生産者の情報をリサーチして育成の参考にしている。サボテン、多肉植物の品種は多く、様々な品種が生産されているため育成方法も様々存在している。そこで、サボテン、多肉植物専用の画像投稿型アプリを作成し、愛好家たちのコミュニケーションの場として設け、初心者の方でも簡単に育成できるように各項目ごとに分けられた図鑑機能を搭載することで、より育成を楽しんでほしいと考えたためこのアプリを作成を計画した。

# 洗い出した要件


*実装した機能についての画像やGIFおよびその説明*


*実装予定の機能*


*データベース設計*

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false, unique: true |


### Assosiation
has_many :tweets
has_many :comments
has_many :pictorial book
has_many :relationships

## tweets テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| text               | string     | null: false                   |

### Assosiation
belongs_to :user
has_many :comments
has_one :pictorial book


## comments テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | integer    | null: false                   |
| tweet              | integer    | null: false                   |
| text               | text       | null: false                   |

### Association
belongs_to :user
belongs_to :tweet


## pictorial books テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| tweet              | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true |
| plant_name         | string     | null: false                   |
| type               | integer    | null: false                   |
| place              | integer    | null: false                   |
| difficulty         | integer    | null: false                   |
| cultivation        | text       | null: false                   |
| date               | date       | null: false                   |

### Assosiation
belongs_to :user
belongs_to :tweet


## Relationships テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| follow_id          | references | null: false,foreign_key: true |
| followed_id        | integer    | null: false,foreign_key: true |

### Assosiation
belongs_to :user
belongs_to :follow, class_name: 'User'

*開発環境*

・フロントエンド
・バックエンド
・イングラ
・テスト
・テキストエディタ
・タスク管理

*ローカルでの動作確認方法*

以下のコマンドを順に実行
% git clone 
% cd
% bundle install
% yarn install


*工夫したポイント*