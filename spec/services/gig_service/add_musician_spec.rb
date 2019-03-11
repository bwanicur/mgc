require 'rails_helper'

describe GigService::AddMusician do

  describe '#run' do
    let(:gig) { FactoryBot.create(:gig) }
    let(:musician) { FactoryBot.create(:musician, user: gig.user) }
    let(:atts) do
      {
        gig_id: gig.id,
        musician_id: musician.id,
        payment_amount_cents: 10000
      }
    end

    it "should create a GigMusicianMembership and associated (pending) Payment" do
      gmm = described_class.new(atts).run
      expect(gmm.id).to be_present
      expect(gmm.payment.amount.to_s).to eq('100.00')
      expect(gmm.payment.confirmed_at).to be_nil
    end

    it "should raise some ActiveRecord::RecordInvalid exceptions"
  end

end
