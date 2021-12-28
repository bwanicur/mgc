# frozen_string_literal: true

require "rails_helper"

describe AddressHelper do

  let(:venue) do
    FactoryBot.build(
      :venue, {
        address: "111 Test Street",
        city:    "Testville",
        state:   "CA",
        zipcode: "92101"
      }
    )
  end

  describe "#full_address" do
    it "should should concatenate address1, address2, city, state, zipcode" do
      str = "111 Test Street Testville CA 92101"
      expect(helper.full_address(venue)).to eq(str)
    end
  end
end
