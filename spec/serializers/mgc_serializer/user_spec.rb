# frozen_string_literal: true

require "rails_helper"

describe MGCSerializer::User do
  describe "#as_hash" do
    it "should return a hash of specific attributes" do
      user = FactoryBot.build(:user)
      res = described_class.new(m).as_hash
      expect(res[:id]).to eq(user.id)
      expect(res[:email]).to eq(user.email)
      expect(res[:first_name]).to eq(user.first_name)
      expect(res[:last_name]).to eq(user.last_name)
      expect(res[:address1]).to eq(user.address1)
      expect(res[:address2]).to eq(user.address2)
      expect(res[:city]).to eq(user.city)
      expect(res[:state]).to eq(user.state)
      expect(res[:zipcode]).to eq(user.zipcode)
      expect(res[:phone]).to eq(user.phone)
    end
  end
end
