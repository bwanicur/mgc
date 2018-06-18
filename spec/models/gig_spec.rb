require 'rails_helper'

describe Gig do

  describe '#save' do
    it 'should create a random priv_hash before saving' do
      gig = FactoryBot.build(:gig, priv_hash: nil)
      gig.save
      expect(gig.priv_hash).to be_present
    end
  end

end
