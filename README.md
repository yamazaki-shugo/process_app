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