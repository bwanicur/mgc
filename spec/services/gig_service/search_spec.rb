require 'rails_helper'

describe GigService::Search do

  before(:each) do
    @user = FactoryBot.create(:user)
    @venue = FactoryBot.create(:venue)
    @g1 = FactoryBot.create(:gig, user: @user, start_time: Time.zone.now + 1.day, venue: @venue) 
    @g2 = FactoryBot.create(:gig, user: @user, start_time: Time.zone.now + 2.days) 
    @g3 = FactoryBot.create(:gig, user: @user, start_time: Time.zone.now + 3.days, title: 'unique title') 
  end

  describe 'initialize' do
    it "should raise an exception if a user is not passed in" do
      expect { described_class.new(nil, {}) }.to raise_error(GigService::SearchError)
    end
  end

  describe '#run' do
      
    it "should default to current/upcoming gigs ordered by ascending start_time" do
      res = described_class.new(@user).run 
      expect(res.size).to eq(3)
      expect(res[0]).to eq(@g1)
      expect(res[2]).to eq(@g3)
    end

    it "should follow a limit" do
      res = described_class.new(@user, limit: 1).run 
      expect(res.size).to eq(1)
    end

    it "should find gigs by title" do
      res = described_class.new(@user, title: 'unique').run
      expect(res.size).to eq(1)
      expect(res.first).to eq(@g3)
    end

    it "should find gigs by venue" do
      res = described_class.new(@user, venue_id: @venue.id).run
      expect(res.size).to eq(1)
      expect(res.first).to eq(@g1)
    end

  end

end
