class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :place_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を正確に入力してください' }
  validates :place_id, numericality: { other_than: 1, message: 'を選択してください' }
  with_options presence: true do
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'を正確に入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, place_id: place_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
