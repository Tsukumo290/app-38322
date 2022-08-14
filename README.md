## usersテーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
|name               | string | null: false               |
|email              | string | null: false, unique: true |
|encrypted_password | string | null: false               |

### association
- has_many :closets


## closetsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| brand     | string     | null: false                    |
| price     | integer    | null: false                    |
| genre_id  | integer    | null: false                    |
| color_id  | integer    | null: false                    |
| season_id | integer    | null: false                    |
| size_id   | integer    | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### association
- belongs_to :user