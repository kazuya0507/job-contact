## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|
|string|name|
|attachment|string|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
belongs_to :group
belongs_to :user


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index :true|
|password|string|null: false, default: ""|
### Association
has_many :groups_users
has_many :grups, through: :groups_users
has_many :messages
has_many :calenders
has_many :time_cards


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, unique: true|
## Association
has_many :groups_users
has_many :users, through: groups_users
has_many :messages


## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
belongs_to :group
belongs_to :user