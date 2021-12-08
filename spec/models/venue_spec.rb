require "rails_helper"

describe Venue do
  describe "after_validation" do
    it "should geocode the address if any of the address attributes have changed" do
      venue = FactoryBot.create(:venue)
      mock_atts = TestGeocoder.mock_atts
      expect(venue.latitude).to eq(mock_atts["latitude"])
      expect(venue.longitude).to eq(mock_atts["longitude"])
    end

    it "should not run if the address not has changed" do
      venue = FactoryBot.build(:venue)
      allow(venue).to receive(:address_has_changed?) { false }
      expect(venue).to_not receive(:full_address)
      venue.save
    end
  end

  describe "#address_has_changed?" do
    it "should return true if any of the address attributes have been updated" do
      venue = FactoryBot.build(:venue)
      expect(venue.address_has_changed?).to eq(true)
      venue.update_attribute(:name, "New Name")
      expect(venue.address_has_changed?).to eq(false)
      venue.address1 = "999 New Street"
      expect(venue.address_has_changed?).to eq(true)
    end
  end

  describe "#full_address" do
    it "should return the full address" do
      venue = FactoryBot.build(
        :venue,
        address: "111 Test Street",
        city: "Testville",
        state: "CA",
        zipcode: "92101"
      )
      expect(venue.full_address).to eq("111 Test Street Testville CA 92101")
    end
  end

end
