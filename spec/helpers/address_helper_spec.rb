require 'rails_helper'

describe AddressHelper do

  let(:venue) do
    FactoryBot.build(:venue,
      address1: '111 Test Street',
      address2: 'Suite 1',
      city: 'Testville',
      state: 'CA',
      zipcode: '92101'
    )
  end

  describe "#full_address" do
    it "should should concatenate address1, address2, city, state, zipcode" do
      str = '111 Test Street Suite 1 Testville CA 92101'
      expect(helper.full_address(venue)).to eq(str)
    end
  end
end
