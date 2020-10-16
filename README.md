# テーブル設計

## users テーブル
| column   | Type  | Options |
|----------|-------|---------|
|nickname  |string |NOT NULL |
|email     |string |NOT NULL |
|password  |string |NOT NULL |
|name      |string |NOT NULL |
|birth     |pull   |NOT NULL |

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
- belongs_to :Product

## Productsテーブル
| column    | Type             | Options |
|-----------|------------------|---------|
|image      |ActiveStorageで実装|         |
|name       |string            |NOT NULL |
|explanation|text              |NOT NULL |
|category   |pull              |NOT NULL |
|state      |pull              |         |
|user       |references        |         |

### Association
- belongs_to :user
- has_many : comments