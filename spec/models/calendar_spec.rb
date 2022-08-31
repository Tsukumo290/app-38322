require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @calendar = FactoryBot.build(:calendar)
    @calendar.images = [ fixture_file_upload('app/assets/images/closet.png') ]
  end

  describe 'コーデ作成機能' do
    context 'コーデが作成できる場合' do
      it 'start_timeとimagesが存在していれば保存できる' do
        expect(@calendar).to be_valid
      end
    end
    context 'コーデが作成できない場合' do
      it 'start_timeが空では保存できない' do
        @calendar.start_time = ''
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Start time can't be blank")
      end
      it 'imageが空では保存できない' do
        @calendar.images = nil
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Images can't be blank", "Images は1枚以上6枚以下にしてください")
      end
      it '画像が7枚以上だと保存できない' do
        @calendar.images = [ fixture_file_upload('app/assets/images/closet.png') ] * 7
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Images は1枚以上6枚以下にしてください")
      end
      it 'userが紐付いていないと保存できない' do
        @calendar.user = nil
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include('User must exist')
      end
    end
  end
end
