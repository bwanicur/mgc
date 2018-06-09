FactoryBot.define do
  factory :musician do
    association :user  
    association :instrument, strategy: :build
    email { Faker::Internet.email } 
    first_name { Faker::Name.first_name } 
    last_name { Faker::Name.last_name } 
    address1 { Faker::Address.street_address } 
    city { Faker::Address.city } 
    state { Faker::Address.state } 
    zipcode { Faker::Address.zip } 
    phone1 { Faker::PhoneNumber.phone_number }  
  end
end
