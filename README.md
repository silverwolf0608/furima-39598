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

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nick_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| kana_first_name     | string     | null: false                    |
| kana_last_name      | string     | null: false                    |
| birthday            | date       | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |

### Association
- has_many :purchase record
- has_many :items



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null; false                    |
| shipping charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase record



## adressテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null :false                    |
| prefecture_id       | integer    | null :false                    |
| municipalities      | string     | null :false                    |
| street_address      | string     | null :false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null :false, foreign_key: true |

### Association
- belongs_to :purchase record



## purchase recordテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null :false, foreign_key: true |
| item                | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address