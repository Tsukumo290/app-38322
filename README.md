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

## 実装した機能についての画像やGIFおよびその説明

### ログイン機能
[![Image from Gyazo](https://i.gyazo.com/22db8a585bc6c337da7faa6915bb638f.gif)](https://gyazo.com/22db8a585bc6c337da7faa6915bb638f)

### 新規登録機能
[![Image from Gyazo](https://i.gyazo.com/c08b7adf7ee5968f26f5218ba7bccf3b.gif)](https://gyazo.com/c08b7adf7ee5968f26f5218ba7bccf3b)

### 詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/5a2602f599057c8ac0c74394ab22686d.gif)](https://gyazo.com/5a2602f599057c8ac0c74394ab22686d)

### メモ作成機能
[![Image from Gyazo](https://i.gyazo.com/2e2649fde7c38658f4fe20aa13305e71.gif)](https://gyazo.com/2e2649fde7c38658f4fe20aa13305e71)

### 着用回数カウント機能
[![Image from Gyazo](https://i.gyazo.com/dd894d51f3af873a92addeef0b6201db.gif)](https://gyazo.com/dd894d51f3af873a92addeef0b6201db)

### 削除機能
[![Image from Gyazo](https://i.gyazo.com/e6c7d9816aa07e4aa6503a4f5b32471c.gif)](https://gyazo.com/e6c7d9816aa07e4aa6503a4f5b32471c)

### タブによる表示切り替え
[![Image from Gyazo](https://i.gyazo.com/b27d0f17049ae380521b04238863fe6f.gif)](https://gyazo.com/b27d0f17049ae380521b04238863fe6f)

### 画像の複数保存機能
[![Image from Gyazo](https://i.gyazo.com/9607440c50a8737465a6b3c486507112.gif)](https://gyazo.com/9607440c50a8737465a6b3c486507112)

### 保存したアイテムのグラフ表示
[![Image from Gyazo](https://i.gyazo.com/86937c38f148a2421d0d8d536c9a2706.gif)](https://gyazo.com/86937c38f148a2421d0d8d536c9a2706)

### アイテムを着用回数による表示
[![Image from Gyazo](https://i.gyazo.com/fda95e7b2b4166fda797f198ed13c390.gif)](https://gyazo.com/fda95e7b2b4166fda797f198ed13c390)

### レスポンシブデザイン(スマホ対応)
[![Image from Gyazo](https://i.gyazo.com/9a63a8f1b20227f18a1ec5c06e2ca65e.gif)](https://gyazo.com/9a63a8f1b20227f18a1ec5c06e2ca65e)

## 実装予定の機能
着用していないアイテムを手放せるように、サイト内にフリマを行えるページを作成しようと考えています。

## データベース設計
![ER](https://user-images.githubusercontent.com/109210394/188795394-848d9918-1a3b-45ea-9ae5-0684a45966c3.png)

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

## 工夫したポイント
広く普及しているアプリからデザインを参考にし、見やすく、直感的に使いやすいデザインを意識しました。

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