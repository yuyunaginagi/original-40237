## アプリケーション名

SprintTrack Pro

## アプリケーション概要

陸上競技に取り組む選手が試合結果を記録し、練習及び試合の振り返りができる。

## URL

https://original-40237.onrender.com/

## テスト用アカウント

・Basic 認証 ID：admin  
・Basic 認証パスワード：3333  
・メールアドレス：test@test  
・パスワード：123456

## 利用方法

### 競技結果投稿

1.トップページからユーザー新規登録もしくはログインをする  
2.競技結果ボタンから、競技の結果（日付、大会名、種目、記録）を入力し投稿する

### 振り返り投稿

1.ヘッダーの振り返りボタンをクリックして、その日の振り返り（日付、練習内容・試合内容、コメント）を入力し投稿する。

### コメント投稿

1.ユーザーの振り返りの詳細ページに遷移する。  
2.振り返りの内容に対して、助言・励ましなど、コメントをする。

### いいね投稿

1.ユーザーの振り返りの詳細ページに遷移する。  
2.他のユーザーの振り返りに「いいね ♪」ボタンを押すと「済」に変わり、いいねをされたユーザーは誰にいいねをされたか表示される。

## アプリケーションを作成した背景

陸上競技において、競技結果（記録）の管理は、チームおよび個人において重要である。また、各種試合の申し込みにも必要な情報である。試合の記録をその都度残しておかないと、自己ベストの記録を調べることが大変であり、記録の仕方は統一されていないという課題がある。
さらに、競技に取り組む上で、試合や練習の振り返りが重要である。指導者が選手とやり取りするツールも必要であると考え、アプリケーション開発に至った。

## 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1RtuHqbQ8R75Zn82PvKZot4XkTIjA3YRuHTaupxd1Gzc/edit#gid=982722306)

## 実装した機能についての画像や GIF およびその説明

[ログイン(動画)](https://gyazo.com/dfb1a37ca3c8ffa2271b6bd147d18190)  
[新規登録(動画)](https://gyazo.com/fab0e13e210b48da257101e982744299)  
[競技結果投稿(動画)](https://gyazo.com/08a020c54d07e9dec6b29b86f9f15b81)  
[競技結果削除（動画）](https://gyazo.com/847c64fef18ae9760f830e253d0350c4)  
[振り返り投稿(動画)](https://gyazo.com/ed945f92d9e4459db8d5a233957f4a28)  
[振り返り削除（動画）](https://gyazo.com/02003e536e08a7690623ceb0b8515fc4)  
[競技結果もしくは振り返りの新規投稿時の NEW!の表示(画像)](https://gyazo.com/38a95e90bf191592191b005c14e4a511)  
[コメント投稿(動画)](https://gyazo.com/05c6cb27b7f21f25da47f0dfb948a1de)  
[いいね(動画)](https://gyazo.com/f10be1fa5c5b06a8deab1d417ac13238)  
[いいねをされたユーザー(画像)](https://gyazo.com/460cf69421fef852ef192cb37fdb3abd)

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/f28ac075a9a51f9398d960a163474330.png)](https://gyazo.com/f28ac075a9a51f9398d960a163474330)

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/737589f9181c7384728de80377bdfb43.png)](https://gyazo.com/737589f9181c7384728de80377bdfb43)

## 開発環境

・フロントエンド（HTML、CSS、JavaScript）  
・バックエンド（言語：Ruby 　フレームワーク：Ruby on Rails）  
・テスト（RSpec によるモデルの単体テスト）  
・テキストエディタ（Visual Studio Code）

## ローカルでの動作方法

% git clone https://github.com/yuyunaginagi/original-40237.git  
% cd original-40237  
% bundle install  
% yarn install  
% rails db:create  
% rails db:migrate  
% rails s

## 工夫したポイント

1.見やすさを意識し、ログイン後は登録されたユーザー名のみが表示されるようにした。ユーザー名をクリックすると各ユーザーの詳細ページに遷移するようにした。  
2.投稿に対して、誤った削除が起こらないよう、削除ボタンを押した際は、確認ダイアログが表示されるようにした。  
3.誰が最近投稿したかわかるように、12 時間以内の投稿があれば、ユーザー一覧ページに「NEW!」と表示されるようにした。  
4.ユーザーのほとんどが学生であるため、スマホでの見やすさにこだわった。PC 用とスマホ用でビューを変化させた。

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| grade              | string | null: true                |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | date   | null: false               |
| event              | string | null: false               |
| goal               | string | null: false               |

### Association

- has_many :results
- has_many :reviews
- has_many :comments
- has_many :likes

## results テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| date      | date       | null: false                    |
| game_name | string     | null: false                    |
| event_id  | integer    | null: false                    |
| result    | text       | null: false                    |

### Association

- belongs_to :user

## reviews テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| date     | date       | null: false                    |
| activity | string     | null: false                    |
| review   | text       | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :review

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| like   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :review
