## アプリケーション名
CLouck

## アプリケーション概要
クローゼットの中身をPC・スマホで視覚化し、ファッションアイテムを管理することができるアプリです。

## URL
https://app-38322.herokuapp.com

## テスト用アカウント
- Basic認証ID：nobita
- Basic認証パスワード：0807
- メールアドレス：test@email
- パスワード：test290

## 利用方法

### 服の保存
1.フッターにある服アイコンから新規保存を行う。  
2.新規保存ボタンから、服の詳細（画像・ブランド名・購入金額・カテゴリー・カラー・シーズン・サイズ）を入力し保存する。

## アプリケーションを作成した背景
外出時に自分の持っているアイテムを確認したくクローゼットの中身を管理するアプリを開発しました。

## 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1qFj1h-h8T4_inN-g-0uMeaXYFrt2IoJgWKWf-TA8VkY/edit#gid=982722306)

<!-- ## 実装した機能についての画像やGIFおよびその説明 -->


<!-- ## 実装予定の機能 -->

## データベース設計
![ER](https://user-images.githubusercontent.com/109210394/188787976-9cb4ded7-cffa-40ef-852e-ca8a922d4c1b.png)

## 画面遷移図
![Screen](https://user-images.githubusercontent.com/109210394/188795170-141844bd-27e6-4129-a153-11031fa560fd.png)

## 開発環境
- フロントエンド  
  HTML&CSS/JavaScript/jQuery
- バックエンド  
  Ruby/Ruby on Rails
- インフラ  
  Heroku/Amazon S3
- データベース  
  MySQL
- テキストエディタ  
  Visual Studio Code
- タスク管理  
  GitHub

<!-- ## 工夫したポイント -->

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