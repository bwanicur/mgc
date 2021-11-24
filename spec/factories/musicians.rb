FactoryBot.define do
  factory :musician do
    association :user
    instrument { %w[Horn Bass Drums Keys Vocals Guitar].sample }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip }
    phone { "111-111-1111" }
  end
end
