FactoryBot.define do
  factory :venue do
    user
    sequence(:name) { |n| "Test Venue #{n}" }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
  end
end
