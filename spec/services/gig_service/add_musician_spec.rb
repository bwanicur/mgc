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

    it "should return errors on the GigMusicianMembership object" do
      atts.delete(:musician_id)
      gmm = described_class.new(atts).run
      expect(gmm.errors).to_not be_empty
      expect(gmm.errors.first.first).to eq(:musician_id)
    end

  end

end
