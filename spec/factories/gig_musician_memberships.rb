FactoryBot.define do
  factory :gig_musician_membership do
    gig { FactoryBot.create(:gig) }
    musician { FactoryBot.create(:musician) }
    confirmation_token { SecureRandom.hex }
  end
end
