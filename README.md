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

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birthday           | date       | null: false               |

has_many :items
has_many :buyers


items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| state_id         | integer       | null: false       |
| postage_id       | integer    | null: false       |
| region_id        | integer     | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

belongs_to :user
has_one :buyer


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
| postal_code  | string  | null: false |
| region       | string  | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | string  | null: false |
|              |         |             |

belongs_to :buyers