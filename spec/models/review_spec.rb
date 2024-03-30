require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '振り返り投稿' do
    context '投稿できるとき' do
      it 'date、activity、reviewが存在すれば投稿できる' do
        expect(@review).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'dateが空では登録できない' do
        @review.date = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("日付を入力してください")
      end

      it 'activityが空では登録できない' do
        @review.activity = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("練習内容・競技内容を入力してください")
      end

      it 'reviewが空では登録できない' do
        @review.review = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("振り返りを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end

