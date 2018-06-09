require 'rails_helper'

describe VenueService::Search do
  
  describe '.initialize' do
    it "should raise an exception if the name is not present" do
      expect { described_class.new }.to raise_error(VenueService::SearchError)
    end
  end

  describe '#run' do

    before(:each) do
      @v1 = FactoryBot.create(:venue, state: 'CA', city: 'San Diego')
      @v2 = FactoryBot.create(:venue, state: 'CA', city: 'Solana Beach')
      @v3 = FactoryBot.create(:venue, state: 'NV', city: 'Nevada City')
      @v4 = FactoryBot.create(:venue, name: 'Different Name', state: 'NV', city: 'Las Vegas')
    end
    
    it "should find venues by name" do
      res = described_class.new(name: 'test').run
      expect(res.count).to eq(3)
      expect(res).to include(@v1)
      expect(res).to include(@v2)
      expect(res).to include(@v3)
    end

    it "should find venues by name and city" do
      res = described_class.new(name: 'test', city: 'Solana Beach').run
      expect(res.first).to eq(@v2)
    end

    it "should find venues by name and state" do
      res = described_class.new(name: 'test', state: 'NV').run
      expect(res.first).to eq(@v3)
    end

    it "should find venues by name, city, and state" do
      res = described_class.new(name: 'different', state: 'NV', city: 'las vegas').run
      expect(res.first).to eq(@v4)
    end

  end

end
