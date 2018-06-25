require 'rails_helper'

describe SmsGigInvitationJob do

  let(:gmm) { FactoryBot.create(:gig_musician_membership, sms_count: 1) }

  describe '#perform_later' do
    it "descrement the GigMusicianMembership sms_counter if the task fails" do
      allow_any_instance_of(GigService::SmsInvitation).to receive(:run) do
        { success: false }
      end
      expect(gmm.sms_count).to eq(1)
      res = described_class.perform_later(gmm)
      expect(gmm.reload.sms_count).to eq(0)
    end
  end

end
