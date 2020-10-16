# テーブル設計

## users テーブル
| column             | Type      | Options |
|--------------------|-----------|---------|
|nickname            |string     |NOT NULL |
|email               |string     |NOT NULL |
|password            |string     |NOT NULL |
|last_name           |string     |NOT NULL |
|first_name          |string     |NOT NULL |
|last_name_kana      |string     |NOT NULL |
|first_name_kana)    |string     |NOT NULL |
|date_of_birth       |date       |NOT NULL |
### Association
- has_many : comments
- has_many : Products
- has_many : purchase


## Commentsテーブル
| column   | Type      | Options          |
|----------|-----------|------------------|
|text      |text       |                  |
|user      |references |foreign_key: true |
|Product   |references |foreign_key: true |
### Association
- belongs_to :user
- belongs_to :product


## Productsテーブル
| column                | Type         | Options |
|-----------------------|--------------|---------|
|name                   |string        |NOT NULL |
|description            |text          |NOT NULL |
|category_id            |integer       |NOT NULL |
|product condition_id   |integer       |NOT NULL |
|shipping charges_id    |integer       |NOT NULL |
|shipping area_id       |integer       |NOT NULL |
|days to ship_id        |integer       |NOT NULL |
|price                  |integer       |NOT NULL |
|user                   |references    |foreign_key: true |
### Association
- belongs_to :user
- has_many   : comments
- has_one    : purchase


## Purchasesテーブル
| column  | Type       | Options |
|---------|------------|---------|
|user     |references  | foreign_key: true        |
|product  |references  | foreign_key: true        |
### Association
- belongs_to :user
- belongs_to :product
- has_one    :sending


## Sendingsテーブル
| column        | Type      | Options |
|---------------|-----------|---------|
|postal_code    |string     |NOT NULL |
|prefectures_id |integer    |NOT NULL |
|municipality   |string     |NOT NULL |
|address        |string     |NOT NULL |
|building_name  |string     |         |
|phone_number   |string     |NOT NULL |
|purchase       |references |foreign_key: true|

### Association
- belongs_to :purchase
