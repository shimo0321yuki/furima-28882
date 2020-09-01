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

| Column          | Type     | Options                       |
| --------------- | -------- | ----------------------------- |
| name            | string   | null: false                   |
| genre_id        | integer  | null: false ,foreign_key: true|
| status_id       | integer  | null: false ,foreign_key: true|
| price           | integer  | null: false                   |
| delivery-fee_id | integer  | null: false ,foreign_key: true|
| user_id         | integer  | null: false ,foreign_key: true|

### Association

- have_one :good
- belongs_to:user

## goods テーブル

| Column    | Type   | Options                        |
| --------- | ------ | ------------------------------ |
| user_id   | string | null: false, foreign_key: true |
| item_id   | string | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## information テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| prefecture_id | integer | null: false ,foreign_key: true |
| postal        | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| phone         | string  | null: false                    |
| goods_id      | string  | null: false ,foreign_key: true |


### Association

- belongs_to :good