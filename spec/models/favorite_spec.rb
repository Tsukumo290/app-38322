require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favo = FactoryBot.build(:favorite)
  end

  describe '着用回数機能' do
    context '回数を増やすことができる場合' do
      it "user_idとcloset_idがあれば保存できる" do
        expect(@favo).to be_valid
      end
    end

    context '回数を増やすことができない場合' do
      it 'userが紐付いていないと保存できない' do
        @favo.user = nil
        @favo.valid?
        expect(@favo.errors.full_messages).to include('User must exist')
      end

      it 'closetが紐付いていないと保存できない' do
        @favo.closet = nil
        @favo.valid?
        expect(@favo.errors.full_messages).to include('Closet must exist')
      end
    end
  end
end
