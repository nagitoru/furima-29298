# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nick_name          | string | null: false, default:"" |
| email              | string | null: false, default:"" |
| encrypted_password | string | null: false, default:"" |
| first_name         | string | null: false, default:"" |
| last_name          | string | null: false, default:"" |
| first_name_reading | string | null: false, default:"" |
| last_name_reading  | string | null: false, default:"" |
| birthday           | date   | null: false             |


### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| name         | string    | null: false                    |
| text         | text      | null: false                    |
| genre        | integer   | null: false                    |
| status       | integer   | null: false                    |
| price        | integer   | null: false                    |
| postage      | integer   | null: false                    |
| place        | integer   | null: false                    |
| delivery_day | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| place         | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order