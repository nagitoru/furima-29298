require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメントの保存' do
    before do
      @user = FactoryBot.create(:user)
      @comment = FactoryBot.build(:comment)
    end
    it '保存できるとき' do
      expect(@comment).to be_valid
    end
    it '保存できないとき' do
      @comment.text = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end
  end
end
