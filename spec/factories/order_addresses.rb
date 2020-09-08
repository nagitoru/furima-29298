FactoryBot.define do
  factory :order_address do
    token { '4242424242424242' }
    postal_code { '999-9999' }
    place_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    association :user
    association :item
  end
end
