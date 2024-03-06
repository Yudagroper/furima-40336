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
| first_name         | string  | null: false,              |
| furigana_last      | string  | null: false               |
| furigana_first     | string  | null: false,              |
| birthday           | integer | null: false,              |

## markets テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| goods      | string     | null: false                    |
| explan     | text       | null: false                    |
| rate       | integer    | null: false                    |
| users      | references | null: false, foreign_key: true |


## markets_users テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| markets | references | null: false, foreign_key: true |
| users   | references | null: false, foreign_key: true |

## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| markets   | references | null: false, foreign_key: true |
| users     | references | null: false, foreign_key: true |

## buys テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | integer    | null: false,                   |
| date_of_expiry     | integer    | null: false,                   |
| security_code      | integer    | null: false                    |
| postcode           | integer    | null: false                    |
| municipalities     | string     | null: false,                   |
| street_address     | string     | null: false                    |
| building_name      | string     | null: false,                   |
| telephone_number   | integer    | null: false,                   |
| markets            | references | null: false, foreign_key: true |
| users              | references | null: false, foreign_key: true |
