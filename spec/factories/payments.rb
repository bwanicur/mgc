FactoryBot.define do
  factory :payment do
    gig_musician_membership_id { 1 }
    amount { "9.99" }
    confirmation_token  { "MyString" }
    confirmed_at  { Time.zone.now }
  end
end
