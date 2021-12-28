# frozen_string_literal: true

require "rails_helper"

describe MGCSerializer::Venue do

  describe "#as_hash" do
    it "should return a hash of specific attributes" do
      venue = FactoryBot.build(:venue)
      res = described_class.new(venue).as_hash
      expect(res[:name]).to eq(venue.name)
      expect(res[:latitude]).to eq(venue.latitude)
      expect(res[:longitude]).to eq(venue.longitude)
      expect(res[:address]).to eq(venue.address1)
      expect(res[:city]).to eq(venue.city)
      expect(res[:state]).to eq(venue.state)
      expect(res[:zipcode]).to eq(venue.zipcode)
      expect(res[:phone]).to eq(venue.phone)
      expect(res[:email]).to eq(venue.email)
      expect(res[:website]).to eq(venue.website)
    end

  end

end
