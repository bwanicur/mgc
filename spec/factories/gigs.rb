FactoryBot.define do
  factory :gig do
    region
    user
    venue
    sequence(:title) { |n| "Test Gig #{n}" }
    date { Date.today + 5.days }
    start_time { "7 pm" }
    end_time { "10 pm" }
  end
end
