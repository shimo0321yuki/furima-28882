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

- has_many :items
- has_many :goods

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| genre        | string  | null: false |
| comment      | string  | null: false |
| status       | string  | null: false |
| price        | integer | null: false |
| delivery-fee | integer | null: false |
| area         | string  | null: false |
| days         | integer | null: false |

### Association

- has_many :goods
- belongs_to:users 

## goods テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :goods
- belongs_to :user
- has_one_to :information

## information テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| credit  | string  | null: false |
| address | string  | null: false |
| postal  | integer | null: false |
| phone   | integer | null: false |


### Association

- belongs_to :goods