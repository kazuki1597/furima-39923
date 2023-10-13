# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| password_cofirmtion | Type   | Options     |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birth_date(1i)      | string | null: false |
| birth_date(2i)      | string | null: false |
| birth_date(3i)      | Type   | Options     |


## items テーブル

| Column                       | Type   | Options     |
| ---------------------------- | ------ | ----------- |
| name                         | string | null: false |
| info                         | Type   | Options     |
| category_id                  | string | null: false |
| sales_status_id              | string | null: false |
| shipping_free_status_id      | string | null: false |
| prefecture_id                | string | null: false |
| scheduled_delivery_id        | string | null: false |
| price                        | string | null: false |


## pay_form テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | references | null: false, foreign_key: true |
| prefecture     | references | null: false, foreign_key: true |
| city           | string     | null: false |
| addlesses      | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |

