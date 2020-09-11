class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :place
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円以上9999999円以下にしてください' }
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :genre_id
    validates :status_id
    validates :postage_id
    validates :place_id
    validates :delivery_day_id
  end
end
