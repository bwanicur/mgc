FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'testing123'
    password_confirmation 'testing123'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip }
    phone '111-111-1111'

    after(:create) do |user, _evaluator|
      FactoryBot.create(:musician,
        user: user,
        linked_user_id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        address1: user.address1,
        city: user.city,
        state: user.state,
        zipcode: user.zipcode
      )
    end
  end
end
