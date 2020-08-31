require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it "すべての値が正しく入力されていれば登録できること" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが保存できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字が混合していないときは登録できないこと" do
        @user.password = 123123
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが5文字以下では登録できないこと" do
        @user.password = 12345
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it "first_nameが全角日本語でないと登録できないこと" do
        @user.first_name = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name Full-width characters")
      end
      it "last_nameが空だと登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it "lasr_nameが全角日本語でないと登録できないこと" do
        @user.last_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name Full-width characters")
      end
      it "first_name_readingが空だと登録できないこと" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name reading can't be blank")
      end
      it "fist_name_readingが全角カタカナでないと登録できないこと" do
        @user.first_name_reading = "すずき"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name reading Full-width katakana characters")
      end
      it "last_name_readingが空だと登録できないこと" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name reading can't be blank")
      end
      it "last_name_readingが全角カタカナでないと登録できないこと" do
        @user.last_name_reading = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name reading Full-width katakana characters")
      end
      it "birthdayを選択していなければ登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
    end
  end
end