require 'rails_helper'

describe MGCSerializer::User do

  describe '#as_hash' do
    it "should return a hash of specific attributes" do
      user = FactoryBot.build(:user)
      pending('Mock the avatar image... (all other attirbutes covered by Person serializer)')
    end

  end

end
