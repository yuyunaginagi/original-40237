<!-- usersテーブル -->
| Column              | Type    | Options     |
|---------------------|---------|-------------|
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| birth_day           | date    | null: false |
| event               | string  | null: false |
| goal                | string  | null: false |

- has_many :results
- has_many :reviews
- has_many :comments
- has_many :likes

<!-- resultsテーブル -->
| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| user                   | references | null: false, foreign_key: true |
| date                   | date       | null: false |
| game_name              | string     | null: false |
| event_id               | integer    | null: false |
| result                 | text       | null: false |

- belongs_to :user

<!-- reviewsテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| date             | date       | null: false                    |
| activity         | string     | null: false                    |
| review           | text       | null: false                    |

- belongs_to :user
- has_many :comments
- has_many :likes

<!-- commentsテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| text             | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| review           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :review

<!-- likesテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| like             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| review           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :review



アプリケーション名
--------------------------------------------------------------
SprintTrack Pro

アプリケーション概要
--------------------------------------------------------------
陸上競技に取り組む選手が試合結果を記録し、練習及び試合の振り返りができる。

URL
--------------------------------------------------------------
https://original-40237.onrender.com/

テスト用アカウント
--------------------------------------------------------------・Basic認証ID：admin
・Basic認証パスワード：3333

利用方法
--------------------------------------------------------------


アプリケーションを作成した背景
--------------------------------------------------------------
陸上競技において、競技結果（記録）の管理は、チームおよび個人において重要である。また、各種試合の申し込みにも必要な情報である。試合の記録をその都度残しておかないと、自己ベストの記録を調べることが大変であり、記録の仕方は統一されていないという課題がある。
さらに、競技に取り組む上で、試合や練習の振り返りが重要である。指導者が選手とやり取りするツールも必要であると考え、アプリケーション開発に至った。

洗い出した要件
--------------------------------------------------------------
要件を定義したシート

