# データベース設計
## users
### usersテーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana    | string | null: false               |
| first_name_kana   | string | null: false               |
| birth_date         | date   | null: false               |

### アソシエーション
```ruby
has_many :items

has_many :orders
```

### バリデーション
```ruby
validates :nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
```

## items
### itemsテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| item_name          | string     | null: false                     |
| description        | text       | null: false                     |
| category_id       | integer    | null: false                     |
| condition_id      | integer    | null: false                     |
| shipping_area_id | integer    | null: false                     |
| shipping_days_id | integer    | null: false                     |
| price              | integer    | null: false                     |
| user_id           | references | null: false, foreign_key: true |

### アソシエーション
```ruby
belongs_to :user

has_one :order

has_one_attached :image
```

### バリデーション
```ruby
validates :name, :description, :category_id, :condition_id, :shipping_area_id, :shipping_days_id, :price, presence: true
```

## shipping_addresses
### shipping_addressesテーブル
| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| postal_code   | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city           | string     | null: false                     |
| address        | string     | null: false                     |
| building       | string     |                                 |
| phone_number  | string     | null: false                     |
| order_id      | references | null: false, foreign_key: true |

### アソシエーション
```ruby
belongs_to :order
```

### バリデーション
```ruby
validates :postal_code,:prefecture_id,:city,:address,:phone_number
```

## orders
### ordersテーブル
| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### アソシエーション
```ruby
belongs_to :user

belongs_to :item

has_one :shipping_address
```