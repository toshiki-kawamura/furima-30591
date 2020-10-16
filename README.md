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
| column                 | Type         | Options |
|------------------------|--------------|---------|
|name                    |string        |NOT NULL |
|explanation             |text          |NOT NULL |
|genre_id'カテゴリー'      |integer       |NOT NULL |
|genre_id'商品の状態'      |integer       |NOT NULL |
|genre_id'配送料の負担'    |integer       |NOT NULL |
|genre_id'発送元の地域'    |integer       |NOT NULL |
|genre_id'発送までの日数'  |integer       |NOT NULL |
|price                   |integer       |NOT NULL |
|user                    |references    |         |
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
| column               | Type   | Options |
|----------------------|--------|---------|
|'郵便番号'             |integer  |NOT NULL |
|genre_id''都道府県'    |integer  |NOT NULL |
|'市区町村'             |string   |NOT NULL |
|'番地'                |string   |NOT NULL |
|'建物名'              |string   |         |
|'電話番号'             |integer  |NOT NULL |
### Association
- belongs_to :purchase
