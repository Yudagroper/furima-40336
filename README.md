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
# README
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| handle_name        | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| furigana_last      | string  | null: false               |
| furigana_first     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
has_many :markets,
has_many :receipts,

## markets テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| goods         | string     | null: false                    |
| explan        | text       | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_days | string     | null: false                    |
| prefecture    | string     | null: false                    |
| price         | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
has_many :receipts,
belong_to :user

## receipts テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| market_id | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
belong_to :user
belong_to :market
has_one :buys

## buys テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| receipt_id         | references | null: false, foreign_key: true |

### Association
has_one :buys