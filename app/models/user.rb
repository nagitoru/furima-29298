class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字と数字を両方とも含んでください'

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字・ひらがな・カタカナのいずれかで入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字・ひらがな・カタカナのいずれかで入力してください' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  end
end
