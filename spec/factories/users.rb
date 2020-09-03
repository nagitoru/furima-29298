FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password = 'hiu9870'
    password { password }
    password_confirmation { password }
    first_name { '鈴木' }
    last_name { '太郎' }
    first_name_reading { 'スズキ' }
    last_name_reading { 'タロウ' }
    birthday { '1985-08-17' }
  end
end
