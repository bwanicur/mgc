require 'rails_helper'

describe GigMusicianMembership do

  describe "#save" do
    it "should set the confirmation_token" do
      gig = FactoryBot.build(:gig_musician_membership, confirmation_token: nil)
      expect(gig.save).to be_truthy
      expect(gig.confirmation_token).to be_present
    end
  end
end
