# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| name                | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birth_date          | date   | null: false |


### Association

- has_many :items
- has_many :purchase_informations

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
| user                         | references  | foreign_key: true, null: false   |


### Association

- belongs_to :user
- has_one :purchase_information

## pay_forms テーブル

| Column                 | Type       | Options            |
| ---------------------- | ---------- | ------------------ |
| postal_code            | string     | null: false        |
| prefecture_id          | integer    | null: false        |
| city                   | string     | null: false        |  
| addlesses              | string     | null: false        | 
| building               | string     |                    |
| phone_number           | string     | null: false        |
| purchase_information   | references | foreign_key: true, null: false  |

### Association

belongs_to :purchase_information

## purchase_informations テーブル
| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| user          | references | foreign_key: true, null: false  |
| item          | references | foreign_key: true, null: false  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :pay_form







- [ ] エラーハンドリングができること（入力に問題がある状態で「変更する」ボタンが押された場合、情報は保存されず、編集ページに戻りエラーメッセージが表示されること）。
- [ ] エラーハンドリングによって編集ページに戻った場合でも、入力済みの項目（画像・販売手数料・販売利益以外）は消えないこと。
- [ ] エラーハンドリングの際、重複したエラーメッセージが表示されないこと。 --> --> --> --> --> --> -->