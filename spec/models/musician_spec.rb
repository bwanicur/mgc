require 'rails_helper'

describe Musician do

  describe 'custom validations' do
    it "should only save digits and require phone numbers to have a length of 10" do
      musician = FactoryBot.create(:musician, phone: '111-111-1111')
      expect(musician.phone).to eq('1111111111')
      musician = FactoryBot.create(:musician, phone: '   111.111.1111')
      expect(musician.phone).to eq('1111111111')
    end
  end

end
