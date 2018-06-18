FactoryBot.define do
  factory :gig do
    association :user
    association :venue
    is_template false
    sequence(:title) {|n| "Test Gig #{n}" }
    start_time { Time.zone.now.beginning_of_hour }
    end_time { Time.zone.now.beginning_of_hour + 3.hours }
    priv_hash { SecureRandom.hex }
  end
end
