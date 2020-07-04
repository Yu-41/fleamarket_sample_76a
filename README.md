## アプリケーション情報
### アプリケーション概要
- フリーマーケットのアプリケーションを作成しました。
- 担当箇所  
【マークアップ】ユーザーマイページ  
【サーバサイド】商品出品機能  
【サーバサイド】商品検索Lv1  
- 接続先情報
- URL http://54.248.57.191/
- ID/Pass
- ID: admin
- Pass: password
### テスト用アカウント等
- 購入者用
- メールアドレス: buyer_user@gmail.com
- パスワード: buyer_user
- 購入用カード情報
- 番号：4242424242424242
- 期限：6/20
- セキュリティコード：123
- 出品者用
- メールアドレス名: seller_user@gmail.com
- パスワード: seller_user

## 開発状況
## 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
### 開発期間と平均作業時間
- 開発期間：約4週間
- 1日あたりの平均作業時間：約9時間
### 開発体制
- 人数：6名
- アジャイル型開発（スクラム）
- Trelloによるタスク管理

## 動作確認方法
- Chromeの最新版を利用してアクセスしてください。
- ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性がございます。
### 出品方法は以下の手順で確認できます
- テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 購入方法は以下の手順で確認できます
- テストアカウントでログイン→トップページから商品検索→商品選択→商品購入
- 確認後、ログアウト処理をお願いします。


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|string|null: false|
|phone_number|string|null: false|
|gender|integer|null: false|
|introduction|text|
|user_image|string|

### Association
- has_one :addresses
- has_many :items
- has_many :comments
- has_one :credit_card, dependent: :destroy

### index
- add_index: [:nickname, :gender]

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null:false|
|postal_code|string|null:false|
|city|string|null:false|
|local|string|null:false|
|house_number|string|null:false|
|building_name|string|
|phone_number|integer|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

### index
- add_index: [:city, :user_id]

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|card_id|integer|null:false|
|customer_id|integer|null:false|

### Association
- belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:：false|
|description|text|null: false|
|size|string|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|condition_id|integer|null: false|
|postage|integer|null: false|
|prefecture_id|integer|null: false|
|wait|string|null: false|
|price|integer|null: false|
|buyer_id|integer|

### Association
- belongs_to :user
- has_many :comments 
- has_many :images
- belongs_to :brand
- belongs_to :category
- has_many :images, dependent: :destroy
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :brand


### index
- add_index: [:name, :price]

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user 
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item, optional: true


### Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items

### index
- add_index: [:gender, :name]


## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items
