# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| email               | string | unique:true |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birth_date          | date   | null: false |


### Association

- has_many :items
- has_many :pay_form

## items テーブル

| Column                       | Type        | Options     |
| ---------------------------- | ----------- | ----------- |
| name                         | string      | null: false |
| info                         | text        | null: false |
| category_id                  | integer     | null: false |
| sales_status_id              | integer     | null: false |
| shipping_free_status_id      | integer     | null: false |
| prefecture_id                | integer     | null: false |
| scheduled_delivery_id        | integer     | null: false |
| price                        | integer     | null: false |
| user                         | references  | foreign_key: true  |
| pay_form                     | references  | foreign_key: true |

### Association

- belongs_to :users 
- has_one :pay_form

## pay_form テーブル

| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| postal_code    | string     | null: false        |
| prefecture_id  | Intege     | null: false        |
| city           | string     | null: false        |
| addlesses      | string     | null: false        |
| building       | string     | null: false        |
| phone_number   | string     | null: false        |

### Association

- belongs_to :users
- has_one :items

## 購入情報 テーブル
| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| users          | references | foreign_key: true  |
| items          | references | foreign_key: true  |

