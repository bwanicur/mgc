require "rails_helper"

describe GigService::Create do

  let(:user) { FactoryBot.create(:user) }
  let(:venue) { FactoryBot.create(:venue) }
  let(:gig_atts) do
    atts = FactoryBot.attributes_for(:gig)
    atts[:venue_id] = venue.id
    atts[:user_id] = user.id
    atts
  end

  describe "#run" do
    it "should create gig data" do
      gig = described_class.new(gig_atts).run
      expect(gig).to be_truthy
    end

    it "should add musicians to a gig" do
      musicians = [
        FactoryBot.create(:musician, user: user),
        FactoryBot.create(:musician, user: user)
      ]
      gig = described_class.new({gig: gig_atts, musicians: musicians}).run
      expect(gig).to be_truthy
      expect(gig.musicians.count).to eq(2)
    end

    it "should raise ActiveRecord::RecordInvalid errors"
  end

end
