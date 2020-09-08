require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @another_user = FactoryBot.build(:user)
      @order_address = FactoryBot.build(:order_address, user_id: @another_user.id, item_id: @item.id)
    end

    context '購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく保存されていれば登録できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入情報の保存がうまくいかないとき' do
      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '9999000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'placeを選択していないと保存できないこと' do
        @order_address.place_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Place Select')
      end
      it 'cityが空では保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9文字以下では保存できないこと' do
        @order_address.phone_number = 123_456_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
      it 'phone_numberが12文字以上だと保存できないこと' do
        @order_address.phone_number = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
      it 'phone_numberに-(ハイフン)があると保存できないこと' do
        @order_address.phone_number = 123 - 4567 - 8901
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
    end
  end
end
