FactoryBot.define do
  factory :musician do
    association :user
    email { Faker::Internet.email }
    full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    phone { Faker::PhoneNumber.phone_number }
  end
end
