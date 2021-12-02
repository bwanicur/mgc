FactoryBot.define do
  factory :musician do
    association :user
    email { Faker::Internet.email }
    full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    instrument { %w[Horn Bass Drums Keys Vocals Guitar].sample }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip }
    phone { "111-111-1111" }
  end
end
