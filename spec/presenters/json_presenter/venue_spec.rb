require 'rails_helper'

describe JsonPresenter::Venue do
  
  describe '#atts' do
    it "should return a hash of specific attributes" do
      venue = FactoryBot.build(:venue)
      res = described_class.new(venue).atts
      expect(res[:name]).to eq(venue.name)
      expect(res[:lat]).to eq(venue.lat)
      expect(res[:lng]).to eq(venue.lng)
      expect(res[:address1]).to eq(venue.address1)
      expect(res[:address2]).to eq(venue.address2)
      expect(res[:city]).to eq(venue.city)
      expect(res[:state]).to eq(venue.state)
      expect(res[:zipcode]).to eq(venue.zipcode)
      expect(res[:phone]).to eq(venue.phone)
      expect(res[:email]).to eq(venue.email)
      expect(res[:website]).to eq(venue.website)
    end

  end

end
