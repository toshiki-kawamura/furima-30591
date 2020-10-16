# テーブル設計

## users テーブル
| column   | Type      | Options |
|----------|-----------|---------|
|nickname  |string     |NOT NULL |
|email     |string     |NOT NULL |
|password  |string     |NOT NULL |
|name      |string     |NOT NULL |
|birth     |ActiveHash |NOT NULL |


### Association
- has_many : comments
- has_many : Products

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
| column    | Type             | Options |
|-----------|------------------|---------|
|image      |ActiveStorage     |NOT NULL |
|name       |string            |NOT NULL |
|explanation|text              |NOT NULL |
|price      |string            |NOT NULL |
|category   |ActiveHash        |NOT NULL |
|state      |ActiveHash        |NOT NULL |
|user       |references        |NOT NULL |

### Association
- belongs_to :user
- has_many : comments

## Purchasesテーブル
| column  | Type       | Options |
|---------|------------|---------|
|user     |references  |         |
|product  |references  |         |

### Association
- has_one :user
- has_one :product

## Sendingテーブル
| column      | Type       | Options |
|distribution |ActiveHash  |NOT NULL |
|region       |ActiveHash  |NOT NULL |
|daily        |ActiveHash  |NOT NULL |

### Association
- has_one :purchase
