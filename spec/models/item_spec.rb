require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '商品の保存がうまくいくとき' do
      it 'すべての値が正しく保存されていれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品の保存がうまくいかないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと登録できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円以上9999999円以下にしてください')
      end
      it 'priceが300円未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円以上9999999円以下にしてください')
      end
      it 'priceが10,000,000円を超過すると登録できないこと' do
        @item.price = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円以上9999999円以下にしてください')
      end
      it 'genreを選択していないと登録できないこと' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre を選択してください")
      end
      it 'statusを選択していないと登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を選択してください")
      end
      it 'postageが選択していないと登録できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage を選択してください")
      end
      it 'placeが選択していないと登録できないこと' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place を選択してください")
      end
      it 'delivery_dayが選択していないと登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day を選択してください")
      end
    end
  end
end
