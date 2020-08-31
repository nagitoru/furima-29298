class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :place
  belongs_to_active_hash :delivery_day
end