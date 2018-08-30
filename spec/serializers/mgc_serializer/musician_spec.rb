require 'rails_helper'

describe MGCSerializer::Musician do

  describe '#as_hash' do
    it "should return a hash of specific attributes" do
      instrument = FactoryBot.create(:instrument)
      m = FactoryBot.build(:musician, instrument: instrument)
      res = described_class.new(m).as_hash
      expect(res[:email]).to eq(m.email)
      expect(res[:instrument]).to eq(instrument.name)
      expect(res[:phone]).to eq(m.phone)
    end
  end
end
