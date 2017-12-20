# VERSION

* Ruby version

  ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]

* Rails version

  Rails 5.0.6

# DATABASE

## messageテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|string||
|------|timestamps|null: false|

### Association
- belongs_to :group
- belongs_to :user


## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|------|timestamps|null: false|

### Association
- has_many :groups, through: :group_users
- has_many :group_users


## groupテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
|------|timestamps|null: false|


### Association
- has_many :users, through: :group_users
- has_many :group_users


## group_userテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
|------|timestamps|null: false|

### Association
- belongs_to :group
- belongs_to :user

