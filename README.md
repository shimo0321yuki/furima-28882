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
- has_many :goods

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

- has_one :good
- belongs_to:user

##  purchaser テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order

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

- belongs_to :good