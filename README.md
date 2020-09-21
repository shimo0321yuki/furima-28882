# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| first-name         | string   | null: false |
| family-name        | string   | null: false |
| first-name-kana    | string   | null: false |
| family-name-kana   | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| genre_id        | integer    | null: false                   |
| status_id       | integer    | null: false                   |
| price           | integer    | null: false                   |
| delivery-fee_id | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| days_id         | integer    | null: false                   |
| user            | reference  | null: false ,foreign_key: true|

### Association

- has_one :purchaser
- belongs_to:user

##  purchaser テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_many :orders

## order テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| prefecture_id   | integer   | null: false                    |
| postal          | string    | null: false                    |
| city            | string    | null: false                    |
| address         | string    | null: false                    |
| building-number | string    |                                |
| phone           | string    | null: false                    |
| purchaser       | reference | null: false ,foreign_key: true |


### Association
- belongs_to :purchaser

## mypage テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user            | reference | null: false ,foreign_key: true |
| item            | reference | null: false ,foreign_key: true |
| order           | reference | null: false ,foreign_key: true |
| purchaser       | reference | null: false ,foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :order
- belongs_to :purchaser


記述すること	　　　　　　|備考
アプリケーション名       |	
アプリケーション概要      |このアプリケーションでできることを記述しましょう。
URL	                  |デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
テスト用アカウント	     |ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
利用方法	             |このアプリケーションの利用方法を説明しましょう。
目指した課題解決	      |このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
洗い出した要件	        |スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
データベース設計	ER図等を添付しましょう。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

