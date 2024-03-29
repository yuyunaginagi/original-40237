require 'rails_helper'

RSpec.describe Result, type: :model do
  before do
    @result = FactoryBot.build(:result)
  end

  describe '競技結果投稿' do
    context '投稿できるとき' do
      it 'date、game_name、event_id、resultが存在すれば投稿できる' do
        expect(@result).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'dateが空では登録できない' do
        @result.date = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("日付を入力してください")
      end

      it 'game_nameが空では登録できない' do
        @result.game_name = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("大会名を入力してください")
      end

      it 'event_idが空では登録できない' do
        @result.event_id = 1
        @result.valid?
        expect(@result.errors.full_messages).to include("種目を選んでください")
      end

      it 'resultが空では登録できない' do
        @result.result = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("記録を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @result.user = nil
        @result.valid?
        expect(@result.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
