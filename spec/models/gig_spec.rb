require 'rails_helper'

describe Gig do

  describe '#save' do
    it 'should create a random priv_hash before saving' do
      gig = FactoryBot.build(:gig, priv_hash: nil)
      gig.save
      expect(gig.priv_hash).to be_present
    end
  end
  
  context 'Scopes' do
    it "upcoming: gigs that have started within the past 4 hours and beyond"
  end
  

end
