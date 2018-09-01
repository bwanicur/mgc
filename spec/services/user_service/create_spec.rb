require 'rails_helper'

describe UserService::Create do
  describe '#run' do
    let(:user_atts) { FactoryBot.attributes_for(:user) }
    let(:service) { described_class.new(user_atts) }
    let(:instrument) { FactoryBot.create(:instrument) }

    it "should create a user" do
      user = service.run(instrument.id)
      expect(user).to be_truthy
    end

    it "should create a user with an associated linked musician when given an instrument_id"

    it "should record errors" do
      user_atts.delete(:email)
      user = described_class.new(user_atts).run(instrument.id)
      expect(!user.errors.empty?).to be_truthy
    end
  end
end
