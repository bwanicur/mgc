require 'rails_helper'

describe NameHelper do

  let(:musician) do
    FactoryBot.build(:musician, first_name: 'billy', last_name: 'pilgrim')
  end

  describe "#last_name_init" do
    it "should return and capitalize the first name and last initial" do
      m = FactoryBot.build(:musician, first_name: 'billy', last_name: 'pilgrim')
      expect(helper.last_name_init(musician)).to eq('Billy P')
    end
  end

  describe "#full_name" do
    it "should return and capitalize the first name and last name" do
      m = FactoryBot.build(:musician, first_name: 'billy', last_name: 'pilgrim')
      expect(helper.full_name(musician)).to eq('Billy Pilgrim')
    end
  end

end
