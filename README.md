# テーブル設計

## users テーブル
| column             | Type      | Options |
|--------------------|-----------|---------|
|nickname            |string     |NOT NULL |
|email               |string     |NOT NULL |
|password            |string     |NOT NULL |
|last name           |string     |NOT NULL |
|first name          |string     |NOT NULL |
|last name(katakana) |string     |NOT NULL |
|first name(katakana)|string     |NOT NULL |
|date of birth       |date       |NOT NULL |
### Association
- has_many : comments
- has_many : Products
- has_one  : purchase


## Commentsテーブル
| column   | Type      | Options |
|----------|-----------|---------|
|text      |text       |         |
|user      |references |         |
|Product   |references |         |
### Association
- belongs_to :user
- belongs_to :product


## Productsテーブル
| column                      | Type         | Options |
|-----------------------------|--------------|---------|
|product name                 |string        |NOT NULL |
|product description          |text          |NOT NULL |
|genre_id:category            |integer       |NOT NULL |
|genre_id:product condition   |integer       |NOT NULL |
|genre_id:shipping charges    |integer       |NOT NULL |
|genre_id:shipping area       |integer       |NOT NULL |
|genre_id:days to ship        |integer       |NOT NULL |
|price                        |integer       |NOT NULL |
|user                         |references    |         |
### Association
- belongs_to :user
- has_many   : comments
- has_one    : purchase


## Purchasesテーブル
| column  | Type       | Options |
|---------|------------|---------|
|user     |references  |         |
|product  |references  |         |
### Association
- belongs_to :user
- belongs_to :product
- has_one    :sending


## Sendingテーブル
| column               | Type    | Options |
|----------------------|---------|---------|
|postal code           |integer  |NOT NULL |
|genre_id:prefectures  |integer  |NOT NULL |
|municipality          |string   |NOT NULL |
|address               |string   |NOT NULL |
|building name         |string   |         |
|phone number          |integer  |NOT NULL |
### Association
- belongs_to :purchase
