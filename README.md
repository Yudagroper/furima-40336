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
has_many :markets
has_many :receipts

## markets テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| goods            | string     | null: false                    |
| explan           | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
has_one :receipt
belongs_to :user

## receipts テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| market    | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :market
has_one :buy

## buys テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| receipt            | references | null: false, foreign_key: true |

### Association
belongs_to :receipt