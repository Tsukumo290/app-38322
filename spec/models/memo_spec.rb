require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe 'メモ作成機能' do
    context 'メモが作成できる場合' do
      it 'contentが存在していれば保存できる' do
        expect(@memo).to be_valid
      end
    end

    context 'メモが作成できない場合' do
      it 'contentが空では保存できない' do
        @memo.content = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Content can't be blank")
      end
      it 'closetが紐付いていないと保存できない' do
        @memo.closet = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include('Closet must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @memo.user = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include('User must exist')
      end
    end
  end
  
end
