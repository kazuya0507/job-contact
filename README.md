## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|
|body|text|
|data|string|
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


## calendersテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, default: ""|
|content|text|null: false, default: ""|
|password|string|null: false, default: ""|
|start_date|datetime|null: false, default: ""|
|end_date|datetime|null: false, default: ""|
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user


## time_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|year|integer|default: ""|
|month|integer|default: ""|
|day|integer|default: ""|
|in_at|datetime|
|out_at|datetime|
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user