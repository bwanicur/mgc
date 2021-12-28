# frozen_string_literal: true

require "rails_helper"

describe MGCSerializer::Musician do
  describe "#as_hash" do
    it "should return a hash of specific attributes" do
      m = FactoryBot.build(:musician)
      res = described_class.new(m).as_hash
      expect(res[:id]).to eq(m.id)
      expect(res[:email]).to eq(m.email)
      expect(res[:instrument]).to eq(m.instrument)
      expect(res[:full_name]).to eq(m.full_name)
      expect(res[:address]).to eq(m.address)
      expect(res[:city]).to eq(m.city)
      expect(res[:state]).to eq(m.state)
      expect(res[:zipcode]).to eq(m.zipcode)
      expect(res[:phone]).to eq(m.phone)
    end
  end
end
