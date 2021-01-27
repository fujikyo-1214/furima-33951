# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| nickname        | string | null: false, unique: true |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| kana_first_name | string | null: false               |
| kana_last_name  | string | null: false               |
| birthday        | string | null: false               |

### Association

has_many :items
has_many :purchase_record

## itemsテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_name        | string     | null: false |
| item_explanation | text       | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| shipping_cost    | integer    | null: false |
| prefectures      | integer    | null: false |
| arrival_days     | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false |

### Association

belongs_to       :users
has_one :through : purchase_record

## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| post_number     | string     | null: false |
| prefectures     | integer    | null: false |
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
| items  | references | null: false |

### Association

has_one :through : address