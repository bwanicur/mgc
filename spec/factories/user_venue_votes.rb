FactoryBot.define do
  factory :user_venue_vote do
    user_id  { 1 }
    accurate { false }
    corrections { "" }
  end
end
