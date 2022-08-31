require 'rails_helper'

RSpec.describe Closet, type: :model do

  before do
    @closet = FactoryBot.build(:closet)
    @closet.image = fixture_file_upload('app/assets/images/closet.png')
  end

  describe '新規登録機能' do

    context '新規登録できる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@closet).to be_valid
      end
    end

    context '新規登録ができない場合' do

      # 入力欄が空の場合のバリデーション検証
      it 'imageが空だと出品できない' do
        @closet.image = nil
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Image can't be blank")
      end
      it 'brandが空では出品できない' do
        @closet.brand = ''
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Brand can't be blank")
      end
      it 'priceが空では出品できない' do
        @closet.price = ''
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Price can't be blank")
      end
      it 'genre_idが未選択では出品できない' do
        @closet.genre_id = 0
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Genre can't be blank")
      end
      it 'color_idが未選択では出品できない' do
        @closet.color_id = 0
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Color can't be blank")
      end
      it 'season_idが未選択では出品できない' do
        @closet.season_id = 0
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Season can't be blank")
      end
      it 'size_idが未選択では出品できない' do
        @closet.size_id = 0
        @closet.valid?
        expect(@closet.errors.full_messages).to include("Size can't be blank")
      end

      # priceのバリデーション検証
      it 'priceが全角数字だと出品できない' do
        @closet.price = '１１１１'
        @closet.valid?
        expect(@closet.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @closet.price = 10000000
        @closet.valid?
        expect(@closet.errors.full_messages).to include('Price out of setting range')
      end

      # brandのバリデーション検証
      it 'brandが41文字以上だと出品できない' do
        @closet.brand = 'a' * 41
        @closet.valid?
        expect(@closet.errors.full_messages).to include('Brand is too long (maximum is 40 characters)')
      end

      # アソシエーションの確認
      it 'userが紐付いていないと保存できない' do
        @closet.user = nil
        @closet.valid?
        expect(@closet.errors.full_messages).to include('User must exist')
      end

    end
  end
end
