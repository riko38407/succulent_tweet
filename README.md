# アプリケーション名

Succulent Tweet 

# アプリーション概要

サボテン・多肉植物専用の画像投稿型コミュニケーションアプリです

# URL

https://succulent-tweet-38407.herokuapp.com/

# テスト用アカウント

・ Basic認証パスワード :admin

・ Basic認証ID :2222

・ メールアドレス : test@test.jp

・ パスワード :test11



# 利用方法

## 画像投稿

1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、テキスト、画像を入力し投稿する
3. 投稿した画像から詳細ページに遷移する
4. 詳細ページでは登録したユーザーのみコメントすることができる

## 図鑑機能

1. 一覧ページから遷移し自身が投稿した植物を編集できる
2. ユーザーは項目ごとに分けて閲覧が可能


# アプリケーションを作成した背景

趣味でサボテン、多肉植物を育成しており日ごろから育成動画や生産者の情報をリサーチして育成の参考にしている。サボテン、多肉植物の品種は多く、様々な品種が生産されているため育成方法も様々存在している。そこで、サボテン、多肉植物専用の画像投稿型アプリを作成し、愛好家たちのコミュニケーションの場として設け、初心者の方でも簡単に育成できるように各項目ごとに分けられた図鑑機能を搭載することで、より育成を楽しんでほしいと考えたためこのアプリを作成を計画した。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1VMohiWjh5Sv3grKbqB7v6CcIL4dTlX5mWvlKcpbwakE/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

・投稿した画像がフォームの一覧に表示されるGIF

[![Image from Gyazo](https://i.gyazo.com/d8ce7ffd7a9c25fd824589e433f6ff31.gif)](https://gyazo.com/d8ce7ffd7a9c25fd824589e433f6ff31)

・投稿した画像をクリックすると詳細ページに遷移するGIF

[![Image from Gyazo](https://i.gyazo.com/a43d181da708d7162cc6af13f004e172.gif)](https://gyazo.com/a43d181da708d7162cc6af13f004e172)

・詳細ページにて登録したユーザーのみコメントができるGIF

[![Image from Gyazo](https://i.gyazo.com/eca666782292f024ee0ffc0fc2e71d1a.gif)](https://gyazo.com/eca666782292f024ee0ffc0fc2e71d1a)

・詳細ページにて投稿した画像を編集を行えるGIF

[![Image from Gyazo](https://i.gyazo.com/c386e27bdce209139bf55c641116ff35.gif)](https://gyazo.com/c386e27bdce209139bf55c641116ff35)



# 実装予定の機能

現在はフォロー機能を実装中。

今後は図鑑機能を実装予定。

# データベース設計


![succulent_table](https://user-images.githubusercontent.com/111741304/200153317-6bd2fcf3-dcbc-4141-84c3-0d3aa5ebb662.png)


# 画面遷移図


![succulent](https://user-images.githubusercontent.com/111741304/196095575-ef234dfd-9fb2-4ad0-993e-e65ee384e454.png)



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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |
| text               | text       | null: false                    |

### Association
belongs_to :user
belongs_to :tweet


## pictorial_books テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: true |
| plant_name         | string     | null: false                   |
| type               | integer    | null: false                   |
| place              | integer    | null: false                   |
| difficulty         | integer    | null: false                   |
| cultivation        | text       | null: false                   |
| date               | date       | null: false                   |

### Assosiation
belongs_to :user


## Relationships テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| following_id       | integer    | null: false,foreign_key: true |
| follower_id        | integer    | null: false,foreign_key: true |


### Assosiation
belongs_to :user
belongs_to :follow, class_name: 'User'

# 開発環境

・フロントエンド
・バックエンド
・イングラ
・テスト
・テキストエディタ
・タスク管理

*ローカルでの動作確認方法*

以下のコマンドを順に実行

% git clone https://github.com/riko38407/succulent_tweet.git

% cd succulent_tweet

% bundle install

% yarn install


# 工夫したポイント

フロント実装にてサンプルの画像を複数用意し、それをスライドとしてフロントに配置投稿対象のサボテン、多肉植物のサンプル画像としてフロント実装を行いました。
また、新しく投稿された画像は左から新規投稿画像が閲覧可能にし、各詳細ページにてコメント機能を実装を行いました。
