require 'rails_helper'

describe EmailGigInvitationJob do

  after { allow(GigInvitationMailer).to receive(:invite_email).and_call_original }

  describe '#perform_later' do
    let(:gmm) { FactoryBot.create(:gig_musician_membership, email_count: 1) }
    it "should decrement the email_count if the email_delivery fails" do
      allow(GigInvitationMailer).to receive(:invite_email) do
        raise Net::SMTPFatalError.new('Test error')
      end
      expect(gmm.email_count).to eq(1)
      described_class.perform_later(gmm)
      expect(gmm.reload.email_count).to eq(0)
    end
  end

end
