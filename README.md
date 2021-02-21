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


users テーブル

| Column          | Type       | Options                   |
| --------------- | ---------- | ------------------------- |
| nickname        | string     | null: false               |
| email           | string     | null: false, unique: true |
| password        | string     | null: false               |
| last_name       | string     | null: false               |
| first_name      | string     | null: false               |
| last_name_kana  | string     | null: false               |
| first_name_kana | string     | null: false               |
| birthday        | integer    | null: false               |

has_many :items
has_many :buyers


items テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| image         |            | null: false       |
| name          | string     | null: false       |
| description   | text       | null: false       |
| category      | string     | null: false       |
| state         | text       | null: false       |
| postage       | string     | null: false       |
| region        | string     | null: false       |
| shipping_date | string     | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

belongs_to :users
has_one :buyers


buyers テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |
|            |            |                   |
|            |            |                   |
|            |            |                   |
|            |            |                   |

belongs_to :items
belongs_to :users
has_one :shippings


shippings テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| municipality | string  | null: false |
| address      | integer | null: false |
| phone_number | integer | null: false |
|              |         |             |

belongs_to :buyers