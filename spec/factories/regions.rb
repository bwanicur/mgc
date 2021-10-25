FactoryBot.define do
  factory :region do
    sequence(:code) { |n| "test-reg-#{n}" }
    sequence(:name) { |n| "Test Region #{n}"}
  end
end
