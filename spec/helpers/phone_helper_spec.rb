require 'rails_helper'

describe PhoneHelper do

  describe '#phone_with_country_code' do
    it "should append '+1' to the phone number - currently only supporting USA" do
      phone_number = '9999999999'
      expect(helper.phone_with_country_code(phone_number)).to eq('+19999999999')
    end
  end
end
