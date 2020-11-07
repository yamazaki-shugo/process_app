# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :notices
- has_one :organization
- has_many :rooms, through: :room_users

## organizations テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| occupation_id      | integer    | null: false       |
| phone_number       | string     | null: false       |
| address            | string     | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user

## notices テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| content            | text       | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :notices

## room_users テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| room               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
