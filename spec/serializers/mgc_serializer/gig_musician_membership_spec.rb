require 'rails_helper'

describe MGCSerializer::GigMusicianMembership do

  describe '#as_hash' do

    it 'should return a hash of specific attributes' do
      gmm = FactoryBot.build(:gig_musician_membership)
      res = described_class.new(gmm).as_hash
      expect(res[:gig_id]).to be_present
      expect(res[:musician_id]).to be_present
      expect(res[:confirmation_status]).to be_present
    end

  end

end
