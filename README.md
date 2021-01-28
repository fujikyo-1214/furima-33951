# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false unique: true  |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first_name    | string | null: false               |
| kana_last_name     | string | null: false               |
| birthday           | date   | null: false               |

### Association

has_many :items
has_many :purchase_records

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| item_explanation    | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_cost_id    | integer    | null: false |
| prefecture_id       | integer    | null: false |
| arrival_day_id      | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false |

### Association

belongs_to :user
has_one    : purchase_record

## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| post_number     | string     | null: false |
| prefecture_id   | integer    | null: false |
| area            | string     | null: false |
| area_number     | string     | null: false |
| building        | string     |             |
| number          | string     | null: false |
| purchase_record | references | null: false |

### Association

belongs_to :purchase_record

## purchase_recordテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

### Association

has_one    :address
belongs_to :user
belongs_to :item