# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false, unique: true |
| profile            | text     | null: false               |
| occupation         | text     | null: false               |

### Assosiation
has_many :tweets
has_many :comments
has_many :pictorial book

## tweets テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| tweet              | references | null: false                   |

### Assosiation
belongs_to :user
has_many :comments
has_one :pictorial book


## comments テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| tweet              | references | null: false,foreign_key: true |
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
| date               | date       | null: false                   |

### Assosiation
belongs_to :user
belongs_to :tweet
