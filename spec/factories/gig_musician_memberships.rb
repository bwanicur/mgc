FactoryBot.define do
  factory :gig_musician_membership do
    gig { FactoryBot.create(:gig) }
    musician { FactoryBot.create(:musician) }
    confirmation_token { SecureRandom.hex }
    confirmed_at "2018-05-31 19:55:18"
  end
end
