FactoryBot.define do
  factory :gig do
    region
    user
    venue
    sequence(:title) {|n| "Test Gig #{n}" }
    start_time { Time.zone.now.beginning_of_hour }
    end_time { Time.zone.now.beginning_of_hour + 3.hours }
  end
end
