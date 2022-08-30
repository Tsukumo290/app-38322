# ER図
![Closet_ER](https://user-images.githubusercontent.com/109210394/187550180-6f345ecd-ad58-421b-822f-f592575d3459.png)

## usersテーブル

| Column            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
|name               | string  | null: false               |
|email              | string  | null: false, unique: true |
|encrypted_password | string  | null: false               |
|prefecture_code    | integer |                           |

### association
- has_many :closets
- has_many :memos
- has_many :favorites
- has_many :calendars


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
- has_many :memos
- has_many :favorites


## memosテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
|content   | string     | null: false                    |
|user_id   | references | null: false, foreign_key: true |
|closet_id | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :closet


## favoritesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
|user_id   | references | null: false, foreign_key: true |
|closet_id | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :closet


## calendarsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
|start_time | datetime   | null: false                    |
|user_id    | references | null: false, foreign_key: true |

### association
- belongs_to :user