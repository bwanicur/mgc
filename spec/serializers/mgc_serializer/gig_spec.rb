# frozen_string_literal: true

require "rails_helper"

describe MGCSerializer::Gig do

  describe "#as_hash" do
    it "should return a hash of specific attributes" do
      skip "TODO: decide how we want to nest venue and musicians data"
      gig = FactoryBot.build(:gig)
      res = described_class.new(gig).as_hash
      expect(res[:title]).to eq(gig.title)
      expect(res[:start_time]).to eq(gig.start_time)
      expect(res[:venue][:name]).to be_present
      expect(res[:musicians]).to eq([])
    end
  end
end
