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

    it "should create a user with an associated linked musician" do
      user = service.run(instrument.id)
      linked_musician = user.self_linked_musician
      expect(linked_musician).to be_truthy
      expect(linked_musician.email).to eq(user.email)
    end

    it "should record errors" do
      user_atts.delete(:email)
      user = described_class.new(user_atts).run(instrument.id)
      expect(user.errors.size > 0).to  be_truthy
    end

  end

end
