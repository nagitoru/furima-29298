FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    genre_id { 2 }
    status_id { 2 }
    postage_id { 2 }
    place_id { 2 }
    delivery_day_id { 2 }
    price { 2000 }
    association :user
  end
end
