# VERSION

* Ruby version

  ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]

* Rails version

  Rails 5.0.6

# DATABASE

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
|------|timestamps|null: false|

### Association
- belongs_to :group
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|------|timestamps|null: false|

### Association
- has_many :groups, through: :group_users
- has_many :group_users
- has_many :messages


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
|------|timestamps|null: false|

### Association
- has_many :users, through: :group_users
- has_many :group_users
- has_many :messages


## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
|------|timestamps|null: false|

### Association
- belongs_to :group
- belongs_to :user
