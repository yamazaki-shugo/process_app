# 概要
 Ruby on Railsを用いて部活動を行う学生向けに、日誌、チャット、スケジュールアプリケーションを作成しました。

# 実装機能
 ・チャット機能<br>
 ・スケジュール登録機能(simple calendarというgemを使用しました)<br>
 ・日誌登録機能<br>

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
- has_many :events
- has_many :room_users
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
- has_many :events

## room_users テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| room               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## events テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| content            | text       | null: false       |
| start_time         | datetime   | null: false       |
| user               | references | foreign_key: true |
| room               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## diaries テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| date               | date       | null: false       |
| objective          | text       | null: false       |
| practice_menu      | text       | null: false       |
| discovery          | text       | null: false       |
| reflection         | text       | null: false       |
| task               | text       | null: false       |
| other              | text       |                   |
| mvp                | string     |                   |
| user               | references | foreign_key: true |
| room               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
