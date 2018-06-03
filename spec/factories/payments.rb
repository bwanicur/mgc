FactoryBot.define do
  factory :payment do
    user_id 1
    gig_musician_membership_id 1
    amount "9.99"
    confirmation_token "MyString"
    confirmed_at "2018-05-31 20:07:44"
  end
end
