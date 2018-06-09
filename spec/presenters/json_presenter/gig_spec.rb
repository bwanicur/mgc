require 'rails_helper'

describe JsonPresenter::Gig do
  
  describe '#atts' do

    it 'should return a hash of specific attributes' do
      gig = FactoryBot.build(:gig)
      res = described_class.new(gig).atts
      expect(res[:title]).to eq(gig.title)
      expect(res[:start_time]).to eq(gig.start_time)
      expect(res[:venue][:name]).to be_present
      expect(res[:musicians]).to eq([]) 
    end

  end

end
