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
| birth_date(1i)      | date   | null: false |
| birth_date(2i)      | date   | null: false |
| birth_date(3i)      | date   | null: false |


## items テーブル

| Column                       | Type       | Options     |
| ---------------------------- | ---------- | ----------- |
| name                         | Type       | Type        |
| info                         | string     | null: false |
| category_id                  | string     | null: false |
| sales_status_id              | string     | null: false |
| shipping_free_status_id      | string     | null: false |
| prefecture_id                | string     | null: false |
| scheduled_delivery_id        | string     | null: false |
| price                        | string     | null: false |
| user                         | references | foreign_key: true  |


## pay_form テーブル

| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| postal_code    | string     |  foreign_key: true |
| prefecture     | Intege     |  foreign_key: true |
| city           | string     | null: false |
| addlesses      | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |


## 購入情報 テーブル
| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| user           | references | foreign_key: true  |
| items          | references | foreign_key: true  |

