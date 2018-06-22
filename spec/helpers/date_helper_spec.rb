require 'rails_helper'

describe DateHelper do

  let(:date_obj) { DateTime.parse('2018-06-20 09:00:00 UTC') }

  describe '#date_time_full' do
    it "should return the weekday and full date time" do
      expect(helper.date_time_full(date_obj)).to eq('Wednesday 6/20/2018 9:00am')
    end
  end

  describe '#date_time_abbrev' do
    it "should return the date time with hours and minutes" do
      expect(helper.date_time_abbrev(date_obj)).to eq('Wed 6/20/2018 9:00am')
    end
  end

  describe '#time_only' do
    it "should return the time - hours and minutes" do
      expect(helper.time_only(date_obj)).to eq('9:00am')
    end
  end

  describe '#date_only' do
    it "should return the date - day/month/year" do
      expect(helper.date_only(date_obj)).to eq('6/20/2018')
    end
  end

end
