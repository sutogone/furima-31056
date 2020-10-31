# README

##usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :purchases

##itemsテーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| user_id               | references | null: false |
| name                  | string     | null: false |
| info                  | text       | null: false |
| category_id           | integer    | null: false |
| sales_status_id       | integer    | null: false |
| shipping_fee_id       | integer    | null: false |
| scheduled_delivery_id | integer    | null: false |
| item_price            | integer    | null: false |
| prefecture_id         | integer    | null: false |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :scheduled_delivery
- belongs_to_active_hash :prefecture
- belongs_to :seller, class_name: "User"

##purchasesテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | references | null: false |
| item_id | references | null: false |

### Association
- belongs_to :address
- belongs_to :user
- belongs_to :item

##addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| purchase_id   | references | null: false |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |

### Association
- has_one :purchase
- belongs_to_active_hash :prefecture