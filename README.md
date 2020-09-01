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
| birthday           | integer  | null: false |

### Association

- has_many :item
- has_many :good

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name_id         | integer    | null: false |
| genre_id        | integer    | null: false |
| status_id       | integer    | null: false |
| price           | integer    | null: false |
| delivery-fee_id | integer    | null: false |
| area_id         | string     | null: false |
| days_id         | date       | null: false |
| user_id         | references | null: false |

### Association

- has_many :good
- belongs_to:user

## goods テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :good
- belongs_to :user
- has_one_to :information

## information テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| prefecture_id | integer | null: false |
| postal        | integer | null: false |
| city          | string  | null: false |
| address       | integer | null: false |
| phone         | integer | null: false |


### Association

- belongs_to :good