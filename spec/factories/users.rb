FactoryBot.define do
  factory :user do
    region
    email { Faker::Internet.email }
    password  { 'testing123' }
    password_confirmation { 'testing123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip }
    phone { '111-111-1111' }
  end
end
