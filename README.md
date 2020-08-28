# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nick_name    | string  | null: false |
| mail         | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| name_reading | string  | null: false |
| year         | integer | null: false |
| month        | integer | null: false |
| day          | integer | null: false |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| item_name    | string    | null: false                    |
| image        | text      | null: false                    |
| text         | text      | null: false                    |
| genre        | string    | null: false                    |
| item_status  | string    | null: false                    |
| price        | string    | null: false                    |
| postage      | string    | null: false                    |
| prace        | string    | null: false                    |
| delivery_day | string    | null: false                    |
| sell         | boolean   |                                |
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

- belongs_to :item
- has_one : address

## Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order